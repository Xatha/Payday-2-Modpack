function HUDManager:GetAssaultMode()
	return self._hud_assault_corner:get_assault_mode()
end

function HUDManager:SetEndlessClient(setter, dont_override)
	self._hud_assault_corner:SetEndlessClient(setter, dont_override)
end

function HUDManager:GetMultiplayerGame()
	return self._hud_assault_corner.multiplayer_game
end

function HUDManager:SetMultiplayerGame(setter)
	self._hud_assault_corner:SetMultiplayerGame(setter)
end

function HUDManager:SetNormalAssaultOverride()
	self._hud_assault_corner:SetNormalAssaultOverride()
end

function HUDManager:UpdateColors()
	self._hud_assault_corner:UpdateColors()
end

function HUDManager:UpdateAssaultColor(color, assault_type)
	self._hud_assault_corner:UpdateAssaultColor(color, assault_type)
end

function HUDManager:UpdateAssaultState(state)
	self._hud_assault_corner:UpdateAssaultState(state)
end

function HUDManager:UpdateAssaultStateOverride(state)
	self._hud_assault_corner:UpdateAssaultStateOverride(state)
end

function HUDManager:UpdateAssaultStateColor(state, force_update)
	self._hud_assault_corner:UpdateAssaultStateColor(state, force_update)
end

function HUDManager:SetSendAssaultState(setter)
	self._hud_assault_corner:SetSendAssaultState(setter)
end

function HUDManager:GetSendAssaultState()
	return self._hud_assault_corner.send_assault_state
end

function HUDManager:IsPoliceAssault()
	return self._hud_assault_corner._assault
end

function HUDManager:IsEndlessPoliceAssault()
	return self._hud_assault_corner._assault_endless
end

function HUDManager:IsWaveSurvivedShowed()
	return self._hud_assault_corner.wave_survived
end

function HUDManager:GetAssaultState()
	return self._hud_assault_corner.assault_state
end

function HUDManager:IsHost()
	return self._hud_assault_corner.is_host
end

function HUDManager:IsClient()
	return self._hud_assault_corner.is_client
end

function HUDManager:IsAssaultStatesHooked()
	return self._hud_assault_corner.assault_states_hooked
end

function HUDManager:SetAssaultStatesHook(setter)
	self._hud_assault_corner:SetAssaultStatesHook(setter)
end

function HUDManager:IsAdvancedAssaultInfoHooked()
	return self._hud_assault_corner.advanced_assault_info_hooked
end

function HUDManager:SetAdvancedAssaultInfoHook(setter)
	self._hud_assault_corner:SetAdvancedAssaultInfoHook(setter)
end

function HUDManager:IsSkirmish()
	return self._hud_assault_corner.is_skirmish
end

function HUDManager:GetTimeLeft()
	return self._hud_assault_corner.client_time_left - TimerManager:game():time()
end

function HUDManager:SetTimeLeft(time)
	self._hud_assault_corner:SetTimeLeft(time)
end