local multiplier = BAI.Language == "thai" and 2 or 1

function HUDAssaultCorner:InitText()
    local const = pdth_hud.constants
    local icon_assaultbox = self._hud_panel:child("assault_panel"):child("icon_assaultbox")
    local captain_assembled = self._hud_panel:child("assault_panel"):text({
        name = "captain_fully_assembled",
        text = managers.localization:text("hud_captain_active"),
        blend_mode = "normal",
        layer = 1,
        color = Color.red,
        font_size = const.assault_font_size,
        font = tweak_data.menu.small_font,
        visible = false
    })

    managers.hud:make_fine_text(captain_assembled)
    captain_assembled:set_center_x(icon_assaultbox:center_x())
    captain_assembled:set_top(icon_assaultbox:center_y() - const.assault_y_offset + 20)
end

function HUDAssaultCorner:UpdatePONRBox()
    if not self._point_of_no_return then
        local const = pdth_hud.constants
        self._noreturn_color = BAI:GetColor("escape_box")
        if self._hud_panel:child("point_of_no_return_panel") then
            self._hud_panel:remove(self._hud_panel:child("point_of_no_return_panel"))
        end
        local point_of_no_return_panel = self._hud_panel:panel({
            visible = false,
            name = "point_of_no_return_panel",
        })

        local point_of_no_return_text = point_of_no_return_panel:text({
            name = "point_of_no_return_text",
            text = "",
            blend_mode = "normal",
            layer = 1,
            color = self._noreturn_color,
            font_size = const.no_return_t_font_size,
            font = tweak_data.menu.small_font
        })
        point_of_no_return_text:set_text(managers.localization:text("time_escape"))
        managers.hud:make_fine_text(point_of_no_return_text)
        point_of_no_return_text:set_right(point_of_no_return_panel:w())
        point_of_no_return_text:set_top(0)

        local point_of_no_return_timer = point_of_no_return_panel:text({
            name = "point_of_no_return_timer",
            text = "",
            blend_mode = "normal",
            layer = 1,
            color = self._noreturn_color,
            font_size = const.no_return_timer_font_size,
            font = tweak_data.menu.small_font
        })
        managers.hud:make_fine_text(point_of_no_return_timer)
        point_of_no_return_timer:set_right(point_of_no_return_text:right())
        point_of_no_return_timer:set_top(point_of_no_return_text:bottom())
    end
end

function HUDAssaultCorner:SetImage(image)
end

function HUDAssaultCorner:set_buff_enabled(buff_name, enabled)
    local assembled = self._hud_panel:child("assault_panel"):child("captain_fully_assembled")
    assembled:set_visible(enabled)
    if enabled and not self.dont_move then -- 7.5 = offset
        assembled:set_top(self._hud_panel:child("assault_panel"):child("control_assault_title"):top() + assembled:h() + 7.5 - (21 - self:UpdateAssaultTextFontSize(nil, assembled, true)))
        self.dont_move = true
    end
end

local _BAI_start_assault_callback = HUDAssaultCorner.start_assault_callback
function HUDAssaultCorner:start_assault_callback()
    _BAI_start_assault_callback(self)
    if not self:GetEndlessAssault() then
        if BAI.settings.show_assault_states then
            if self.is_host or (self.is_client and self.multiplayer_game) then
                if BAI:IsStateEnabled("build") then
                    self:UpdateAssaultText("hud_build", BAI.settings.show_advanced_assault_info)
                end
            end
        end
    end
end

