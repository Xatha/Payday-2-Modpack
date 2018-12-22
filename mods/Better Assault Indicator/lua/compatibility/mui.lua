local fade, fade_c = ArmStatic.fade_animate, ArmStatic.fade_c_animate;
local function line(fgr, p, s, size)
	if fgr:get("text_rect") then fgr:rect(size):attach(s, 2, size/3);
	else fgr:shape(size):attach(s, 2, size/3); end
end

function MUIStats:InitPanels() --Positioning this shit is cancerous, I hope who wrote Figure will horribly die...
    local muiFont = ArmStatic.font_index(self._muiFont)
    local panel = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_FULLSCREEN_PD2).panel:child("stats_panel")
    local loot_panel = panel:child("loot_panel")
    local time_left_panel = panel:panel({
        layer = 1,
        name = "time_left_panel",
        visible = true
    })
    self._time_left_panel = time_left_panel
    time_left_panel:bitmap({
        name = "icon",
        texture = "guis/textures/pd2/specialization/icons_atlas",
        texture_rect = { 196, 70, 52, 52 }
    })
    time_left_panel:text({
        name = "amount",
        font = muiFont,
        text = managers.localization:text("hud_time_left") .. "00:00"
    })

    local spawns_left_panel = panel:panel({
        layer = 1,
        name = "spawns_left_panel",
        visible = true
    })
    self._spawns_left_panel = spawns_left_panel
    spawns_left_panel:bitmap({
        name = "icon",
        texture = "guis/textures/pd2/specialization/icons_atlas",
        texture_rect = { 196, 70, 52, 52 }
    })
    spawns_left_panel:text({
        name = "amount",
        font = muiFont,
        text = managers.localization:text("hud_spawns_left") .. "0"
    })

    local size = self._muiSize
    local mul = self._muiWMul
    local width = size * mul
    local s33 = size / 3
    --Figure(time_left_panel):progeny(line, s33):adapt()
    Figure(time_left_panel):shape(width, size / 3 * 2):attach(loot_panel, 3)
    Figure(spawns_left_panel):shape(width, size / 3 * 2):attach(time_left_panel, 3)

    --self._time_left_panel:set_y(loot_panel:y() + time_left_panel:h() + 10)
    --self._spawns_left_panel:set_y(time_left_panel:y() + spawns_left_panel:h() + 10)

    local hPos = self._muiHPos;
    local vPos = self._muiVPos;
    local hMargin = self._muiHMargin;
    local vMargin = self._muiVMargin;
    local alpha = self._muiAlpha;
    -- Resize
    --[[local size = self._muiSize
    local mul = self._muiWMul
    local hPos = self._muiHPos;
    local vPos = self._muiVPos;
    local hMargin = self._muiHMargin;
    local vMargin = self._muiVMargin;
    local alpha = self._muiAlpha;
    local width = size * mul
    Figure(time_left_panel):shape(width, size / 3 * 2):attach(loot_panel, 3)
    Figure(spawns_left_panel):shape(width, size / 3 * 2):attach(time_left_panel, 3)
    Figure(panel):view(alpha):adapt(time_left_panel):align(hPos, vPos, hMargin, vMargin)]]
    self:ResizeBAIPanels(panel)
    --Figure(panel):view(alpha):adapt(time_left_panel):align(hPos, vPos, hMargin, vMargin);
end

function MUIStats:ResizeBAIPanels(stats_panel)
    local s33 = self._muiSize/3;
	
    local time = self._time_left_panel;
    local spawns = self._spawns_left_panel
    local time_i = time:child("icon")
    local time_t = time:child("amount")
    local spawns_i = spawns:child("icon")
    local spawns_t = spawns:child("amount")
    local bag = stats_panel:child("loot_panel"):child("bag_panel")
    local secured = stats_panel:child("loot_panel"):child("title")
	
    local indent_t = time:w() * 0.05
    local indent_s = spawns:w() * 0.05

    Figure(time):attach(secured, 3)
    Figure(time_i):shape(s33):attach(secured, 2, s33)
    Figure(time_t):rect(s33):attach(time_i, 2):fill()
    
    --[[Figure(spawns):progeny(line, s33):adapt():attach(time, 3):shift(indent_s)
    Figure(spawns_i):shape(s33):attach(time, 2, s33)
    Figure(spawns_t):rect(s33):attach(spawns_i, 2):fill()]]
    
    --[[Figure(time):progeny(line, s33):adapt():attach(bag, 3):shift(indent_t);
    Figure(time_i):shape(s33):attach(bag, 2, s33);
    
    Figure(spawns):progeny(line, s33):adapt():attach(time, 3):shift(indent_s)
    Figure(spawns_i):shape(s33):attach(time, 2, s33)]]
