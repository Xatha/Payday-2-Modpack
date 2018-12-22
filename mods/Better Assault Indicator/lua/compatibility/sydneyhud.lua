--
-- HUDManager
--
function HUDManager:sync_start_assault(assault_number) -- Vanilla
    managers.music:post_event(tweak_data.levels:get_music_event("assault"))

	if not managers.groupai:state():get_hunt_mode() then
		managers.dialog:queue_narrator_dialog("b02c", {})
	end

	self._hud_assault_corner:sync_start_assault(assault_number)
end

function HUDManager:sync_end_assault(result) -- Vanilla
	managers.music:post_event(tweak_data.levels:get_music_event("control"))

	local result_diag = {
		"b12",
		"b11",
		"b10"
	}

	if result then
		managers.dialog:queue_narrator_dialog(result_diag[result + 1], {})
	end

	self._hud_assault_corner:sync_end_assault(result)
end

--
-- HUDAssaultCorner
--
function HUDAssaultCorner:HUDTimer(visibility)
    if self.center_assault_banner then
        managers.hud._hud_heist_timer._heist_timer_panel:set_visible(visibility)
    end
end

local _BAI_start_assault = HUDAssaultCorner._start_assault
function HUDAssaultCorner:_start_assault(text_list)
    _BAI_start_assault(self, text_list)
    if self.center_assault_banner then
        self:HUDTimer(false)
    end
end

local _BAI_start_endless_assault = HUDAssaultCorner._start_endless_assault
function HUDAssaultCorner:_start_endless_assault(text_list)
    _BAI_start_endless_assault(self, text_list)
    self:SpamChat("Endless")
end

local _BAI_close_assault_box = HUDAssaultCorner._close_assault_box
function HUDAssaultCorner:_close_assault_box()
    _BAI_close_assault_box(self)
    if not (BAI.settings.show_assault_states or BAI.settings.show_wave_survived) then
        self:HUDTimer(true)
    end
end

local _BAI_UpdateAssaultState = HUDAssaultCorner.UpdateAssaultState
function HUDAssaultCorner:UpdateAssaultState(state)
    _BAI_UpdateAssaultState(self, state)
    if not self._assault_vip and not self._assault_endless and not self._point_of_no_return then
        if state and self.assault_state ~= self.assault_state_sydneyhud then
            if BAI:IsOr(state, "control", "anticipation") then
                return
            end
            self.assault_state_sydneyhud = self.assault_state
            if state == "build" then
                self:SpamChat("Build")
            elseif state == "sustain" then
                self:SpamChat("Sustain")
            else
                self:SpamChat("Fade")
            end
        end
    end
end

local _BAI_UpdateAssaultStateOverride = HUDAssaultCorner.UpdateAssaultStateOverride
function HUDAssaultCorner:UpdateAssaultStateOverride(state)
    _BAI_UpdateAssaultStateOverride(self, state)
    if not self._assault_vip and not self._assault_endless and not self._point_of_no_return then
        if state then
            if BAI:IsOr(state, "control", "anticipation") then
                return
            end
            self.assault_state_sydneyhud = state
            if state == "build" then
                self:SpamChat("Build")
            elseif state == "sustain" then
                self:SpamChat("Sustain")
            else
                self:SpamChat("Fade")
            end
        end
    end
end

function HUDAssaultCorner:SpamChat(phase)
    if self.is_host then
        if SydneyHUD:GetOption("assault_phase_chat_info") then
            if SydneyHUD:GetOption("assault_phase_chat_info_feed") then
                SydneyHUD:SendChatMessage("Assault", phase .. " Wave: " .. self._wave_number, true)
            else
                SydneyHUD:SendChatMessage("Assault", phase .. " Wave: " .. self._wave_number, false)
            end
        end
    end
end

function HUDAssaultCorner:_show_hostages()
end

function HUDAssaultCorner:_hide_hostages()
end