function HUDAssaultCorner:_start_assault(text_list)
    local assault_panel = self._hud_panel:child("assault_panel")
    local control_assault_title = assault_panel:child("control_assault_title")
    local icon_assaultbox = assault_panel:child("icon_assaultbox")
    local num_hostages = self._hud_panel:child("num_hostages")
    local casing_panel = self._hud_panel:child("casing_panel")
    local started_now = not self._assault
    self._assault = true
    assault_panel:set_visible(true)
    num_hostages:set_alpha(0.7)
    casing_panel:set_visible(false)
    self._is_casing_mode = false
    
    local color, text
    if self._assault_endless then
        color = self._assault_endless_color
        text = "hud_endless"
    else
        color = self._assault_color
        text = "hud_assault"
    end
    
    if self._assault_mode == "phalanx" then
        color = self._vip_assault_color
        text = "hud_captain"
        if BAI:IsHostagePanelHidden("captain") then
            self:_hide_hostages()
        end
    end

    self:UpdateAssaultText(text)
    self._fx_color = color

    self:_update_assault_hud_color(color)
    
    assault_panel:animate(callback(self, self, "flash_assault_title"), true)
    
    if BAI:IsHostagePanelHidden(self.assault_type) then
        self:_hide_hostages()
    end

    if alive(self._wave_bg_box) then
        self._wave_bg_box:stop()
        self._wave_bg_box:animate(callback(self, self, "_animate_wave_started"), self)
    end

    if not self._assault_endless and BAI.settings.show_advanced_assault_info and self.assault_type then
        self:AddHook()
        self:ChangeAdvancedAssaultInfoVisibility(true)
        self:UpdateAdvancedAssaultInfoPosition(control_assault_title)
    end

    if BAI.settings.show_assault_states then
        if self.is_skirmish and self.show_popup then
            self:_popup_wave_started()
            self.show_popup = false
        end
    else
        if self.is_skirmish and started_now then
            self:_popup_wave_started()
            self.show_popup = false
        end
    end
end

function HUDAssaultCorner:_start_endless_assault(text_list)
    self._assault_endless = true
    self.assault_type = "endless_assault"
    self:_start_assault(text_list)
    self:_update_assault_hud_color(self._assault_endless_color)
    self:ChangeAdvancedAssaultInfoVisibility(false)
    self:RemoveHook()
end

function HUDAssaultCorner:sync_set_assault_mode(mode)
    if self._assault_mode == mode then
        return
    end
    self._assault_mode = mode
    local text = "hud_assault"
    local color = self._assault_color
    if mode == "phalanx" then
        color = self._vip_assault_color
        text = "hud_captain"
    end
    self._fx_color = color
    self:_update_assault_hud_color(color)
    
    self:UpdateAssaultText(text)
    self._assault_vip = mode == "phalanx"

    if mode == "phalanx" then
        if BAI:IsHostagePanelHidden("captain") then
            self:_hide_hostages()
        end
        self:ChangeAdvancedAssaultInfoVisibility(false)
        self:RemoveHook()
        self._assault_endless = false
    else
        if BAI:IsHostagePanelVisible("assault") then
            self:_show_hostages()
            if BAI.settings.show_advanced_assault_info then
                self:AddHook()
                self:ChangeAdvancedAssaultInfoVisibility(true)
            end
        end
    end
    
    if BAI.settings.show_assault_states then
        if mode ~= "phalanx" then
            if self.is_host then
                self:UpdateAssaultState("fade") -- When Captain is defeated, Assault state is automatically set to Fade state
            end
        end
    end
end

function HUDAssaultCorner:show_point_of_no_return_timer()
    local delay_time = self._assault and 1.2 or 0
    local point_of_no_return_panel = self._hud_panel:child("point_of_no_return_panel")
    point_of_no_return_panel:stop()
    point_of_no_return_panel:animate(callback(self, self, "_animate_show_noreturn"), delay_time)
    self._point_of_no_return = true
    self:_close_assault_box()
end

local _f_update_assault_hud_color = HUDAssaultCorner._update_assault_hud_color
function HUDAssaultCorner:_update_assault_hud_color(color)
    _f_update_assault_hud_color(self, color)
    local BAI_color = BAI.settings.hud.pdth_hud_reborn.color
    local assault_panel = self._hud_panel:child("assault_panel")
    local control_assault_title = assault_panel:child("control_assault_title")
    control_assault_title:set_color(BAI.settings.hud.pdth_hud_reborn.custom_text_color and (Color(255, BAI_color.r, BAI_color.g, BAI_color.b) / 255) or color)
    assault_panel:child("captain_fully_assembled"):set_color(BAI.settings.hud.pdth_hud_reborn.custom_text_color and (Color(255, BAI_color.r, BAI_color.g, BAI_color.b) / 255) or color)
    --assault_panel:child("assault_time_left"):set_color(BAI.settings.hud.pdth_hud_reborn.custom_text_color and (Color(255, BAI_color.r, BAI_color.g, BAI_color.b) / 255) or color)
    --assault_panel:child("assault_spawns_left"):set_color(BAI.settings.hud.pdth_hud_reborn.custom_text_color and (Color(255, BAI_color.r, BAI_color.g, BAI_color.b) / 255) or color)
