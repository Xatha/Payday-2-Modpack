function HUDAssaultCorner:InitBAI(override)
    self.multiplayer_game = false
    self.send_assault_state = false
    self.was_endless = false
    self.is_client = Network:is_client()
    self.is_host = not self.is_client
    self.assault_state = "nil"
    self.heists_with_fake_endless_assaults = { "framing_frame_1", "gallery", "watchdogs_2", "bph" } -- Framing Frame Day 1, Art Gallery, Watch Dogs Day 2, Hell's Island
    self.assault_type = nil
    self.show_popup = true
    self.is_skirmish = managers.skirmish and managers.skirmish:is_skirmish() or false -- Because MUI is shit
    self.is_crimespree = managers.crime_spree and managers.crime_spree:is_active() or false -- Same as comment above
    self.show_endless_padlock_endline = false
    if self.is_client then
        self.number_of_peers = LuaNetworking:GetNumberOfPeers()
        self.sustain_duration_min_max = {
            40,
            120,
            160
        }
        self.sustain_duration_balance_mul = {
            1,
            1.1,
            1.2,
            1.3
        }
    end
    self._no_endless_assault_override = table.contains(self.heists_with_fake_endless_assaults, Global.game_settings.level_id)
    if self.is_client then -- Safe House Nightmare, The Biker Heist Day 2, Cursed Kill Room, Escape: Garage, Escape: Cafe, Escape: Cafe (Day)
        self.heists_with_endless_assaults = { "haunted", "chew", "hvh", "escape_garage", "escape_cafe", "escape_cafe_day" }
        self.endless_client = table.contains(self.heists_with_endless_assaults, Global.game_settings.level_id)
    else
        if Global.game_settings.level_id == "pbr" then
            dofile(BAI.LuaPath .. "beneath_the_mountain_fix.lua")
        end
    end
    self:ApplyCompatibility(override and 9 or BAI.settings.hud_compatibility, "Vanilla", BAI.settings.hud_compatibility == 1)
    self:ApplyHooks()
    if BAI:IsHostagePanelHidden() then
        self:_hide_hostages()
    end
    self:UpdateColors()
    log("[BAI] Successfully initialized") --Well if the mod doesn't crash above, then this is the good sign that something works here
end

function HUDAssaultCorner:ApplyCompatibility(number, hud_name, detection)
    if number == 1 then
        if VoidUI and VoidUI.options.enable_assault then
            self:ApplyCompatibility(3, "Void UI", detection)
        elseif NepgearsyHUDReborn then
            self:ApplyCompatibility(4, "Nepgearsy HUD Reborn", detection)
        elseif Holo and Holo.Options:GetValue("TopHUD") and Holo:ShouldModify("HUD", "Assault") then
            self:ApplyCompatibility(5, "HoloUI", detection)
        elseif SydneyHUD then
            self:ApplyCompatibility(6, "SydneyHUD", detection)
        elseif PDTHHud and PDTHHud.Options:GetValue("HUD/Assault") and not (restoration and restoration:all_enabled("HUD/MainHUD", "HUD/AssaultPanel")) then
            self:ApplyCompatibility(7, "PD:TH HUD Reborn", detection)
        elseif restoration and restoration:all_enabled("HUD/MainHUD", "HUD/AssaultPanel") then
            self:ApplyCompatibility(8, "Restoration Mod", detection)
        else
            self:ApplyCompatibility(2, hud_name, detection)
        end
        return
    end
    if number == 3 then
        hud_name = "Void UI"
        self.show_endless_padlock_endline = true
        self.is_safehouse_raid = managers.job:current_level_id() == "chill_combat"
        dofile(BAI.CompatibilityPath .. "void_ui.lua")
    elseif number == 4 then
        hud_name = "Nepgearsy HUD Reborn"
        self.show_endless_padlock_endline = true
        self:ApplyHooks(true)
        BAI:Unhook("", "upd_recon_tasks_PostHook") -- Why, just why?
        dofile(BAI.CompatibilityPath .. "nepgearsy_hud_reborn.lua")
    elseif number == 5 then
        hud_name = "HoloUI"
        self.show_endless_padlock_endline = true
        self:ApplyHooks(true)
        BAI:DelayCall("bai_holoui_compatibility", 2, function()
            BAI:Unhook("HoloUI", "start_assault") -- Why, just why?
            BAI:Unhook("HoloUI", "end_assault") -- Why, just why?
            dofile(BAI.CompatibilityPath .. "holoui.lua")
        end)
    elseif number == 6 then
        hud_name = "SydneyHUD"
        self:ApplyHooks(false, true)
        self.center_assault_banner = SydneyHUD:GetOption("center_assault_banner")
        self.show_endless_padlock_endline = self.center_assault_banner
        self.assault_state_sydneyhud = "nil"
        self:_hide_hostages()
        dofile(BAI.CompatibilityPath .. "sydneyhud.lua")
    elseif number == 7 then
        hud_name = "PD:TH HUD Reborn"
        self:ApplyHooks(true)
        dofile(BAI.CompatibilityPath .. "pdth_hud_reborn.lua")
        self:InitText()
    elseif number == 8 then
        hud_name = "Restoration Mod"
        self.show_endless_padlock_endline = true
        self.is_safehouse_raid = managers.job:current_level_id() == "chill_combat"
        dofile(BAI.CompatibilityPath .. "restoration_mod.lua")
        self:UpdateText()
    elseif number == 9 then -- Doesn't need to be in the number == 1 condition because this function is called after MUI is hooked up and running...
        hud_name = "MUI"
        BAI:Unhook("", "BaseNetworkSessionOnLoadComplete_BAI")
        BAI:Unhook("", "NetworkManagerOnPeerAdded_BAI")
        dofile(BAI.CompatibilityPath .. "mui.lua")
        MUIStats:UpdateVariables()
        --MUIStats:InitPanels()
    end
    log("[BAI] " .. (detection and (hud_name == "Vanilla" and ("No HUD detected. ") or (hud_name .. " detected. ")) or "") .. hud_name .. " compatibility applied.")
