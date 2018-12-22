local dont_trigger_again = false -- Hoxton Breakout Day 1
function ElementAreaTrigger:client_on_executed(...) --Added new function to ElementAreaTrigger
    if not dont_trigger_again then
        if self._id == 102160 then
            dont_trigger_again = true
            managers.hud:SetEndlessClient(true)
        end
    end
end