end

function HUDAssaultCorner:_end_assault()
    local assault_panel = self._hud_panel:child("assault_panel")
    local control_assault_title = assault_panel:child("control_assault_title")
    local icon_assaultbox = assault_panel:child("icon_assaultbox")
    local num_hostages = self._hud_panel:child("num_hostages")
    num_hostages:set_alpha(1)
    if not self._assault then
        return
    end
    self._assault = false
    self._assault_endless = false
    self.assault_type = nil
    
    if BetterLightFX then
        BetterLightFX:EndEvent("AssaultIndicator")
    end
    
    if self:should_display_waves() then
        self.wave_survived = true
        self:_update_assault_hud_color(self._assault_survived_color)
        self:UpdateAssaultText("hud_survived")
        self._wave_bg_box:stop()
        self._wave_bg_box:animate(callback(self, self, "_animate_wave_completed"), self)
        if self.is_skirmish then
            self:_popup_wave_finished()
            self.show_popup = true
        end
    else
        if BAI.settings.show_wave_survived then
            self.wave_survived = true
            self:_update_assault_hud_color(self._assault_survived_color)
            self:UpdateAssaultText("hud_survived")
            assault_panel:animate(callback(self, self, "_animate_normal_wave_completed"), self)
        else
            if BAI.settings.show_assault_states then
                if self.is_host or (self.is_client and self.multiplayer_game) then
                    self:UpdateAssaultStateOverride("control")
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
    
    if BAI:IsHostagePanelVisible() then
        self:_show_hostages()
    end

    self:RemoveHook()
    self:ChangeAdvancedAssaultInfoVisibility(false)
end

function HUDAssaultCorner:_close_assault_box()
    local assault_panel = self._hud_panel:child("assault_panel")
    assault_panel:set_visible(false)
    assault_panel:stop()
end

function HUDAssaultCorner:AddHook()
    --managers.hud:add_updator("BAI_UpdateAAI", HUDAssaultCorner.UpdateAdvancedAssaultInfo)
end

function HUDAssaultCorner:RemoveHook()
    --managers.hud:remove_updator("BAI_UpdateAAI")
end

function HUDAssaultCorner:_hide_hostages()
    self._hud_panel:child("num_hostages"):hide()
end

function HUDAssaultCorner:_show_hostages()
    self._hud_panel:child("num_hostages"):show()
end

function HUDAssaultCorner:_set_hostage_offseted(is_offseted)
    self:start_assault_callback()
end

function HUDAssaultCorner:ChangeAdvancedAssaultInfoVisibility(check)
    --[[local assault_panel = self._hud_panel:child("assault_panel")
    if check then
        if self.show_spawns_left then
            assault_panel:child("assault_spawns_left"):set_visible(true)
        end
        if self.show_time_left then
            assault_panel:child("assault_time_left"):set_visible(true)
        end
    else -- Hide them
        assault_panel:child("assault_time_left"):set_visible(false)
        assault_panel:child("assault_spawns_left"):set_visible(false)
    end]]
end

function HUDAssaultCorner:UpdateAssaultText(text, override)
    local text_title = self._hud_panel:child("assault_panel"):child("control_assault_title")
    local length = utf8.len(managers.localization:text(text))
    if length > 8 then
        self:UpdateAssaultTextFontSize(text, text_title)
        if not BAI:IsOr(text, "hud_control", "hud_anticipation") then
            self:UpdateAdvancedAssaultInfoPosition(text_title, override)
        end
        return
    else
        text_title:set_font_size(22 * multiplier * pdth_hud.Options:GetValue("HUD/Scale"))
    end
    text_title:set_text(utf8.to_upper(managers.localization:text(text)))
    managers.hud:make_fine_text(text_title)
    text_title:set_center_x(self._hud_panel:child("assault_panel"):child("icon_assaultbox"):center_x())
    --text_title:set_center_y(self._hud_panel:child("assault_panel"):child("icon_assaultbox"):center_y())
    if not BAI:IsOr(text, "hud_control", "hud_anticipation") then
        self:UpdateAdvancedAssaultInfoPosition(text_title, override)
    end