end

function HUDAssaultCorner:ApplyHooks(override, assault_states, aai)
    if not self.applied then
        if BAI.settings.show_assault_states or override or assault_states then
            dofile(BAI.LuaPath .. "assault_states.lua")
            self.assault_states_hooked = true
        end
        if BAI.settings.show_advanced_assault_info or override or aai then
            dofile(BAI.LuaPath .. "localizationmanager.lua")
            if self.is_client then
                managers.localization:SetClient()
            end
            managers.localization:SetVariables()
            self.advanced_assault_info_hooked = true
        end
        self.applied = true
    end
end

function HUDAssaultCorner:SetTimer()
    if self.is_skirmish then
        self.client_time_left = TimerManager:game():time() + 140 -- Calculated from skirmishtweakdata.lua (2 minutes and 20 seconds); Build: 15s, Sustain: 120s, Fade: 5s
    else
        if self.is_crimespree then
            --local sustain_duration = (self.sustain_duration_min_max[math.clamp(self._wave_number, 1, 3)] * self.sustain_duration_balance_mul[math.clamp(self.number_of_peers, 1, 4)])
            --local difference = managers.modifiers:modify_value("GroupAIStateBesiege:SustainEndTime", sustain_duration) - sustain_duration
            self.client_time_left = TimerManager:game():time() + 240 -- 4 minutes
            -- Doesn't work. Will fix it later.
            -- A month later, still not fixed. I'm a lazy ass
            if managers.crime_spree:server_spree_level() > 500 then
                self.client_time_left = self.client_time_left + 120
            end
            -- And another month later, still not fixed. Lazy this developer is
        else
            -- Build: 35s; Sustain: Depends on number of players and wave intensity (or number); Fade: 5s
            self.client_time_left = TimerManager:game():time() + 35 + (self.sustain_duration_min_max[math.clamp(self._wave_number, 1, 3)] * self.sustain_duration_balance_mul[math.clamp(self.number_of_peers, 1, 4)]) + 5
        end
    end
end

function HUDAssaultCorner:SetTimeLeft(time)
    self.client_time_left = TimerManager:game():time() + time
end

local _f_start_assault = HUDAssaultCorner._start_assault
function HUDAssaultCorner:_start_assault(text_list)
    _f_start_assault(self, text_list)
    if self.was_endless then
        self.was_endless = false
        self:SetImage("assault")
    end
    if BAI.settings.show_assault_states then
        if self.is_skirmish and self.show_popup then
            self.show_popup = false
            self:_popup_wave_started()
        end
    end
end

function HUDAssaultCorner:_start_endless_assault(text_list)
    self._assault_endless = true
    self.assault_type = "endless_assault"
    self:_start_assault(text_list)
    self:SetImage("padlock")
    self:_update_assault_hud_color(self._assault_endless_color)
end