end

function MUIStats:sync_set_assault_mode(mode)
    if self._assault_mode == mode then
        return;
    end
    
    self._assault_vip = mode == "phalanx"
    self._assault_mode = mode;
    self:UpdateColor(BAI:GetColor(mode == "phalanx" and "captain_box" or "assault_box"))
    self:UpdateAssaultText(mode == "phalanx" and "hud_captain" or self:GetAssaultText())
    if BAI:IsHostagePanelVisible() then
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
    end
    if mode ~= "phalanx" then
        if self.is_host and BAI.settings.show_assault_states then
            self:UpdateAssaultState("fade")
        end
    end
end

local _MUI_set_wave = MUIStats.set_wave
function MUIStats:set_wave(wave)
    _MUI_set_wave(self, wave)
    self._wave_number = wave or 0
end

function MUIStats:SetTimer()
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

function MUIStats:SetTimeLeft(time)
    self.client_time_left = TimerManager:game():time() + time
end

function MUIStats:set_no_return(state)
	if self._no_return == state then return; end
	self._no_return = state;
    fade_c(self._heist_time, state and BAI:GetColor("escape_box") or Color.white, 1);
    self:_close_assault_box()
    self:_hide_hostages()
end

local _MUI_sync_start_assault = MUIStats.sync_start_assault
function MUIStats:sync_start_assault(wave)
    if self._no_return then
        return
    end
    _MUI_sync_start_assault(self, wave)
    self._assault = true
    if self:GetEndlessAssault() then
        self._assault_endless = true
        self:UpdateColor(BAI:GetColor("endless_box"))
        self:UpdateAssaultText("hud_endless")
    else
        if self.is_client then
            --self:SetTimer()
        end
        if BAI.settings.hud.mui.assault_text then
            self:UpdateAssaultText("hud_assault")
        end
        if BAI.settings.show_assault_states then
            if self.is_host or (self.is_client and self.multiplayer_game) then
                if BAI:IsStateEnabled("build") then
                    self:UpdateAssaultText("hud_build")
                end
            end
        end
    end
    if BAI:IsHostagePanelHidden(self._assault_endless and "endless_assault" or "assault") then
        self:_hide_hostages()
    end
end

function MUIStats:GetEndlessAssault()
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

function MUIStats:start_assault()
	local panel = self._assault_panel;
	panel:stop();
	panel:animate(callback(panel, self, "assault_pulse"));
end

function MUIStats:GetAssaultPanel() -- Lazy fix, and of course not working...
    return self._assault_panel
end

function MUIStats:sync_end_assault()
    local panel = self._assault_panel;
    self._assault = false
    self._assault_endless = false
    if false then
        self.wave_survived = true
        self:UpdateColor(BAI:GetColor("survived_box"))
        self:UpdateAssaultText("hud_survived")
        BAI:DelayCall("BAI_MUI_WaveSurvived", 8.6, function(self)
            local panel = MUIStats:GetAssaultPanel()
            if BAI.settings.show_assault_states then
                local color = BAI:GetStateColor("control")
                fade_c(panel:child("risk"), color, 1);
                fade_c(panel:child("title"), color, 1);
                fade_c(panel:child("icon"), color, 1);
                panel:child("title"):set_text(managers.localization:text("hud_control"))
                MUIStats:MakeFineText(panel:child("title"))
                --MUIStats:UpdateColor(BAI:GetStateColor("control"))
                --MUIStats:UpdateAssaultText("hud_control")

            else
                panel:stop();
                panel:animate(callback(panel, MUIStats, "assault_end"));
            end
        end)
    else
        if BAI.settings.show_assault_states then
            if self.is_host or (self.is_client and self.multiplayer_game) then
                self:UpdateAssaultStateOverride("control")
            else
                panel:stop();
                panel:animate(callback(panel, self, "assault_end"));
            end
        else
            panel:stop();
            panel:animate(callback(panel, self, "assault_end"));
        end
    end
    if BAI:IsHostagePanelVisible() then
        self:_show_hostages()
    end
    if self.is_client then
        if not self.dont_override_endless then
            if self.endless_client and not self._assault_endless then
                self.endless_client = false
            end
        end
    end