end

function HUDAssaultCorner:UpdateAdvancedAssaultInfoPosition(text_title, override)
    --[[local assault_panel = self._hud_panel:child("assault_panel")
    local const = pdth_hud.constants
    if override then
        self:ChangeAdvancedAssaultInfoVisibility(true)
    end
    if BAI.settings.show_advanced_assault_info then
        local size
        if self.show_spawns_left then
            size = self:UpdateAssaultTextFontSize(nil, assault_panel:child("assault_spawns_left"), true)
            assault_panel:child("assault_spawns_left"):set_top(text_title:top() - assault_panel:child("assault_spawns_left"):h() - self.offset + (21 - size))
        end
        if self.show_time_left then
            size = self:UpdateAssaultTextFontSize(nil, assault_panel:child("assault_time_left"), true)
            assault_panel:child("assault_time_left"):set_top(text_title:top() + assault_panel:child("assault_time_left"):h() + self.offset - (21 - size)) -- I suck at math
        end
    end]]
end

function HUDAssaultCorner:UpdateAssaultTextFontSize(text, text_title, aai)
    local assault_box_icon = self._hud_panel:child("assault_panel"):child("icon_assaultbox")
    local scale = pdth_hud.Options:GetValue("HUD/Scale")
    local n = 0
    for i = 21, 1, -1 do --Start at 21, end at 1, step by -1
        text_title:set_font_size(i * multiplier * scale)
        if not aai then
            text_title:set_text(utf8.to_upper(managers.localization:text(text)))
        end
        managers.hud:make_fine_text(text_title)
        text_title:set_center_x(assault_box_icon:center_x())
        --text_title:set_center_y(assault_box_icon:center_y())
        if text_title:w() < assault_box_icon:w() then
            n = i -- Exit from loop, because the text is now fully visible and not cut off.
            break
        end
    end
    return n
end

function HUDAssaultCorner:UpdateAssaultState(state)
    if not self._assault_vip and not self._assault_endless and not self._point_of_no_return then
        if BAI.settings.show_assault_states then
            if state and self.assault_state ~= state then
                self.assault_state = state
                if state == "build" then
                    self:_update_assault_hud_color(BAI:GetStateColor(state))
                    return
                end
                if state == "anticipation" and self.is_client and not self.multiplayer_game then
                    return
                end
                if self.send_assault_state and state ~= "control" then
                    LuaNetworking:SendToPeers("BAI_AssaultState", state)
                end
                if BAI:IsStateDisabled(state) then
                    if BAI:IsOr(state, "control", "anticipation") then
                        if self._assault then
                            self._assault = false
                            self:_close_assault_box()
                        end
                    else
                        if self._assault then
                            if BAI.settings.show_advanced_assault_info then
                                self:_set_text_list(self:_get_assault_strings_info())
                            else
                                self:_set_text_list(self:_get_assault_strings())
                            end
                            self:_update_assault_hud_color(self._assault_color)
                            self:UpdateAssaultText("hud_assault")
                        end
                    end
                    return
                end
                if BAI:IsOr(state, "control", "anticipation") then
                    if not self._assault then
                        self.show_popup = false
                        self:_start_assault(self:_get_state_strings(state))
                        --self:_set_hostage_offseted(true)
                        self:UpdateAssaultText("hud_" .. state)
                        self.show_popup = true
                    else
                        if state == "anticipation" then
                            self:_set_text_list(self:_get_state_strings(state))
                            self:UpdateAssaultText("hud_anticipation")
                        end
                    end
                else
                    if BAI.settings.show_advanced_assault_info then
                        self:_set_text_list(self:_get_assault_state_strings_info(state))
                    else
                        self:_set_text_list(self:_get_assault_state_strings(state))
                    end
                    self:UpdateAssaultText("hud_" .. state)
                end
                self:_update_assault_hud_color(BAI:GetStateColor(state))
            end
        else
            if state and self.assault_state ~= state then
                self.assault_state = state
                if self.send_assault_state and not BAI:IsOr(state, "control", "anticipation", "build") then
                    LuaNetworking:SendToPeers("BAI_AssaultState", state)
                end
            end
        end
    end
end

