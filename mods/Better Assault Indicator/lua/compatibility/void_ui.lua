function HUDAssaultCorner:UpdatePONRBox()
    if not self._point_of_no_return then
        self._noreturn_color = BAI:GetColor("escape_box")
        self._custom_hud_panel:child("point_of_no_return_panel"):child("noreturnbox_panel"):child("border"):set_color(self._noreturn_color)
        self._custom_hud_panel:child("point_of_no_return_panel"):child("point_of_no_return_timer"):set_color(self._noreturn_color)
    end
end

function HUDAssaultCorner:SetImage(image)
end

function HUDAssaultCorner:_offset_hostage(is_offseted, hostage_panel, big_logo)
    local TOTAL_T = 0.18
    local icons_panel = self._custom_hud_panel:child("icons_panel")
    local panel_right = icons_panel:right()
    local panel_y = icons_panel:y()
    local t = 0
    while TOTAL_T > t do
        local dt = coroutine.yield()
        t = math.min(t + dt, TOTAL_T)
        local lerp = t / TOTAL_T
        if is_offseted then
            if BAI:IsHostagePanelVisible() then
                icons_panel:set_alpha(math.lerp(1,0,lerp))
            end
        else
            if BAI:IsHostagePanelVisible() then
                icons_panel:set_alpha(1)
            end
            icons_panel:set_right(math.lerp(panel_right, self._custom_hud_panel:w(),lerp))
            icons_panel:set_y(math.lerp(panel_y, 0, lerp))
            for _, panels in ipairs(self._icons) do
                panels.panel:set_right(icons_panel:w() - (panels.position - 1) * panels.panel:w() - 4 * (panels.row and panels.row or 0))
                panels.panel:set_y((panels.panel:h() + 3) * (panels.row and panels.row or 0))
            end
        end
        if self._start_assault_after_hostage_offset and lerp > 0.4 then
            self._start_assault_after_hostage_offset = nil
            self:start_assault_callback()
        end
    end    
    if is_offseted then
        if big_logo then wait(0.6) end
        TOTAL_T = 0.3
        t = 0
        icons_panel:set_right(big_logo and self._custom_hud_panel:w() - 75 * self._scale or self._custom_hud_panel:w() - 7 * self._scale)
        icons_panel:set_y(big_logo and 47 * self._scale or 32 * self._scale)
        for _, panels in ipairs(self._icons) do
            panels.panel:set_right(icons_panel:w() - (panels.position - 1) * panels.panel:w() - 4 * (panels.row and panels.row or 0))
            panels.panel:set_y(-panels.panel:h() * panels.position)
        end
        if BAI:IsHostagePanelVisible() then
            icons_panel:set_alpha(1)
        end
        while TOTAL_T > t do
            local dt = coroutine.yield()
            t = math.min(t + dt, TOTAL_T)
            local lerp = t / TOTAL_T
            for _, panels in ipairs(self._icons) do
                panels.panel:set_y(math.lerp(-panels.panel:h() * panels.position, (panels.panel:h() + 3) * (panels.row and panels.row or 0),lerp))
            end
        end
    end
    if BAI:IsHostagePanelVisible() then
        icons_panel:set_alpha(1)
    end
    self:whisper_mode_changed()
    if self._start_assault_after_hostage_offset then
        self._start_assault_after_hostage_offset = nil
        self:start_assault_callback()
    end
    if BAI:IsHostagePanelHidden(self.assault_type) then
        self:_hide_hostages()
    end
end

