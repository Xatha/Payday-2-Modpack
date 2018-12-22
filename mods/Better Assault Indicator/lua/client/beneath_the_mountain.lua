if core then
    core:module("CoreElementInstance")
    core:import("CoreMissionScriptElement")
end

local _f_on_executed = ElementInstanceOutputEvent.client_on_executed
local dont_trigger_again = false
function ElementInstanceOutputEvent:client_on_executed(...)
    _f_on_executed(self, ...)
    if not dont_trigger_again then
        if self._id == 100274 or self._id == 101774 then
            dont_trigger_again = true
            managers.hud:SetEndlessClient(true)
        end
    else
        if self._id == 100287 then
            dont_trigger_again = false
            managers.hud:SetNormalAssaultOverride()
        end
    end
end