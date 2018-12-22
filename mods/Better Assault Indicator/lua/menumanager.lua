local old_resume = MenuCallbackHandler.resume_game
function MenuCallbackHandler:resume_game()
    old_resume(self)
    if BAI.Update then
        BAI.Update = false
        managers.localization:SetVariables()
        if BAI.settings.show_advanced_assault_info then
            if not managers.hud:IsAdvancedAssaultInfoHooked() then
                dofile(BAI.LuaPath .. "localizationmanager.lua")
                managers.hud:SetAdvancedAssaultInfoHook(true)
            end
        end
        if BAI.settings.show_assault_states then
            if managers.hud:IsClient() then
                if managers.hud:GetMultiplayerGame() then
                    if managers.hud:IsPoliceAssault() and not managers.hud:IsEndlessPoliceAssault() then
                        LuaNetworking:SendToPeer(1, "BAI_Message", "RequestCurrentAssaultState")
                    else -- No active police assault. Is Wave Survived banner enabled and showed ?
                        if BAI.settings.show_wave_survived then
                            if managers.hud:IsWaveSurvivedShowed() then
                                managers.hud:UpdateAssaultColor("survived_box", "wave_survived")
                            end
                        end
                    end
                    return
                else
                    self:UpdateAssaultColor()
                end
            end
            if managers.hud:IsHost() and not managers.hud:IsAssaultStatesHooked() then
                dofile(BAI.LuaPath .. "assault_states.lua")
                managers.hud:SetAssaultStatesHook(true)
            end
            if managers.hud:IsPoliceAssault() and not managers.hud:IsEndlessPoliceAssault() then
                managers.hud:UpdateAssaultStateColor(managers.hud:GetAssaultState(), true)
            else -- No active police assault. Is Wave Survived banner enabled and showed ?
                if BAI.settings.show_wave_survived then
                    if managers.hud:IsWaveSurvivedShowed() then
                        managers.hud:UpdateAssaultColor("survived_box", "wave_survived")
                    end
                end
            end
        else
            self:UpdateAssaultColor()
        end   
    end
end

function MenuCallbackHandler:UpdateAssaultColor()
    local mutation = ""
    if managers.mutators and managers.mutators:are_mutators_active() then
        mutation = "_mutated"
    end
    if managers.hud:GetAssaultMode() == "phalanx" then -- Captain is on the scene
        managers.hud:UpdateAssaultColor("captain_box" .. mutation, "captain")
    else
        if managers.hud:IsPoliceAssault() then
            if managers.hud:IsEndlessPoliceAssault() then 
                managers.hud:UpdateAssaultColor("endless_box" .. mutation, "endless_assault")
            else
                managers.hud:UpdateAssaultColor(managers.hud:IsSkirmish() and "holdout_box" or ("assault_box" .. mutation), "assault")
            end
        else -- No active police assault. Is Wave Survived banner enabled and showed ?
            if BAI.settings.show_wave_survived then
                if managers.hud:IsWaveSurvivedShowed() then
                    managers.hud:UpdateAssaultColor("survived_box", "wave_survived")
                end
            end
        end
    end
end