function HUDAssaultCorner:show_point_of_no_return_timer()
    local delay_time = self._assault and 1.2 or 0
    local point_of_no_return_panel = self._custom_hud_panel:child("point_of_no_return_panel")
    local noreturnbox_panel = point_of_no_return_panel:child("noreturnbox_panel")
    local text_panel = point_of_no_return_panel:child("text_panel")
    text_panel:script().text_list = {}
    local msg = {
        "hud_assault_point_no_return_in",
        "hud_assault_end_line",
        "hud_assault_point_no_return_in",
        "hud_assault_end_line"
    }
    for _, text_id in ipairs(msg) do
        table.insert(text_panel:script().text_list, text_id)
    end
    if noreturnbox_panel:child("text_panel") then
        noreturnbox_panel:child("text_panel"):stop()
        noreturnbox_panel:child("text_panel"):clear()
    else
        noreturnbox_panel:panel({name = "text_panel", x = 19 * self._scale, w = 200 * self._scale})
    end
    
    noreturnbox_panel:child("text_panel"):stop()
    noreturnbox_panel:child("text_panel"):animate(callback(self, self, "_animate_text"), text_panel:script().text_list, self._noreturn_color)
    
    self._point_of_no_return = true

    self:_close_assault_box()

    point_of_no_return_panel:stop()
    point_of_no_return_panel:animate(callback(self, self, "_animate_show_noreturn"), delay_time)

    self:_set_feedback_color(self._noreturn_color)
end

function HUDAssaultCorner:_start_assault(text_list)
    if self._point_of_no_return or self._casing then
        return
    end
    text_list = text_list or {""}
    local assault_panel = self._custom_hud_panel:child("assault_panel")
    local assaultbox_panel = assault_panel:child("assaultbox_panel")
    local icon_assaultbox = assault_panel:child("icon_assaultbox")
    local assaultbox_skulls = assault_panel:child("assaultbox_skulls")
    self._badge = VoidUI.options.show_badge
    if managers.crime_spree:is_active() then
        assaultbox_skulls:set_font_size(15)
        assaultbox_skulls:set_text(managers.crime_spree:server_spree_level())
        local w = select(3, assaultbox_skulls:text_rect())
        if w > assaultbox_skulls:w() then
            assaultbox_skulls:set_font_size(15 * (15 / w))
        end
    end

    self:_set_text_list(text_list)
    local started_now = not self._assault
    self._assault = true
    
    if assaultbox_panel:child("text_panel") then
        assaultbox_panel:child("text_panel"):stop()
        assaultbox_panel:child("text_panel"):clear()
        assaultbox_panel:child("text_panel"):set_w(VoidUI.options.show_badge and assaultbox_panel:w() or assaultbox_panel:w() - 26 * self._scale)
    else
        assaultbox_panel:panel({name = "text_panel", w = VoidUI.options.show_badge and assaultbox_panel:w() or assaultbox_panel:w() - 30 * self._scale})
    end
    local text_panel = assaultbox_panel:child("text_panel")
    
    assault_panel:set_visible(true)
    icon_assaultbox:set_visible(VoidUI.options.show_badge)
    if assaultbox_skulls then 
        assaultbox_skulls:set_visible(VoidUI.options.show_badge)
    end
    icon_assaultbox:stop()
    icon_assaultbox:animate(callback(self, self, "_show_icon_assaultbox"), true)
    assaultbox_panel:stop()
    assaultbox_panel:animate(callback(self, self, "_show_assaultbox"), 0.5, true)
    
    text_panel:stop()
    text_panel:animate(callback(self, self, "_animate_text"), nil, nil, callback(self, self, "assault_attention_color_function"))
    self:_set_feedback_color(self._assault_color)
    self:_update_assault_hud_color(self._assault_color)

    if BAI.settings.show_assault_states then
        if (self.is_safehouse_raid or self.is_skirmish) and self.show_popup then
            self.show_popup = false
            self:_popup_wave_started()
        end
    else
        if (self.is_safehouse_raid or self.is_skirmish) and started_now then
            self:_popup_wave_started()
            self.show_popup = false
        end
    end

    if self._assault_mode == "phalanx" and BAI:IsHostagePanelHidden("captain") then
        self:_hide_hostages()
    end
end