function HUDAssaultCorner:_end_assault()
    if not self._assault then
         self._start_assault_after_hostage_offset = nil
         return             
    end
    self:_set_feedback_color(nil)
    self._assault = false
    local endless_assault = self._assault_endless
    self._assault_endless = false
    self.assault_type = nil
    local box_text_panel = self._bg_box:child("text_panel")
    box_text_panel:stop()
    box_text_panel:clear()
    self._remove_hostage_offset = true
    self._start_assault_after_hostage_offset = nil
    local icon_assaultbox = self._hud_panel:child("assault_panel"):child("icon_assaultbox")
    icon_assaultbox:stop()
    if self:should_display_waves() then
        self.wave_survived = true
        self:_update_assault_hud_color(self._assault_survived_color)
        self:_set_text_list(self:_get_survived_assault_strings())
        box_text_panel:animate(callback(self, self, "_animate_text"), nil, nil, callback(self, self, "assault_attention_color_function"))
        icon_assaultbox:stop()
        icon_assaultbox:animate(callback(self, self, "_show_icon_assaultbox"))
        self._wave_bg_box:stop()
        self._wave_bg_box:animate(callback(self, self, "_animate_wave_completed"), self)
        if self.is_skirmish then
            self:_popup_wave_finished()
            self.show_popup = true
        end
    else
        if BAI.settings.show_wave_survived then
            self:_update_assault_hud_color(self._assault_survived_color)
            self.wave_survived = true
            if endless_assault then
                self.wave_survived_endless = true
                self:SetImage("padlock")
                self:_set_text_list(self:_get_survived_assault_endless_strings())
            else
                self:_set_text_list(self:_get_survived_assault_strings())
            end
            box_text_panel:animate(callback(self, self, "_animate_text"), nil, nil, callback(self, self, "assault_attention_color_function"))
            icon_assaultbox:stop()
            icon_assaultbox:animate(callback(self, self, "_show_icon_assaultbox"))
            box_text_panel:animate(callback(self, self, "_animate_normal_wave_completed"), self)
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

local old_show_icon_assaultbox = HUDAssaultCorner._show_icon_assaultbox
function HUDAssaultCorner:_show_icon_assaultbox(...)
    old_show_icon_assaultbox(self, ...)
    if BAI:IsHostagePanelHidden(self.assault_type) then
        self:_hide_hostages()
    end
end

function HUDAssaultCorner:_hide_icon_assaultbox(icon_assaultbox)
    local TOTAL_T = 1
    local t = TOTAL_T
    while t > 0 do
        local dt = coroutine.yield()
        t = t - dt
        local alpha = math.round(math.abs(math.cos(t * 360 * 2)))
        icon_assaultbox:set_alpha(alpha)
        if self._remove_hostage_offset and t < 0.03 then
            self:_set_hostage_offseted(false)
        end
    end
    if self._remove_hostage_offset then
        self:_set_hostage_offseted(false)
    end
    icon_assaultbox:set_alpha(0)
    if BAI:IsHostagePanelVisible() then
        if not self._casing then
            self:_show_hostages()
        end
    end
end

function HUDAssaultCorner:SetImage(image)
    if image then
        if BAI:IsOr(image, "assault", "padlock") then
            self._hud_panel:child("assault_panel"):child("icon_assaultbox"):set_image("guis/textures/pd2/hud_icon_" .. image .. "box")
            if image == "padlock" then
                self.was_endless = true
            end
        end
    end
end

function HUDAssaultCorner:SetNormalAssaultOverride() -- Beneath the Mountain only
    --[[if self.is_host and self.multiplayer_game then
        LuaNetworking:SendToPeers("BAI_Message", "NormalAssaultOverride")
    end]]
    self:SetImage("assault")
    self._assault_endless = false
    self.was_endless = false
    if BAI.settings.show_assault_states then
        if self.is_host then
            self:UpdateAssaultStateOverride(managers.groupai:state():GetAssaultState())
        else
            if not self.multiplayer_game then
                self:_update_assault_hud_color(self._assault_color)
                self:_set_text_list(self:_get_assault_strings())
            end
        end
    else
        self:_update_assault_hud_color(self._assault_color)
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
end

function HUDAssaultCorner:_get_assault_endless_strings()
    local end_line = "hud_assault_" .. (self.show_endless_padlock_endline and "padlock" or BAI.settings.box.endless_box.padlock_end_line and "padlock" or "end_line")
    if managers.job:current_difficulty_stars() > 0 then
        local ids_risk = BAI.settings.show_difficulty_name_instead_of_skulls and self:GetDifficultyName() or Idstring("risk")
        return {
            "hud_assault_endless",
            end_line,
            ids_risk,
            end_line,
            "hud_assault_endless",
            end_line,
            ids_risk,
            end_line
        }
    else
        return {
            "hud_assault_endless",
            end_line,
            "hud_assault_endless",
            end_line,
            "hud_assault_endless",
            end_line,
        }
    end
end

function HUDAssaultCorner:_get_survived_assault_endless_strings()
    local end_line = "hud_assault_" .. (self.show_endless_padlock_endline and "padlock" or BAI.settings.box.endless_wave_survived_box.padlock_end_line and "padlock" or "end_line")
    if managers.job:current_difficulty_stars() > 0 then
        local ids_risk = BAI.settings.show_difficulty_name_instead_of_skulls and self:GetDifficultyName() or Idstring("risk")
        return {
            "hud_assault_survived_endless",
            end_line,
            ids_risk,
            end_line,
            "hud_assault_survived_endless",
            end_line,
            ids_risk,
            end_line
        }
    else
        return {
            "hud_assault_survived_endless",
            end_line,
            "hud_assault_survived_endless",
            end_line,
            "hud_assault_survived_endless",
            end_line
        }
    end