end

function MUIStats:WaveSurvived() -- Hack, don't try to fix it... Fix it, because it is crashing the game
    local panel = self._assault_panel
    if BAI.settings.show_assault_states then
        self:UpdateColor(BAI:GetStateColor("control"))
        self:UpdateAssaultText("hud_control")  
    else
        panel:stop();
        panel:animate(callback(panel, self, "assault_end"));
    end
end

function MUIStats:_hide_hostages()
    self._supplement_list:child("hostages_panel"):set_visible(false)
end

function MUIStats:_show_hostages()
    self._supplement_list:child("hostages_panel"):set_visible(true)
end

function MUIStats:UpdateColor(color)
    color = color or Color.white
    local panel = self._assault_panel;
	fade_c(panel:child("risk"), color, 1);
	fade_c(panel:child("title"), color, 1);
	fade_c(panel:child("icon"), color, 1);
end

function MUIStats:_close_assault_box()
    local panel = self._assault_panel;
    panel:stop();
    panel:animate(callback(panel, self, "assault_end"));
end

function HUDAssaultCorner:UpdatePONRBox()
end

function MUIStats:UpdateAssaultText(text)
    self._assault_panel:child("title"):set_text(utf8.to_upper(managers.localization:text(text)))
    self:MakeFineText(self._assault_panel:child("title"))
end

function MUIStats:MakeFineText(text)
    local x, y, w, h = text:text_rect()
    
    text:set_size(w, h)
    text:set_position(math.round(text:x()), math.round(text:y()))
end

function MUIStats:UpdateAssaultState(state)
    if not self._assault_vip and not self._assault_endless and not self._no_return then
        if BAI.settings.show_assault_states then
            if state and self.assault_state ~= state then
                self.assault_state = state
                if state == "build" then
                    self:UpdateColor(BAI:GetStateColor(state))
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
                            self:_close_assault_box()
                        end
                    else
                        if self._assault then
                            --[[if BAI.settings.show_advanced_assault_info then
                            else
                            end]] -- AAI not visible in MUI, yet
                            self:UpdateAssaultText(self:GetAssaultText())
                            self:UpdateColor(BAI:GetColor("assault_box"))
                        end
                    end
                    return
                end
                if BAI:IsOr(state, "control", "anticipation") then
                    if not self._assault then
                        self:start_assault()
                        self:UpdateAssaultText("hud_" .. state)
                    else
                        if state == "anticipation" then
                            self:UpdateAssaultText("hud_anticipation")
                        end
                    end
                else
                    --[[if BAI.settings.show_advanced_assault_info then
                    else
                    end]]
                    self:UpdateAssaultText("hud_" .. state)
                end
                self:UpdateColor(BAI:GetStateColor(state))
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