function HUDAssaultCorner:_end_assault()
    if not self._assault then
        self._start_assault_after_hostage_offset = nil
        return
    end
    
    local assault_panel = self._custom_hud_panel:child("assault_panel")
    local assaultbox_panel = assault_panel:child("assaultbox_panel")
    local text_panel = assaultbox_panel:child("text_panel")
    local icon_assaultbox = assault_panel:child("icon_assaultbox")
    self:_set_feedback_color(nil)
    self._assault = false
    local endless_assault = self._assault_endless
    self._assault_endless = false
    self.assault_type = nil
    
    self._remove_hostage_offset = true
    self._start_assault_after_hostage_offset = nil
    local icon_assaultbox = self._custom_hud_panel:child("assault_panel"):child("icon_assaultbox")
    icon_assaultbox:stop()
    icon_assaultbox:animate(callback(self, self, "_show_icon_assaultbox"), true)
    if self:should_display_waves() then
        self:_update_assault_hud_color(self._assault_survived_color)
        self:_set_text_list(self:_get_survived_assault_strings())
        text_panel:stop()
        text_panel:clear()
        text_panel:animate(callback(self, self, "_animate_text"), nil, nil, callback(self, self, "assault_attention_color_function"))
        text_panel:animate(callback(self, self, "_animate_normal_wave_completed"), self)
        if self.is_safehouse_raid or self.is_skirmish then
            self:_popup_wave_finished()
            self.show_popup = true
        end
    else
        if BAI.settings.show_wave_survived then
            self:_update_assault_hud_color(self._assault_survived_color)
            self.wave_survived = true
            if endless_assault then
                self.wave_survived_endless = true
                self:_set_text_list(self:_get_survived_assault_endless_strings())
            else
                self:_set_text_list(self:_get_survived_assault_strings())
            end
            text_panel:stop()
            text_panel:clear()
            text_panel:animate(callback(self, self, "_animate_text"), nil, nil, callback(self, self, "assault_attention_color_function"))
            text_panel:animate(callback(self, self, "_animate_normal_wave_completed"), self)
        else
            if BAI.settings.show_assault_states then
                if self.is_host or (self.is_client and self.multiplayer_game) then
                    self:UpdateAssaultStateOverride("control", true)
                    if BAI:IsHostagePanelVisible() then
                        self:_show_hostages()
                    end
                else
                    self:_close_assault_box()
                end
            else
                self:_close_assault_box()
            end
        end
    end
    if self.is_client then
        if not self.dont_override_endless then
            if self.endless_client and not self._assault_endless then
                self.endless_client = false
            end
        end
    end
end