end

function HUDAssaultCorner:UpdatePONRBox()
    if not self._point_of_no_return then
        self._noreturn_color = BAI:GetColor("escape_box")
        if self._hud_panel:child("point_of_no_return_panel") then
            self._hud_panel:remove(self._hud_panel:child("point_of_no_return_panel"))
        end
        local size = 300
        local point_of_no_return_panel = self._hud_panel:panel({
            name = "point_of_no_return_panel",
            h = 40,
            visible = false,
            w = size,
            x = self._hud_panel:w() - size
        })
        
        local icon_noreturnbox = point_of_no_return_panel:bitmap({
            texture = "guis/textures/pd2/hud_icon_noreturnbox",
            name = "icon_noreturnbox",
            h = 24,
            layer = 0,
            w = 24,
            y = 0,
            visible = true,
            blend_mode = "add",
            halign = "right",
            x = 0,
            valign = "top",
            color = self._noreturn_color
            })
            icon_noreturnbox:set_right(icon_noreturnbox:parent():w())
        self._noreturn_bg_box = HUDBGBox_create(point_of_no_return_panel, {
            x = 0,
            h = 38,
            y = 0,
            w = self._bg_box_size
        }, {
            blend_mode = "add",
            color = self._noreturn_color
        })
        self._noreturn_bg_box:set_right(icon_noreturnbox:left() - 3)
        local w = point_of_no_return_panel:w()
        local size = 200 - tweak_data.hud.location_font_size
        local point_of_no_return_text = self._noreturn_bg_box:text({
            valign = "center",
            vertical = "center",
            name = "point_of_no_return_text",
            blend_mode = "add",
            align = "right",
            text = "",
            y = 0,
            x = 0,
            layer = 1,
            color = self._noreturn_color,
            font_size = tweak_data.hud_corner.noreturn_size,
            font = tweak_data.hud_corner.assault_font
        })
        point_of_no_return_text:set_text(utf8.to_upper(managers.localization:text("hud_assault_point_no_return_in", {time = ""})))
        point_of_no_return_text:set_size(self._noreturn_bg_box:w(), self._noreturn_bg_box:h())
        local point_of_no_return_timer = self._noreturn_bg_box:text({
            valign = "center",
            vertical = "center",
            name = "point_of_no_return_timer",
            blend_mode = "add",
            align = "center",
            text = "",
            y = 0,
            x = 0,
            layer = 1,
            color = self._noreturn_color,
            font_size = tweak_data.hud_corner.noreturn_size,
            font = tweak_data.hud_corner.assault_font
        })
        local _, _, w, h = point_of_no_return_timer:text_rect()
        point_of_no_return_timer:set_size(46, self._noreturn_bg_box:h())
        point_of_no_return_timer:set_right(point_of_no_return_timer:parent():w())
        point_of_no_return_text:set_right(math.round(point_of_no_return_timer:left()))
    end
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
            o:set_font_size(math.lerp(tweak_data.hud_corner.noreturn_size, tweak_data.hud_corner.noreturn_size * 1.25, n))
        end
    end
    local point_of_no_return_timer = self._noreturn_bg_box:child("point_of_no_return_timer")
    point_of_no_return_timer:animate(flash_timer)
end

function HUDAssaultCorner:_animate_wave_completed(panel, assault_hud)
    local wave_text = panel:child("num_waves")
    local bg = panel:child("bg")

    wait(1.4)
    wave_text:set_text(self:get_completed_waves_string())
    bg:stop()
    bg:animate(callback(nil, _G, "HUDBGBox_animate_bg_attention"), {})
    wait(7.2)
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

function HUDAssaultCorner:UpdateAssaultStateColor(state, force_update)
    if state then
        if BAI:IsStateDisabled(state) then
            return
        end
        self:_update_assault_hud_color(BAI:GetStateColor(state))
        self._bg_box:child("text_panel"):animate(callback(self, self, "_animate_text_change_assault_state"), state)
        if force_update and self.is_host then
            self:UpdateAssaultState(managers.groupai:state():GetAssaultState())
        end
    end
end

