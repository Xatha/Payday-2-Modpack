local _f_create_assault_corner = HUDManager._create_assault_corner
function HUDManager:_create_assault_corner()
    _f_create_assault_corner(self)
    dofile(BAI.LuaPath .. "hudassaultcorner.lua")
    if self._hud_assault_corner then
        self._hud_assault_corner:InitBAI()
    else
        log("[BAI] Can't execute code in HUDAssaultCorner! Are you sure it wasn't deleted?")
    end
end