function MUIStats:UpdateAssaultStateOverride(state, override)
    if not self._assault_vip and not self._assault_endless and not self._no_return then
        if BAI.settings.show_assault_states then
            if state then
                if BAI:IsOr(state, "control", "anticipation") then
                    self.assault_state = state
                    if BAI:IsStateDisabled(state) then
                        self:_close_assault_box()
                        return
                    end
                    self._assault = true
                    self:UpdateColor(BAI:GetStateColor(state))
                    self:UpdateAssaultText("hud_" .. state)  
                else
                    self.assault_state = state
                    if BAI:IsStateDisabled(state) then
                        self:UpdateColor(BAI:GetColor("assault_box"))
                        self:UpdateAssaultText(self:GetAssaultText())
                        return
                    end
                    self:UpdateColor(BAI:GetStateColor(state))
                    if self.is_host and self.multiplayer_game then
                        LuaNetworking:SendToPeers("BAI_AssaultStateOverride", state)
                    end
                end
            end
        end
    end
end

function MUIStats:SetNormalAssaultOverride()
    --[[if self.is_host and self.multiplayer_game then
        LuaNetworking:SendToPeers("BAI_Message", "NormalAssaultOverride")
    end]]
    self._assault_endless = false
    if BAI.settings.show_assault_states then
        if self.is_host then
            local state = managers.groupai:state():GetAssaultState()
            state = state or "sustain" -- To be sure the game does not crash
            self:UpdateAssaultStateOverride(state)
            self:UpdateAssaultText("hud_" .. state)
        else
            if not self.multiplayer_game then
                self:UpdateColor(BAI:GetColor("assault_box"))
                self:UpdateAssaultText(self:GetAssaultText())
            end
        end
    else
        self:UpdateColor(BAI:GetColor("assault_box"))
        self:UpdateAssaultText(self:GetAssaultText())
    end
    if BAI:IsHostagePanelVisible("assault") then
        self:_show_hostages()
    else
        self:_hide_hostages()
    end
end

function MUIStats:GetAssaultText()
    return BAI.settings.hud.mui.assault_text and "hud_assault" or tweak_data.difficulty_name_id
end

function MUIStats:SetEndlessClient(setter, dont_override)
    self.endless_client = setter
    if dont_override then
        self.dont_override_endless = true
    end
end

function MUIStats:SetSendAssaultState(setter)
    self.send_assault_state = setter
    if setter and setter == true and not BAI.settings.show_assault_states and not self.assault_states_hooked then
        dofile(BAI.ModPath .. "lua/assault_states.lua")
        self.assault_states_hooked = true
    end
end


local function IsPlayingSupportedHeistWithEA()
    local heists = { "rvd2", "dah", "red2", "glace", "dinner", "man", "mad", "pbr", "pbr2", "born", "hox_1", "hox_2", "kenaz", "crojob2", "jolly", "spa", "peta2", "ukrainian_job", "help", "sah", "vit" }
    return table.contains(heists, Global.game_settings.level_id)
end

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

function MUIStats:UpdateVariables()
    self.is_client = Network:is_client()
    self.is_host = not self.is_client
    self.multiplayer_game = false
    self.assault_state = "nil"
    self.send_assault_state = false
    self.heists_with_fake_endless_assaults = { "framing_frame_1", "gallery", "watchdogs_2", "bph" } -- Framing Frame Day 1, Art Gallery, Watch Dogs Day 2, Hell's Island
    self._no_endless_assault_override = table.contains(self.heists_with_fake_endless_assaults, Global.game_settings.level_id)
    if self.is_client then -- Safe House Nightmare, The Biker Heist Day 2, Cursed Kill Room, Escape: Garage, Escape: Cafe, Escape: Cafe (Day)
        self.heists_with_endless_assaults = { "haunted", "chew", "hvh", "escape_garage", "escape_cafe", "escape_cafe_day" }
        self.endless_client = table.contains(self.heists_with_endless_assaults, Global.game_settings.level_id)
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
        self.number_of_peers = LuaNetworking:GetNumberOfPeers()
    end
    if self.is_client and not self.multiplayer_game and BAI.settings.trigger_endless_assault_client and IsPlayingSupportedHeistWithEA() then
        dofile(BAI.LuaPath .. "client/" .. WhichOverride(Global.game_settings.level_id))
    end
end

function MUIStats:SetMultiplayerGame(setter)
    self.multiplayer_game = setter
end

function MUIStats:SetAssaultStatesHook(setter)
    self.assault_states_hooked = setter
end