function HUDAssaultCorner:UpdateAssaultColor(color, assault_type)
    self:_update_assault_hud_color(BAI:GetColor(color))
    self._bg_box:child("text_panel"):animate(callback(self, self, "_animate_text_change_normal_assault"), assault_type)
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
                    if self.was_endless then
                        self:SetImage("assault")
                        self.was_endless = false
                    end
                    self:_set_text_list(self:_get_state_strings(state))
                    self:_update_assault_hud_color(BAI:GetStateColor(state))
                    if override then
                        self._bg_box:child("text_panel"):animate(callback(self, self, "_animate_text"), nil, nil, callback(self, self, "assault_attention_color_function"))
                        self._hud_panel:child("assault_panel"):child("icon_assaultbox"):stop()
                        self._hud_panel:child("assault_panel"):child("icon_assaultbox"):animate(callback(self, self, "_show_icon_assaultbox"))
                    end     
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

function HUDAssaultCorner:start_assault_callback()
    if self:GetEndlessAssault() then
        self:_start_endless_assault(self:_get_assault_endless_strings())
    else
        self.assault_type = "assault"
        if self.is_client and BAI.settings.show_advanced_assault_info then
            self:SetTimer()
        end
        if BAI.settings.show_advanced_assault_info then
            if BAI.settings.show_assault_states then
                if self.is_host or (self.is_client and self.multiplayer_game) then
                    if BAI:IsStateEnabled("build") then
                        self:_start_assault(self:_get_assault_state_strings_info("build"))
                        self:_update_assault_hud_color(BAI:GetStateColor("build"))
                    else
                        self:_start_assault(self:_get_assault_strings_info())
                    end
                else
                    self:_start_assault(self:_get_assault_strings_info())
                end
            else
                self:_start_assault(self:_get_assault_strings_info())
            end    
        else
            if BAI.settings.show_assault_states then
                if self.is_host or (self.is_client and self.multiplayer_game) then
                    if BAI:IsStateEnabled("build") then
                        self:_start_assault(self:_get_assault_state_strings("build"))
                        self:_update_assault_hud_color(BAI:GetStateColor("build"))
                    else
                        self:_start_assault(self:_get_assault_strings())
                    end
                else
                    self:_start_assault(self:_get_assault_strings())
                end
            else
                self:_start_assault(self:_get_assault_strings())
            end
        end
    end
end

function HUDAssaultCorner:UpdateColors()
    if not (managers.mutators and managers.mutators:are_mutators_active()) then
        self._assault_color = BAI:GetColor("assault_box")
        self._vip_assault_color = BAI:GetColor("captain_box")
        self._assault_endless_color = BAI:GetColor("endless_box")
    else
        self._assault_color = BAI:GetColor("assault_box_mutated")
        self._vip_assault_color = BAI:GetColor("captain_box_mutated")
        self._assault_endless_color = BAI:GetColor("endless_box_mutated")
    end
    self._assault_survived_color = BAI:GetColor("survived_box")
    if self.is_skirmish then
        self._assault_color = BAI:GetColor("holdout_box")
    end
    self:UpdatePONRBox()
end

function HUDAssaultCorner:SetMultiplayerGame(setter)
    self.multiplayer_game = setter
end

local _f_get_assault_strings = HUDAssaultCorner._get_assault_strings
function HUDAssaultCorner:_get_assault_strings()
    if BAI.settings.show_difficulty_name_instead_of_skulls then
        if self._assault_mode == "normal" then
            if managers.job:current_difficulty_stars() > 0 then
                local ids_risk = self:GetDifficultyName()
                return {
                    "hud_assault_assault",
                    "hud_assault_end_line",
                    ids_risk,
                    "hud_assault_end_line",
                    "hud_assault_assault",
                    "hud_assault_end_line",
                    ids_risk,
                    "hud_assault_end_line"
                }
            end
        else
            if managers.job:current_difficulty_stars() > 0 then
                local ids_risk = self:GetDifficultyName()
                return {
                    "hud_assault_vip",
                    "hud_assault_padlock",
                    ids_risk,
                    "hud_assault_padlock",
                    "hud_assault_vip",
                    "hud_assault_padlock",
                    ids_risk,
                    "hud_assault_padlock"
                }
            end
        end
    end
    return _f_get_assault_strings(self)
end

local _f_get_survived_assault_strings = HUDAssaultCorner._get_survived_assault_strings
function HUDAssaultCorner:_get_survived_assault_strings()
    if BAI.settings.show_difficulty_name_instead_of_skulls then
        if managers.job:current_difficulty_stars() > 0 then
            local ids_risk = self:GetDifficultyName()
            return {
                "hud_assault_survived",
                "hud_assault_end_line",
                ids_risk,
                "hud_assault_end_line",
                "hud_assault_survived",
                "hud_assault_end_line",
                ids_risk,
                "hud_assault_end_line"
            }
        end
    end
    return _f_get_survived_assault_strings(self)
end

