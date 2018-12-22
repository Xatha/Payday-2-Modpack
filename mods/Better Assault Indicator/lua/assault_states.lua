if Global.game_settings.level_id == "Enemy_Spawner" then
    return
end

BAI:Hook(GroupAIStateBesiege, "_upd_assault_task", function(self)
    if self._task_data.assault.phase ~= "anticipation" then
        managers.hud:UpdateAssaultState(self._task_data.assault.phase)
    end
end)

if Network:is_server() then
    function GroupAIStateBase:GetAssaultState()
        return self._task_data.assault.phase
    end

    BAI:Hook(GroupAIStateBase, "on_enemy_weapons_hot", function(self)
        managers.hud:UpdateAssaultState("control")
        if managers.hud:GetMultiplayerGame() and managers.hud:GetSendAssaultState() then
            LuaNetworking:SendToPeers("BAI_AssaultState", "control")
        end
    end)
end

BAI:Hook(HUDManager, "sync_start_anticipation_music", function(self)
    self:UpdateAssaultState("anticipation")
end)