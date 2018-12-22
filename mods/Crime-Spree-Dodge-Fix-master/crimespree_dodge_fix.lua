--
-- Created by IntelliJ IDEA.
-- User: Chris
-- Date: 4/24/2018
-- Time: 12:14 AM
-- To change this template use File | Settings | File Templates.
--

Hooks:PostHook(CrimeSpreeTweakData, "init_modifiers", "CS_DodgeFix", function(self, tweak_data)
    if self ~= nil and self.modifiers ~= nil  and self.modifiers.stealth ~= nil then
        for count = #self.modifiers.stealth, 1, -1 do
            if string.find(self.modifiers.stealth[count].id, "conceal") then
                table.remove(self.modifiers.stealth, count)
            end
        end
    end
end)