function HUDAssaultCorner:_get_state_strings(state)
    if managers.job:current_difficulty_stars() > 0 then
        local ids_risk = BAI.settings.show_difficulty_name_instead_of_skulls and self:GetDifficultyName() or Idstring("risk")
        return {
            "hud_" .. state,
            "hud_assault_end_line",
            ids_risk,
            "hud_assault_end_line",
            "hud_" .. state,
            "hud_assault_end_line",
            ids_risk,
            "hud_assault_end_line"
        }
    else
        return {
            "hud_" .. state,
            "hud_assault_end_line",
            "hud_" .. state,
            "hud_assault_end_line",
            "hud_" .. state,
            "hud_assault_end_line",
            "hud_" .. state,
            "hud_assault_end_line"
        }
    end
end
    
function HUDAssaultCorner:_get_assault_state_strings(state)
    if managers.job:current_difficulty_stars() > 0 then
        local ids_risk = BAI.settings.show_difficulty_name_instead_of_skulls and self:GetDifficultyName() or Idstring("risk")
        return {
            "hud_assault_assault",
            "hud_assault_end_line",
            "hud_" .. state,
            "hud_assault_end_line",
            ids_risk,
            "hud_assault_end_line",
            "hud_assault_assault",
            "hud_assault_end_line",
            "hud_" .. state,
            "hud_assault_end_line",
            ids_risk,
            "hud_assault_end_line"
        }
    else
        return {
            "hud_assault_assault",
            "hud_assault_end_line",
            "hud_" .. state,
            "hud_assault_end_line",
            "hud_assault_assault",
            "hud_assault_end_line",
            "hud_" .. state,
            "hud_assault_end_line"
        }
    end
end
    
function HUDAssaultCorner:_get_assault_state_strings_info(state)
    if not BAI.settings.advanced_assault_info.time_left.show and not BAI.settings.advanced_assault_info.spawns_left.show then
        return self:_get_assault_state_strings(state)
    end 
    if self.is_host and self.multiplayer_game and not self.is_skirmish then
        managers.localization:SetSynchronization(true)
    end
    if managers.job:current_difficulty_stars() > 0 then
        local ids_risk = BAI.settings.show_difficulty_name_instead_of_skulls and self:GetDifficultyName() or Idstring("risk")
        return {
            "hud_assault_assault",
            "hud_assault_end_line",
            "hud_" .. state,
            "hud_assault_end_line",
            "hud_advanced_info",
            "hud_assault_end_line",
            ids_risk,
            "hud_assault_end_line",
            "hud_assault_assault",
            "hud_assault_end_line",
            "hud_" .. state,
            "hud_assault_end_line",
            "hud_advanced_info",
            "hud_assault_end_line",
            ids_risk,
            "hud_assault_end_line"
        }
    else
        return {
            "hud_assault_assault",
            "hud_assault_end_line",
            "hud_" .. state,
            "hud_assault_end_line",
            "hud_advanced_info",
            "hud_assault_end_line",
            "hud_assault_assault",
            "hud_assault_end_line",
            "hud_" .. state,
            "hud_assault_end_line",
            "hud_advanced_info",
            "hud_assault_end_line"
        }
    end
end
    
function HUDAssaultCorner:_get_assault_strings_info()
    if not BAI.settings.advanced_assault_info.time_left.show and not BAI.settings.advanced_assault_info.spawns_left.show then
        return self:_get_assault_strings()
    end
    if self.is_host and self.multiplayer_game and not self.is_skirmish then
        managers.localization:SetSynchronization(true)
    end
    if managers.job:current_difficulty_stars() > 0 then
        local ids_risk = BAI.settings.show_difficulty_name_instead_of_skulls and self:GetDifficultyName() or Idstring("risk")
        return {
            "hud_assault_assault",
            "hud_assault_end_line",
            "hud_advanced_info",
            "hud_assault_end_line",
            ids_risk,
            "hud_assault_end_line",
            "hud_assault_assault",
            "hud_assault_end_line",
            "hud_advanced_info",
            "hud_assault_end_line",
            ids_risk,
            "hud_assault_end_line"
        }
    else
        return {
            "hud_assault_assault",
            "hud_assault_end_line",
            "hud_advanced_info",
            "hud_assault_end_line",
            "hud_assault_assault",
            "hud_assault_end_line",
            "hud_advanced_info",
            "hud_assault_end_line"
        }
    end
end

function HUDAssaultCorner:_animate_normal_wave_completed(panel, assault_hud)
    wait(8.6)
    self.wave_survived = false
    self.wave_survived_endless = false
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
    
function HUDAssaultCorner:GetDifficultyName()
    if tweak_data ~= nil then
        return self.is_crimespree and Idstring("risk") or tweak_data.difficulty_name_id
    else
        return Idstring("risk") -- Better safe than sorry
    end
end

