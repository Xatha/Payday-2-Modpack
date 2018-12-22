--[[local overrides = {
    ["lib/managers/hudmanagerpd2"] = "lua/hud_override.lua"
}]]

if not RequiredScript then
    return
end

if RequiredScript == "lib/managers/hudmanagerpd2" then
    dofile(BAI.LuaPath .. "hudmanagerpd2.lua")
    dofile(BAI.LuaPath .. "hud_override.lua")
    if ArmStatic then -- MUI
        BAI:DelayCall("BAI_MUI_HookDelay", 2, function()
            dofile(BAI.LuaPath .. "hudassaultcorner.lua")
            HUDAssaultCorner:InitBAI(true)
        end)
    end
end

if RequiredScript == "core/lib/utils/coreapp" then
    if BAI then
        _G.BAI = BAI or {}
        return
    end

    _G.BAI = {
        --settings = {},
        ModPath = ModPath,
        LuaPath = ModPath .. "lua/",
        CompatibilityPath = ModPath .. "lua/compatibility/",
        MenuCompatibilityPath = ModPath .. "menu/compatibility/",
        SettingsSavePath = SavePath .. "bai.txt",
        Update = false,
        Language = "english"
    }

    function BAI:Hook(object, func, post_call)
        Hooks:PostHook(object, func, "BAI_" .. func, post_call)
    end
    
    function BAI:Unhook(mod, id)
        Hooks:RemovePostHook((mod and (mod .. "_") or "BAI_") .. id)
    end
    
    function BAI:DelayCall(name, t, func)
        DelayedCalls:Add(name, t, func)
    end

    function BAI:Load()
        self:LoadDefaultValues()
        local file = io.open(self.SettingsSavePath, "r")
        if file then
            self:LoadValues(self.settings, json.decode(file:read('*all')) or {})
            file:close()
        end
    end
    
    function BAI:LoadValues(bai_table, file_table)
        for k, v in pairs(file_table) do -- Load subtables in table and calls the same method to load subtables or values in that subtable
            if type(file_table[k]) == "table" then
                self:LoadValues(bai_table[k], v)
            end
        end
        for k, v in pairs(file_table) do -- Load values to the table
            if type(file_table[k]) ~= "table" then
                if bai_table[k] ~= nil then
                    bai_table[k] = v
                end
            end
        end
    end
    
    function BAI:Save()
        local file = io.open(self.SettingsSavePath, "w+")
        if file then
            file:write(json.encode(self.settings))
            file:close()
        end
    end
    
    function BAI:SetValuesInAAI(which, value, time_format)
        local menu = MenuHelper:GetMenu("bai_advanced_assault_info_menu"):items()
        self:SetItemsValue(menu, {["bai_show_" .. which .. "_left_choice"] = true}, value.show)
        if time_format then
            self:SetItemsValue(menu, {["bai_time_format_choice"] = true}, value.time_format)
        end
    end
    
    function BAI:SetBoolValueHostagePanel(which, menu, value)
        self:SetItemsValue(MenuHelper:GetMenu(menu):items(), {["bai_hide_hostage_panel_during_" .. which ..  "_choice"] = true}, value.hidden)
    end
    
    function BAI:SetBoolValue(which, menu, value)
        self:SetItemsValue(MenuHelper:GetMenu(menu):items(), {["bai_" .. which .. "_box_enabled_choice"] = true}, value.enabled)
    end
    
    function BAI:SetColorValues(which, menu, mutated, values)
        local menu_items = MenuHelper:GetMenu(menu):items()
        if values then
            self:SetItemsValue(menu_items, {["bai_" .. which .. "_box_r" .. (mutated and "_mutated" or "") .. "_choice"] = true}, values.r)
            self:SetItemsValue(menu_items, {["bai_" .. which .. "_box_g" .. (mutated and "_mutated" or "") .. "_choice"] = true}, values.g)
            self:SetItemsValue(menu_items, {["bai_" .. which .. "_box_b" .. (mutated and "_mutated" or "") .. "_choice"] = true}, values.b)
        end
        if which == "endless" or which == "survived" then
            self:SetItemsValue(menu_items, {["bai_padlock_end_line_choice"] = true}, which == "endless" and BAI.settings.box.endless_box.padlock_end_line or BAI.settings.box.endless_wave_survived_box.padlock_end_line)
        end
    end
    
    function BAI:SetItemsValue(item, items_table, value) --Original function taken from BLT and rewritten to fulfill mod needs
        if type(items_table) ~= "table" then
            local s = tostring(items_table)
            items_table = {}
            items_table[s] = true
        end
        for _, v in pairs(item) do --Only sets value!
            if items_table[v:name()] and v.set_value then
                if v:type() == "toggle" then
                    v:set_value(value and "on" or "off")
                else
                    v:set_value(value)
                end
            end
        end
    end
    
    function BAI:LoadDefaultValues()
        self.settings =
        {
            hud_compatibility = 1,
            show_wave_survived = true,
            completely_hide_hostage_panel = false,
            show_advanced_assault_info = false,
            trigger_endless_assault_client = true,
            show_difficulty_name_instead_of_skulls = false,
            show_assault_states = false,
            colors =
            {
                assault_box =
                {
                    r = 255,
                    g = 255,
                    b = 0
                },
                assault_box_mutated =
                {
                    r = 211,
                    g = 133,
                    b = 255
                },
                captain_box =
                {
                    r = 255,
                    g = 128,
                    b = 0
                },
                captain_box_mutated =
                {
                    r = 255,
                    g = 133,
                    b = 225
                },
                endless_box =
                {
                    r = 255,
                    g = 0,
                    b = 0
                },
                endless_box_mutated =
                {
                    r = 106,
                    g = 67,
                    b = 255
                },
                survived_box =
                {
                    r = 32,
                    g = 230,
                    b = 32
                },
                escape_box =
                {
                    r = 255,
                    g = 0,
                    b = 0
                },
                holdout_box =
                {
                    r = 255,
                    g = 85,
                    b = 30
                },
                states =
                {
                    control =
                    {
                        r = 255,
                        g = 255,
                        b = 255
                    },
                    anticipation =
                    {
                        r = 186,
                        g = 204,
                        b = 28
                    },
                    build =
                    {
                        r = 255,
                        g = 255,
                        b = 0
                    },
                    sustain =
                    {
                        r = 237,
                        g = 127,
                        b = 127
                    },
                    fade =
                    {
                        r = 186,
                        g = 204,
                        b = 28
                    }
                }
            },
            states =
            {
                control =
                {
                    enabled = true
                },
                anticipation =
                {
                    enabled = true
                },
                build =
                {
                    enabled = true
                },
                sustain =
                {
                    enabled = true
                },
                fade =
                {
                    enabled = true
                }
            },
            hostage_panel =
            {
                assault =
                {
                    hidden = false
                },
                captain =
                {
                    hidden = true
                },
                endless_assault =
                {
                    hidden = true
                }
            },
            advanced_assault_info =
            {
                time_left =
                {
                    show = true,
                    time_format = 1
                },
                spawns_left =
                {
                    show = true
                }
            },
            box =
            {
                endless_box =
                {
                    padlock_end_line = false
                },
                endless_wave_survived_box = 
                {
                    padlock_end_line = false
                }
            },
            hud =
            {
                holoui =
                {
                    update_text_color = false
                },
                pdth_hud_reborn =
                {
                    custom_text_color = false,
                    color =
                    {
                        r = 0,
                        b = 0,
                        g = 0
                    }
                },
                restoration_mod =
                {
                    use_alpha_assault_text = true,
                    use_alpha_endless_text = true,
                    include_cover_text = true,
                    colors =
                    {
                        assault_box =
                        {
                            c1 =
                            {
                                r = 255,
                                g = 0,
                                b = 0
                            },
                            c2 =
                            {
                                r = 0,
                                g = 0,
                                b = 255
                            }
                        },
                        captain_box =
                        {
                            c1 =
                            {
                                r = 0,
                                g = 0,
                                b = 255
                            },
                            c2 =
                            {
                                r = 255,
                                g = 255,
                                b = 255
                            }
                        },
                        endless_box =
                        {
                            c1 =
                            {
                                r = 255,
                                g = 0,
                                b = 0
                            },
                            c2 =
                            {
                                r = 0,
                                g = 0,
                                b = 0
                            }
                        },
                        survived_box =
                        {
                            c1 =
                            {
                                r = 0,
                                g = 255,
                                b = 0
                            },
                            c2 =
                            {
                                r = 255,
                                g = 204,
                                b = 0
                            }
                        },
                        holdout_box =
                        {
                            c1 =
                            {
                                r = 255,
                                g = 85,
                                b = 30
                            },
                            c2 =
                            {
                                r = 0,
                                g = 0,
                                b = 0
                            }
                        },
                        states =
                        {
                            control =
                            {
                                c1 =
                                {
                                    r = 255,
                                    g = 255,
                                    b = 255
                                },
                                c2 =
                                {
                                    r = 0,
                                    g = 0,
                                    b = 0
                                }
                            },
                            anticipation =
                            {
                                c1 =
                                {
                                    r = 186,
                                    g = 204,
                                    b = 28
                                },
                                c2 =
                                {
                                    r = 0,
                                    g = 0,
                                    b = 0
                                }
                            },
                            build =
                            {
                                c1 =
                                {
                                    r = 255,
                                    g = 255,
                                    b = 0
                                },
                                c2 =
                                {
                                    r = 0,
                                    g = 0,
                                    b = 0
                                }
                            },
                            sustain =
                            {
                                c1 =
                                {
                                    r = 237,
                                    g = 127,
                                    b = 127
                                },
                                c2 =
                                {
                                    r = 0,
                                    g = 0,
                                    b = 0
                                }
                            },
                            fade =
                            {
                                c1 =
                                {
                                    r = 186,
                                    g = 204,
                                    b = 28
                                },
                                c2 =
                                {
                                    r = 0,
                                    g = 0,
                                    b = 0
                                }
                            }
                        }
                    }
                },
                mui =
                {
                    assault_text = true
                }
            }
        }
    end
    
    function BAI:GetTexture(texture)
        return 'guis/textures/pd2/hud_icon_' .. texture
    end
    
    function BAI:SetBoxesVisibility(visibility, type)
        if type == "assault" then
            self:SetVisibility(self._assault_box_1_bmp, visibility)
            self:SetVisibility(self._assault_box_2_bmp, visibility)
        elseif type == "endless" then
            self:SetVisibility(self._padlock_box_1_bmp, visibility)
            self:SetVisibility(self._padlock_box_2_bmp, visibility)
        elseif type == "holdout" then
            self:SetVisibility(self._holdout_box_bmp, visibility)
        elseif type == "escape" then
            self:SetVisibility(self._escape_box_bmp, visibility)
        elseif type == "states" then
            self:SetVisibility(self._control_box_bmp, visibility)
            self:SetVisibility(self._anticipation_box_bmp, visibility)
            self:SetVisibility(self._build_box_bmp, visibility)
            self:SetVisibility(self._sustain_box_bmp, visibility)
            self:SetVisibility(self._fade_box_bmp, visibility)
        elseif type == "restoration_mod" or type == "restoration_mod_all" then
            local max = type == "restoration_mod" and 2 or 10
            for i = 1, max, 1 do
                self:SetVisibility(self["_restoration_mod_c" .. i .. "_bmp"], visibility)
            end
        else -- both
            self:SetVisibility(self._assault_box_1_bmp, visibility)
            self:SetVisibility(self._padlock_box_2_bmp, visibility)
        end
    end
    
    function BAI:SetTextsVisibility(visibility, restoration_mod)
        self:SetVisibility(self._control_box_text, visibility)
        self:SetVisibility(self._anticipation_box_text, visibility)
        self:SetVisibility(self._build_box_text, visibility)
        self:SetVisibility(self._sustain_box_text, visibility)
        self:SetVisibility(self._fade_box_text, visibility)
        if restoration_mod then
            self:SetVisibility(self._c1_text, visibility)
            self:SetVisibility(self._c2_text, visibility)
        end
    end
    
    function BAI:SetVisibility(object, visibility)
        if object then
            object:set_visible(visibility)
        end
    end
    
    function BAI:SetTop(object, x)
        if alive(self._panel) and object then
            object:set_top(self._panel:h() * x)
        end
    end
    
    function BAI:SetRight(object, x)
        if alive(self._panel) and object then
            object:set_right(self._panel:right() - self._panel:w() * (0.35 + x))
        end
    end
    
    function BAI:CreateBitmap(texture, color, x, y)
        local bmp
        if texture then
            bmp = self._panel:bitmap({
                h = 48,
                w = 48,
                valign = 'center',
                halign = 'center',
                visible = false,
                texture = texture,
                color = color,
                layer = 350, --tweak_data.gui.MENU_LAYER - 50,
                blend_mode = 'normal'
            })
        else
            bmp = self._panel:bitmap({
                h = 48,
                w = 48,
                valign = 'center',
                halign = 'center',
                visible = false,
                color = color,
                layer = 350, --tweak_data.gui.MENU_LAYER - 50,
                blend_mode = 'normal'
            })
        end
        self:SetRight(bmp, y or 0.02)
        self:SetTop(bmp, x)
        return bmp
    end
    
    function BAI:MakeFineText(text)
        local x, y, w, h = text:text_rect()
    
        text:set_size(w, h)
        text:set_position(math.round(text:x()), math.round(text:y()))
    end
    
    function BAI:CreateText(text, x, y)
        local txt = self._panel:text({
            h = 0, -- This value changes during text resize
            w = 0, -- This one also
            valign = 'center',
            halign = 'center',
            font = tweak_data.menu.pd2_large_font,
            font_size = tweak_data.menu.pd2_medium_font_size,
            text = text,
            visible = false,
            color = Color.white,
            layer = 350, --tweak_data.gui.MENU_LAYER - 50,
            blend_mode = 'add'
        })
        self:SetRight(txt, y or 0.02)
        self:SetTop(txt, x)
        self:MakeFineText(txt) -- Resizes text to fit the text in the panel
        return txt
    end
    
    function BAI:CreateBitmaps()
        if alive(self._panel) and not self._assault_box_1_bmp then -- I can't change textures at runtime, so I have to create all bitmaps, which I will change later
            self._assault_box_1_bmp = self:CreateBitmap(self:GetTexture("assaultbox"), Color.white, 0.10)
            self._padlock_box_1_bmp = self:CreateBitmap(self:GetTexture("padlockbox"), Color.white, 0.10)
            self._holdout_box_bmp = self:CreateBitmap(self:GetTexture("noreturnbox"), Color.white, 0.10)
            self._assault_box_2_bmp = self:CreateBitmap(self:GetTexture("assaultbox"), Color.white, 0.30)
            self._padlock_box_2_bmp = self:CreateBitmap(self:GetTexture("padlockbox"), Color.white, 0.30)
            self._escape_box_bmp = self:CreateBitmap(self:GetTexture("noreturnbox"), Color.white, 0.10)
            self._control_box_bmp = self:CreateBitmap(self:GetTexture("assaultbox"), Color.white, 0.10) -- State boxes
            self._anticipation_box_bmp = self:CreateBitmap(self:GetTexture("assaultbox"), Color.white, 0.20)
            self._build_box_bmp = self:CreateBitmap(self:GetTexture("assaultbox"), Color.white, 0.30)
            self._sustain_box_bmp = self:CreateBitmap(self:GetTexture("assaultbox"), Color.white, 0.40)
            self._fade_box_bmp = self:CreateBitmap(self:GetTexture("assaultbox"), Color.white, 0.50)
            self._holdout_box_bmp = self:CreateBitmap(self:GetTexture("assaultbox"), Color.white, 0.10) -- Holdout mode
            self._pdth_hud_box_bmp = self:CreateBitmap(nil, Color.white, 0.10)
            self._restoration_mod_c1_bmp = self:CreateBitmap(nil, Color.white, 0.10) -- Restoration Mod
            self._restoration_mod_c2_bmp = self:CreateBitmap(nil, Color.white, 0.30)
            self._restoration_mod_c3_bmp = self:CreateBitmap(nil, Color.white, 0.20, 0.07)
            self._restoration_mod_c4_bmp = self:CreateBitmap(nil, Color.white, 0.20)
            self._restoration_mod_c5_bmp = self:CreateBitmap(nil, Color.white, 0.30, 0.07)
            self._restoration_mod_c6_bmp = self:CreateBitmap(nil, Color.white, 0.30)
            self._restoration_mod_c7_bmp = self:CreateBitmap(nil, Color.white, 0.40, 0.07)
            self._restoration_mod_c8_bmp = self:CreateBitmap(nil, Color.white, 0.40)
            self._restoration_mod_c9_bmp = self:CreateBitmap(nil, Color.white, 0.50, 0.07)
            self._restoration_mod_c10_bmp = self:CreateBitmap(nil, Color.white, 0.50)
        end
    end
    
    function BAI:CreateTexts()
        if alive(self._panel) and not self._control_box_text then
            self._control_box_text = self:CreateText(self:GetText("hud_control"), 0.12, 0.20)
            self._anticipation_box_text = self:CreateText(self:GetText("hud_anticipation"), 0.22, 0.20)
            self._build_box_text = self:CreateText(self:GetText("hud_build"), 0.32, 0.20)
            self._sustain_box_text = self:CreateText(self:GetText("hud_sustain"), 0.42, 0.20)
            self._fade_box_text = self:CreateText(self:GetText("hud_fade"), 0.52, 0.20)
            self._c1_text = self:CreateText(self:GetText("bai_c1"), 0.05, 0.10)
            self._c2_text = self:CreateText(self:GetText("bai_c2"), 0.05, 0.05)
        end
    end
    
    function BAI:GetText(text)
        return managers.localization:text(text) .. ":"
    end
    
    function BAI:CreatePanel()
        if self._panel or not managers.menu_component then
            return
        end
        self._panel = managers.menu_component._ws:panel():panel()
    end
    
    function BAI:DestroyPanel()
        if not alive(self._panel) then
            return
        end
        self._panel:clear()
        self._assault_box_1_bmp = nil
        self._assault_box_2_bmp = nil
        self._holdout_box_bmp = nil
        self._padlock_box_1_bmp = nil
        self._padlock_box_2_bmp = nil
        self._control_box_bmp = nil
        self._anticipation_box_bmp = nil
        self._build_box_bmp = nil
        self._sustain_box_bmp = nil
        self._fade_box_bmp = nil
        self._holdout_box_bmp = nil
        self._pdth_hud_box_bmp = nil
        self._restoration_mod_c1_bmp = nil
        self._restoration_mod_c2_bmp = nil
        self._restoration_mod_c3_bmp = nil
        self._restoration_mod_c4_bmp = nil
        self._restoration_mod_c5_bmp = nil
        self._restoration_mod_c6_bmp = nil
        self._restoration_mod_c7_bmp = nil
        self._restoration_mod_c8_bmp = nil
        self._restoration_mod_c9_bmp = nil
        self._restoration_mod_c10_bmp = nil
        self._control_box_text = nil
        self._anticipation_box_text = nil
        self._build_box_text = nil
        self._sustain_box_text = nil
        self._fade_box_text = nil
        self._c1_text = nil
        self._c2_text = nil
        self._panel:parent():remove(self._panel)
        self._panel = nil
    end

    function BAI:GetColor(type)
        if not type then
            return Color.white
        end
        return self:GetColorInTable(self.settings.colors[type])
    end

    function BAI:GetStateColor(type)
        if not type then
            return Color.white
        end
        return self:GetColorInTable(self.settings.colors.states[type])
    end

    function BAI:GetColorRestoration(type, c1)
        if not type then
            return Color.white
        end
        return self:GetColorInTable(self.settings.hud.restoration_mod.colors[type][c1 and "c1" or "c2"])
    end

    function BAI:GetStateColorRestoration(type, c1)
        if not type then
            return Color.white
        end
        return self:GetColorInTable(self.settings.hud.restoration_mod.colors.states[type][c1 and "c1" or "c2"])
    end
    
    function BAI:GetColorInTable(value)
        if value and value.r and value.g and value.b then
            return Color(255, value.r, value.g, value.b) / 255
        end
    end
    
    function BAI:UpdateColor(bmp, type)
        if alive(self._panel) and alive(bmp) then
            bmp:set_color(self:GetColorInTable(type))
        end
    end

    function BAI:IsHostagePanelVisible(type)
        if self.settings.completely_hide_hostage_panel then
            return false
        end
        if not type then
            return true
        end
        return not BAI.settings.hostage_panel[type].hidden -- Hidden is set true => Hide Hostage Panel, otherwise not
    end

    function BAI:IsHostagePanelHidden(type)
        return not self:IsHostagePanelVisible(type)
    end

    function BAI:IsStateEnabled(state)
        if not state then
            return true
        end
        return BAI.settings.states[state].enabled
    end

    function BAI:IsStateDisabled(state)
        return not self:IsStateEnabled(state)
    end

    function BAI:IsOr(string, ...)
        for i = 1, select("#", ...) do
            if string == select(i, ...) then
                return true
            end
        end
        return false
    end

    log("[BAI]: Loading saved settings")
    BAI:Load()
end