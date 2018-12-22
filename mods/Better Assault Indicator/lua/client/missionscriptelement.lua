local heists = { "rvd2", "red2", "vit" }
local id = { 100023, 101685, 102042 }
local requested_id = nil
local _f_on_executed = MissionScriptElement.client_on_executed
local dont_trigger_again = false
function MissionScriptElement:client_on_executed()
    _f_on_executed(self)
    if not dont_trigger_again then
        if self._id == requested_id then
            dont_trigger_again = true
            managers.hud:SetEndlessClient(true, true)
        end
    end
end

function GetID()
    for k, v in pairs(heists) do
        if Global.game_settings.level_id == v then
            requested_id = id[k]
            break
        end
    end
end

GetID()