function HUDAssaultCorner:SetSendAssaultState(setter)
    self.send_assault_state = setter
    if setter and setter == true and not BAI.settings.show_assault_states and not self.assault_states_hooked then
        dofile(BAI.ModPath .. "lua/assault_states.lua")
        self.assault_states_hooked = true
    end
end

function HUDAssaultCorner:GetEndlessAssault() -- It does something
    if not self._no_endless_assault_override then
        if self.is_host then
            if managers.groupai:state():get_hunt_mode() then
                if self.multiplayer_game then -- Only send when playing Multiplayer and at least 1 client must have this mod running.
                    LuaNetworking:SendToPeers("BAI_Message", "endless_triggered")
                end
                return true
            end -- Returns false
        end
        return self.endless_client
    end
    return false
end

function HUDAssaultCorner:IsEndlessWaveSurvivedShowed()
    return self.wave_survived_endless
end

function HUDAssaultCorner:SetAssaultStatesHook(setter)
    self.assault_states_hooked = setter
end

function HUDAssaultCorner:SetAdvancedAssaultInfoHook(setter)
    self.advanced_assault_info_hooked = setter
end

function HUDAssaultCorner:_animate_text_change_normal_assault(panel, assault_type)
    wait(0.1)
    if BAI:IsOr(assault_type, "normal", "captain") then
        if assault_type == "captain" then
            self:_set_text_list(self:_get_assault_strings())
        else
            if BAI.settings.show_advanced_assault_info then
                self:_set_text_list(self:_get_assault_strings_info())
            else
                self:_set_text_list(self:_get_assault_strings())
            end
        end
    elseif assault_type == "endless_assault" then
        self:_set_text_list(self:_get_assault_endless_strings())
    else
        if self:IsEndlessWaveSurvivedShowed() then
            self:_set_text_list(self:_get_survived_assault_endless_strings())
        else
            self:_set_text_list(self:_get_survived_assault_strings())
        end
    end
    if BAI:IsHostagePanelHidden() then
        self:_hide_hostages()
        if assault_type ~= "wave_survived" then
            if BAI:IsHostagePanelVisible(assault_type) then
                self:_show_hostages()
            end
        end
    end
end

function HUDAssaultCorner:_animate_text_change_assault_state(panel, state)
    wait(0.1)
    if BAI:IsOr(state, "control", "anticipation") then
        self:_set_text_list(self:_get_state_strings(state))
    else
        if BAI.settings.show_advanced_assault_info then
            self:_set_text_list(self:_get_assault_state_strings_info(state))
        else
            self:_set_text_list(self:_get_assault_state_strings(state))
        end
        if BAI:IsHostagePanelHidden() then
            if BAI:IsHostagePanelVisible("assault") then
                self:_show_hostages()
            else
                self:_hide_hostages()
            end
        end
    end
end

local old_sync_set_assault_mode = HUDAssaultCorner.sync_set_assault_mode
function HUDAssaultCorner:sync_set_assault_mode(mode)
    old_sync_set_assault_mode(self, mode)
    self._assault_vip = mode == "phalanx"
    if mode == "phalanx" then
        if BAI:IsHostagePanelHidden("captain") then
            self:_hide_hostages()
        end
        self._assault_endless = false
    else
        if BAI:IsHostagePanelVisible("assault") then
            self:_show_hostages()
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

function HUDAssaultCorner:SetEndlessClient(setter, dont_override)
    self.endless_client = setter
    if dont_override then
        self.dont_override_endless = true
    end
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
                if self.send_assault_state and not BAI:IsOr(state, "control", "anticipation") then
                    LuaNetworking:SendToPeers("BAI_AssaultState", state)
                end
                if BAI:IsStateDisabled(state) then
                    if BAI:IsOr(state, "control", "anticipation") then
                        if self._assault then
                            self._assault = false
                            self._start_assault_after_hostage_offset = nil
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
                        end
                    end
                    return
                end
                if BAI:IsOr(state, "control", "anticipation") then
                    if not self._assault then
                        self.show_popup = false
                        self:_start_assault(self:_get_state_strings(state))
                        self:_set_hostages_offseted(true)
                        self.show_popup = true
                    else
                        if state == "anticipation" then
                            self:_set_text_list(self:_get_state_strings(state))
                        end
                    end
                else
                    if BAI.settings.show_advanced_assault_info then
                        self:_set_text_list(self:_get_assault_state_strings_info(state))
                    else
                        self:_set_text_list(self:_get_assault_state_strings(state))
                    end
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

function HUDAssaultCorner:_popup_wave_started()
    self:_popup_wave(self:wave_popup_string_start(), tweak_data.screen_colors.skirmish_color) -- Orange
end

function HUDAssaultCorner:_popup_wave_finished()
    self:_popup_wave(self:wave_popup_string_end(), Color(1, 0.12549019607843137, 0.9019607843137255, 0.12549019607843137)) -- Green
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