function HUDAssaultCorner:_hide_icon_assaultbox(icon_assaultbox, big_logo)
    local TOTAL_T = 0.4
    local t = 0
    
    local assault_panel = self._custom_hud_panel:child("assault_panel")
    local assaultbox_skulls = assault_panel:child("assaultbox_skulls")
    local w = icon_assaultbox:w()
    local h = icon_assaultbox:h()
    local center_x = icon_assaultbox:center_x()
    local center_y = icon_assaultbox:center_y()
    local crime_spree = managers.crime_spree:is_active()
    
    if VoidUI.options.show_badge and big_logo then
        while TOTAL_T > t do
            local dt = coroutine.yield()
            t = t + dt
            icon_assaultbox:set_w(math.lerp(w, 60 * self._scale, t / TOTAL_T))
            icon_assaultbox:set_h(math.lerp(h, 70 * self._scale, t / TOTAL_T))
            icon_assaultbox:set_center_x(center_x)
            icon_assaultbox:set_center_y(center_y)
            if assaultbox_skulls then 
                assaultbox_skulls:set_size(icon_assaultbox:w(), icon_assaultbox:h())
                assaultbox_skulls:set_center(icon_assaultbox:center())
                if crime_spree then assaultbox_skulls:set_alpha(math.lerp(1,0, t / TOTAL_T)) end
            end
        end
    end
    
    local TOTAL_T = 0.2
    local t = 0
    icon_assaultbox:set_alpha(1)
    while TOTAL_T > t do
        local dt = coroutine.yield()
        t = t + dt
        icon_assaultbox:set_w(math.lerp(big_logo and 60 * self._scale or 30 * self._scale, big_logo and 70 * self._scale or 35 * self._scale, t / TOTAL_T))
        icon_assaultbox:set_h(math.lerp(big_logo and 70 * self._scale or 30 * self._scale, big_logo and 80 * self._scale or 35 * self._scale, t / TOTAL_T))
        icon_assaultbox:set_center_x(center_x)
        icon_assaultbox:set_center_y(center_y)
        if assaultbox_skulls then 
            assaultbox_skulls:set_size(icon_assaultbox:w(), icon_assaultbox:h())
            assaultbox_skulls:set_center(icon_assaultbox:center())
        end
    end
    if not self._point_of_no_return then
        self:_set_hostage_offseted(false, false)
    else
        self:_set_hostage_offseted(true, true)
    end
    local t = 0
    while TOTAL_T > t do
        local dt = coroutine.yield()
        t = t + dt
        icon_assaultbox:set_w(math.lerp(big_logo and 70 * self._scale or 35 * self._scale, 0, t / TOTAL_T))
        icon_assaultbox:set_h(math.lerp(big_logo and 80 * self._scale or 35 * self._scale, 0, t / TOTAL_T))
        icon_assaultbox:set_center_x(center_x)
        icon_assaultbox:set_center_y(center_y)
        if assaultbox_skulls then 
            assaultbox_skulls:set_size(icon_assaultbox:w(), icon_assaultbox:h())
            assaultbox_skulls:set_center(icon_assaultbox:center())
        end
    end
    
    icon_assaultbox:set_alpha(0)
    if assaultbox_skulls then
        assaultbox_skulls:set_alpha(0)
    end
    if BAI:IsHostagePanelVisible() then
        if not self._casing then
            self:_show_hostages()
        end
    end
end

function HUDAssaultCorner:flash_point_of_no_return_timer(beep)
    local function flash_timer(o)
        local t = 0
        while t < 0.5 do
            t = t + coroutine.yield()
            local n = 1 - math.sin(t * 180)
            local r = math.lerp(self._noreturn_color.r, 1, n)
            local g = math.lerp(self._noreturn_color.g, 0.8, n)
            local b = math.lerp(self._noreturn_color.b, 0.2, n)
            o:set_color(Color(r, g, b))
            o:set_font_size(math.lerp(20 * self._scale, 25 * self._scale, n))
        end
    end
    local point_of_no_return_timer = self._custom_hud_panel:child("point_of_no_return_panel"):child("point_of_no_return_timer")
    point_of_no_return_timer:animate(flash_timer)
end

function HUDAssaultCorner:UpdateAssaultStateColor(state, force_update)
    if state then
        if BAI:IsStateDisabled(state) then
            return
        end
        self:_update_assault_hud_color(BAI:GetStateColor(state))
        self._custom_hud_panel:child("assault_panel"):child("text_panel"):animate(callback(self, self, "_animate_text_change_assault_state"), state)
        if force_update then
            if self.is_host then
                self:UpdateAssaultStateOverride(managers.groupai:state():GetAssaultState())
            end
        end
    end
end

function HUDAssaultCorner:UpdateAssaultStateOverride(state, override)
    if not self._assault_vip and not self._assault_endless and not self._point_of_no_return then
        if BAI.settings.show_assault_states then
            if state then
                if BAI:IsOr(state, "control", "anticipation") then
                    self.assault_state = state
                    if BAI:IsStateDisabled(state) then
                        self:_close_assault_box()
                        return
                    end
                    self._assault = true
                    if override then
                        self:_start_assault(self:_get_state_strings(state))
                    else
                        self:_set_text_list(self:_get_state_strings(state))
                    end
                    self:_update_assault_hud_color(BAI:GetStateColor(state))
                else
                    self.assault_state = state
                    if BAI:IsStateDisabled(state) then
                        self:_update_assault_hud_color(self._assault_color)
                        if BAI.settings.show_advanced_assault_info then
                            self:_set_text_list(self:_get_assault_strings_info())
                        else
                            self:_set_text_list(self:_get_assault_strings())
                        end
                        return
                    end
                    if BAI.settings.show_advanced_assault_info then
                        self:_set_text_list(self:_get_assault_state_strings_info(state))
                    else
                        self:_set_text_list(self:_get_assault_state_strings(state))
                    end
                    self:_update_assault_hud_color(BAI:GetStateColor(state))
                    if self.is_host and self.multiplayer_game then
                        LuaNetworking:SendToPeers("BAI_AssaultStateOverride", state)
                    end
                end
            end
        end
    end
