function HUDAssaultCorner:SetImage(image)
end

local _BAI_start_assault = HUDAssaultCorner._start_assault
function HUDAssaultCorner:_start_assault(text_list)
    _BAI_start_assault(self, text_list)
    if alive(self._bg_box) then
        self._bg_box:stop()
        self._bg_box:child("text_panel"):stop()
        self._bg_box:show()
        self:left_grow(self._bg_box)
        self._bg_box:child("text_panel"):animate(callback(self, self, "_animate_text"), self._bg_box, nil, function() return managers.hud._hud_assault_corner:assault_attention_color_function() end)
        if alive(self._wave_bg_box) then
            self._wave_bg_box:child("bg"):stop()
        end
    end
    if BAI:IsHostagePanelHidden(self.assault_type) then
        self:_hide_hostages()
    end
end

function HUDAssaultCorner:_update_assault_hud_color(color)
    self._current_assault_color = color
    if BAI.settings.hud.holoui_update_text_color then
        self._bg_box:child("text_panel"):animate(callback(self, self, "_animate_text"), nil, nil, callback(self, self, "assault_attention_color_function"))
    end
end

function HUDAssaultCorner:assault_attention_color_function()
    return BAI.settings.hud.holoui.update_text_color and self._current_assault_color or Holo:GetColor("TextColors/Assault")
end

function HUDAssaultCorner:_animate_wave_completed(panel)
    wait(8.6)
    if BAI.settings.show_assault_states then
        if self.is_host or (self.is_client and self.multiplayer_game) then
            self:UpdateAssaultStateOverride("control")
        else
            assault_hud:_close_assault_box()
        end
    else
        assault_hud:_close_assault_box()
    end
    self.wave_survived = false
end

function HUDAssaultCorner:show_point_of_no_return_timer()
    local delay_time = self._assault and 1.2 or 0
    self:_close_assault_box()
    local point_of_no_return_panel = self._hud_panel:child("point_of_no_return_panel")
    self:_hide_hostages()
    point_of_no_return_panel:stop()
    point_of_no_return_panel:animate(callback(self, self, "_animate_show_noreturn"), delay_time)
    self:_set_feedback_color(self._noreturn_color)
    self._point_of_no_return = true
    if BAI.settings.hud.holoui.update_text_color then
        self._noreturn_bg_box:child("point_of_no_return_text"):set_color(self._noreturn_color)
    end
end

function HUDAssaultCorner:flash_point_of_no_return_timer(beep)
    local flash_timer
    if BAI.settings.hud.holoui.update_text_color then
        flash_timer = function(o)
            local t = 0
            while t < 0.5 do
                t = t + coroutine.yield()
                local n = 1 - math.sin(t * 180)
                local r = math.lerp(self._noreturn_color.r, 1, n)
                local g = math.lerp(self._noreturn_color.g, 0.8, n)
                local b = math.lerp(self._noreturn_color.b, 0.2, n)
                o:set_color(Color(r, g, b))
                local font_size = (tweak_data.hud_corner.noreturn_size)
                o:set_font_size(math.lerp(font_size, font_size * 1.25, n))
            end
        end
    else
        flash_timer = function(o)
            local t = 0
            while t < 0.5 do
                t = t + coroutine.yield()
                local font_size = (tweak_data.hud_corner.noreturn_size)
                o:set_font_size(math.lerp(font_size, font_size * 1.25, n))
            end
        end
    end
    local point_of_no_return_timer = self._noreturn_bg_box:child("point_of_no_return_timer")
    point_of_no_return_timer:animate(flash_timer)
end

function HUDAssaultCorner:_show_icon_assaultbox(icon)
    icon:set_alpha(1)
    play_color(this._back_button, BAI.settings.hud.holoui.update_text_color and self._current_assault_color or Holo:GetColor("TextColors/Menu"))
    play_value(this._back_marker, "alpha", 360, {callback = function()
        icon:set_rotation(0)
    end})
end

function HUDAssaultCorner:_set_hostages_offseted(is_offseted)
    local hostage_panel = self._hud_panel:child("hostages_panel")
    self._remove_hostage_offset = nil

    hostage_panel:stop()
    hostage_panel:animate(callback(self, self, "_offset_hostages", is_offseted))

    local wave_panel = self._hud_panel:child("wave_panel")

    if wave_panel then
        wave_panel:stop()
        wave_panel:animate(callback(self, self, "_offset_hostages", is_offseted))
    end
end

function HUDAssaultCorner:_offset_hostages(is_offseted, hostage_panel) -- Just offseting panels, nothing more!
    local TOTAL_T = 0.18
    local OFFSET = self._bg_box:h() + 8
    local from_y = is_offseted and 0 or OFFSET
    local target_y = is_offseted and OFFSET or 0
    local t = (1 - math.abs(hostage_panel:y() - target_y) / OFFSET) * TOTAL_T
    while t < TOTAL_T do
        local dt = coroutine.yield()
        t = math.min(t + dt, TOTAL_T)
        local lerp = t / TOTAL_T
        hostage_panel:set_y(math.lerp(from_y, target_y, lerp))
    end
end