Hooks:Add("NetworkReceivedData", "NetworkReceivedData_BAI", function(sender, id, data)
    if id == "BAI_Message" then
        if data == "endless_triggered" then -- Client
            managers.hud:SetEndlessClient(true)
        end
        if data == "BAI?" then -- Host
            managers.hud:SetMultiplayerGame(true)
            LuaNetworking:SendToPeer(sender, id, "BAI!")
        end
        if data == "BAI!" then -- Client
            managers.hud:SetMultiplayerGame(true)
            LuaNetworking:SendToPeer(1, id, "IsEndlessAssault?")
            LuaNetworking:SendToPeer(1, id, "SendAssaultStates")
            --LuaNetworking:SendToPeer(1, id, "RequestCurrentAssaultState")
        end
        if data == "IsEndlessAssault?" then -- Host
            if managers.hud:GetAssaultMode() ~= "phalanx" and managers.groupai:state():get_hunt_mode() then -- Notifies drop-in client about Endless Assault in progress
                LuaNetworking:SendToPeer(sender, id, "endless_triggered")
            end
        end
        if data == "NormalAssaultOverride" then -- Client
            managers.hud:SetNormalAssaultOverride()
        end
        if data == "SendAssaultStates" then -- Host
            managers.hud:SetSendAssaultState(true)
        end
        if data == "RequestCurrentAssaultState" then -- Host
            LuaNetworking:SendToPeer(sender, "BAI_AssaultStateOverride", managers.groupai:state():GetAssaultState())
        end
    end
    if id == "BAI_AssaultState" then -- Client
        if BAI.settings.show_assault_states then
            managers.hud:UpdateAssaultState(data)
        end
    end
    if id == "BAI_AssaultStateOverride" then -- Client
        if BAI.settings.show_assault_states then
            managers.hud:UpdateAssaultStateOverride(data)
        end
    end
    if id == "BAI_AdvancedAssaultInfo_TimeLeft" then -- Client
        if managers.hud:IsAdvancedAssaultInfoHooked() then
            managers.hud:SetTimeLeft(data)
        end
    end
end)

local function WhichOverride(current_level_id)
    if current_level_id == "spa" then
        return "elementdifficulty.lua"
    elseif current_level_id == "born" or current_level_id == "dah" or current_level_id == "man" or current_level_id == "jolly" or current_level_id == "dinner" or current_level_id == "kenaz" then
        return "coreelementinstance.lua"
    elseif current_level_id == "pbr" then
        return "beneath_the_mountain.lua"
    elseif current_level_id == "glace" or current_level_id == "peta2" or current_level_id == "hox_2" or current_level_id == "ukrainian_job" then
        return "coreelementunitsequencetrigger.lua"
    elseif current_level_id == "pbr2" then
        return "birth_of_sky.lua"
    elseif current_level_id == "hox_1" then
        return "elementareatrigger.lua"
    elseif current_level_id == "mad" or current_level_id == "sah" then
        return "coreelementcounter.lua"
    elseif current_level_id == "help" then
        return "elementenemypreferedadd.lua"
    elseif current_level_id == "crojob2" then
        return "the_bomb_dockyard.lua"
    else
        return "missionscriptelement.lua"
    end
end

local function IsPlayingSupportedHeistWithEA()
    local heists = { "rvd2", "dah", "red2", "glace", "dinner", "man", "mad", "pbr", "pbr2", "born", "hox_1", "hox_2", "kenaz", "crojob2", "jolly", "spa", "peta2", "ukrainian_job", "help", "sah", "vit" }
    return table.contains(heists, Global.game_settings.level_id)
end

Hooks:Add("BaseNetworkSessionOnLoadComplete", "BaseNetworkSessionOnLoadComplete_BAI", function(local_peer, id)
    if Network:is_client() then
        LuaNetworking:SendToPeer(1, "BAI_Message", "BAI?")
    end
    if Network:is_client() and not managers.hud:GetMultiplayerGame() and BAI.settings.trigger_endless_assault_client and IsPlayingSupportedHeistWithEA() then
        dofile(BAI.LuaPath .. "client/" .. WhichOverride(Global.game_settings.level_id))
    end
end)

Hooks:Add("BaseNetworkSessionOnPeerRemoved", "BaseNetworkSessionOnPeerRemoved_BAI", function(peer, peer_id, reason)
    if Network:is_client() then
        managers.hud._hud_assault_corner.number_of_peers = managers.hud._hud_assault_corner.number_of_peers - 1
    end
end)

Hooks:Add("NetworkManagerOnPeerAdded", "NetworkManagerOnPeerAdded_BAI", function(peer, peer_id)
    if Network:is_client() then
        managers.hud._hud_assault_corner.number_of_peers = managers.hud._hud_assault_corner.number_of_peers + 1
    end
end)