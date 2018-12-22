local _f_on_executed = ElementDifficulty.client_on_executed
local dont_trigger_again = false
function ElementDifficulty:client_on_executed(...)
    _f_on_executed(self, ...)
    if not dont_trigger_again then
        if self._id == 100887 then
            dont_trigger_again = true
            managers.hud:SetEndlessClient(true, true)
        end
    end
end