local _BAI_UpdateAssaultStateOverride = HUDAssaultCorner.UpdateAssaultStateOverride
function HUDAssaultCorner:UpdateAssaultStateOverride(state, override)
    _BAI_UpdateAssaultStateOverride(self, state, override)
    if not self._assault_vip and not self._assault_endless and not self._point_of_no_return then
        if BAI.settings.show_assault_states then
            if state then
                if BAI:IsOr(state, "control", "anticipation") then
                    if BAI:IsStateDisabled(state) then
                        self:_close_assault_box()
                        return
                    end
                    self:UpdateAssaultText("hud_" .. state)
                else
                    if BAI:IsStateDisabled(state) then
                        self:UpdateAssaultText("hud_assault")
                    end
                    self:UpdateAssaultText("hud_" .. state)
                end
            end
        end
    end
end

--local _BAI_SetNormalAssaultOverride = HUDAssaultCorner.SetNormalAssaultOverride
function HUDAssaultCorner:SetNormalAssaultOverride() -- Beneath the Mountain only
    --[[if self.is_host and self.multiplayer_game then
        LuaNetworking:SendToPeers("BAI_Message", "NormalAssaultOverride")
    end]]
    self._assault_endless = false
    if BAI.settings.show_assault_states then
        if self.is_host then
            self:UpdateAssaultStateOverride(managers.groupai:state():GetAssaultState())
        else
            if not self.multiplayer_game then
                self:_update_assault_hud_color(self._assault_color)
                self:_set_text_list(self:_get_assault_strings())
                self:UpdateAssaultText("hud_assault")
            end
        end
    else
        self:_update_assault_hud_color(self._assault_color)
        self:UpdateAssaultText("hud_assault")
        if BAI.settings.show_advanced_assault_info then
            self:_set_text_list(self:_get_assault_strings_info())
        else
            self:_set_text_list(self:_get_assault_strings())
        end
    end
    if BAI:IsHostagePanelVisible("assault") then
        self:_show_hostages()
    else
        self:_hide_hostages()
    end
    if BAI.settings.show_advanced_assault_info then -- Does nothing at the moment
        self:AddHook()
        self:ChangeAdvancedAssaultInfoVisibility(true)
    end
end

function HUDAssaultCorner:UpdateAssaultStateColor(state, force_update)
    if state then
        if BAI:IsStateDisabled(state) then
            return
        end
        self:_update_assault_hud_color(BAI:GetStateColor(state))
        self._hud_panel:child("assault_panel"):child("control_assault_title"):animate(callback(self, self, "_animate_text_change_assault_state"), state)
        if force_update then
            if self.is_host then
                self:UpdateAssaultState(managers.groupai:state():GetAssaultState())
            end
        end
    end
end

function HUDAssaultCorner:UpdateAssaultColor(color, assault_type)
    self:_update_assault_hud_color(BAI:GetColor(state))
    self._hud_panel:child("assault_panel"):child("control_assault_title"):animate(callback(self, self, "_animate_text_change_normal_assault"), assault_type)
end

function HUDAssaultCorner:flash_point_of_no_return_timer(beep)
    self._PoNR_flashing = true
    local const = pdth_hud.constants
    local point_of_no_return_panel = self._hud_panel:child("point_of_no_return_panel")
    local function flash_timer(o)
        local t = 0
        while t < 0.5 do
            t = t + coroutine.yield()
            local n = 1 - math.sin(t * 180)
            local r = math.lerp(self._noreturn_color.r, 1, n)
            local g = math.lerp(self._noreturn_color.g, 0.8, n)
            local b = math.lerp(self._noreturn_color.b, 0.2, n)
            o:set_color(Color(r, g, b))

            if BetterLightFX then
                BetterLightFX:StartEvent("PointOfNoReturn")
                BetterLightFX:SetColor(r, g, b, 1, "PointOfNoReturn")
            end

            o:set_font_size(math.lerp(const.no_return_timer_font_size , const.no_return_timer_font_size_pulse, n))
        end
        if BetterLightFX then
            BetterLightFX:EndEvent("PointOfNoReturn")
        end
    end

    local point_of_no_return_timer = point_of_no_return_panel:child("point_of_no_return_timer")
    point_of_no_return_timer:animate(flash_timer)
end

function HUDAssaultCorner:_set_text_list(text_list)
end