function MUIStats:SetAdvancedAssaultInfoHook(setter)
    self.advanced_assault_info_hooked = setter
end

function MUIStats:UpdateAssaultColor(color, assault_type)
    self:UpdateColor(color)
    if BAI:IsHostagePanelVisible(assault_type) then
        self:_show_hostages()
    else
        self:_hide_hostages()
    end
end

function MUIStats:UpdateAssaultStateColor(state, force_update)
    if state then
        if BAI:IsStateDisabled(state) then
            return
        end
        self:UpdateColor(color)
        self:UpdateAssaultText("hud_" .. state)
        if BAI:IsHostagePanelVisible(assault_type) then
            self:_show_hostages()
        else
            self:_hide_hostages()
        end
        if force_update and self.is_host then
            self:UpdateAssaultState(managers.groupai:state():GetAssaultState())
        end
    end
end

-- //
-- // Re-routes
-- //
function HUDAssaultCorner:UpdateAssaultState(state)
    MUIStats:UpdateAssaultState(state)
end

function HUDAssaultCorner:UpdateAssaultStateOverride(state, override)
    MUIStats:UpdateAssaultStateOverride(state, override)
end

function HUDAssaultCorner:SetNormalAssaultOverride()
    MUIStats:SetNormalAssaultOverride()
end

function HUDAssaultCorner:SetEndlessClient(setter, dont_override)
    MUIStats:SetEndlessClient(setter, dont_override)
end

function HUDAssaultCorner:SetMultiplayerGame(setter)
    MUIStats:SetMultiplayerGame(setter)
end

function HUDAssaultCorner:SetSendAssaultState(setter)
    MUIStats:SetSendAssaultState(setter)
end

function HUDAssaultCorner:SetAssaultStatesHook(setter)
    MUIStats:SetAssaultStatesHook(setter)
end

function HUDAssaultCorner:SetAdvancedAssaultInfoHook(setter)
    MUIStats:SetAdvancedAssaultInfoHook(setter)
end

function HUDAssaultCorner:IsEndlessWaveSurvivedShowed()
    return false -- Always false in MUI
end

function HUDManager:UpdateColors()
end

function HUDManager:UpdateAssaultColor(color, assault_type)
    MUIStats:UpdateAssaultColor(color, assault_type)
end

function HUDManager:UpdateAssaultStateColor(state, force_update)
    MUIStats.UpdateAssaultStateColor(state, force_update)
end

function HUDManager:GetAssaultMode()
	return MUIStats:_get_assault_mode()
end

function HUDManager:GetMultiplayerGame()
	return MUIStats.multiplayer_game
end

function HUDManager:IsPoliceAssault()
	return MUIStats._assault
end

function HUDManager:IsEndlessPoliceAssault()
	return MUIStats._assault_endless
end

function HUDManager:IsWaveSurvivedShowed()
	return MUIStats.wave_survived
end

function HUDManager:GetAssaultState()
	return MUIStats.assault_state
end

function HUDManager:IsHost()
	return MUIStats.is_host
end

function HUDManager:IsClient()
	return MUIStats.is_client
end

function HUDManager:IsAssaultStatesHooked()
	return MUIStats.assault_states_hooked
end

function HUDManager:IsAdvancedAssaultInfoHooked()
	return MUIStats.advanced_assault_info_hooked
end

function HUDManager:IsSkirmish()
	return MUIStats.is_skirmish
end

function HUDManager:GetTimeLeft()
	return MUIStats.client_time_left - TimerManager:game():time()
end

Hooks:Add("BaseNetworkSessionOnPeerRemoved", "BaseNetworkSessionOnPeerRemoved_BAI", function(peer, peer_id, reason)
    if Network:is_client() then
        MUIStats.number_of_peers = MUIStats.number_of_peers - 1
    end
end)

Hooks:Add("NetworkManagerOnPeerAdded", "NetworkManagerOnPeerAdded_BAI", function(peer, peer_id)
    if Network:is_client() then
        MUIStats.number_of_peers = MUIStats.number_of_peers + 1
    end
end)