end

function HUDAssaultCorner:UpdateAssaultColor(color, assault_type)
    self:_update_assault_hud_color(BAI:GetColor(color))
    self._custom_hud_panel:child("assault_panel"):child("text_panel"):animate(callback(self, self, "_animate_text_change_normal_assault"), assault_type)
end

function HUDAssaultCorner:_popup_wave_started()
    self:_popup_wave_started(self:wave_popup_string_start(), self.is_skirmish and tweak_data.screen_colors.skirmish_color or Color(255, 255, 0) / 255) -- If Skirmish -> Orange, otherwise Yellow
end

function HUDAssaultCorner:_set_hostages_offseted(is_offseted, big_logo)
    local hostage_panel = self._custom_hud_panel:child("icons_panel"):child("hostages_panel")
    self._remove_hostage_offset = nil
    hostage_panel:stop()
    self._custom_hud_panel:child("icons_panel"):stop()
    hostage_panel:animate(callback(self, self, "_offset_hostages", is_offseted), VoidUI.options.show_badge and (big_logo and big_logo or true) or false)
end

function HUDAssaultCorner:_offset_hostages(is_offseted, hostage_panel, big_logo)
    local TOTAL_T = 0.18
    local icons_panel = self._custom_hud_panel:child("icons_panel")
    local panel_right = icons_panel:right()
    local panel_y = icons_panel:y()
    local t = 0
    while TOTAL_T > t do
        local dt = coroutine.yield()
        t = math.min(t + dt, TOTAL_T)
        local lerp = t / TOTAL_T
        if is_offseted then 
            icons_panel:set_alpha(math.lerp(1,0,lerp))
        else
            icons_panel:set_alpha(1)
            icons_panel:set_right(math.lerp(panel_right, self._custom_hud_panel:w(),lerp))
            icons_panel:set_y(math.lerp(panel_y, 0, lerp))
            for _, panels in ipairs(self._icons) do
                panels.panel:set_right(icons_panel:w() - (panels.position - 1) * panels.panel:w() - 4 * (panels.row and panels.row or 0))
                panels.panel:set_y((panels.panel:h() + 3) * (panels.row and panels.row or 0))
            end
        end
    end	
    if is_offseted then
        if big_logo then wait(0.6) end
        TOTAL_T = 0.3
        t = 0
        icons_panel:set_right(big_logo and self._custom_hud_panel:w() - 75 * self._scale or self._custom_hud_panel:w() - 7 * self._scale)
        icons_panel:set_y(big_logo and 47 * self._scale or 32 * self._scale)
        for _, panels in ipairs(self._icons) do
            panels.panel:set_right(icons_panel:w() - (panels.position - 1) * panels.panel:w() - 4 * (panels.row and panels.row or 0))
            panels.panel:set_y(-panels.panel:h() * panels.position)
        end
        icons_panel:set_alpha(1)
        while TOTAL_T > t do
            local dt = coroutine.yield()
            t = math.min(t + dt, TOTAL_T)
            local lerp = t / TOTAL_T
            for _, panels in ipairs(self._icons) do
                panels.panel:set_y(math.lerp(-panels.panel:h() * panels.position, (panels.panel:h() + 3) * (panels.row and panels.row or 0),lerp))
            end
        end
    end
    icons_panel:set_alpha(1)
end