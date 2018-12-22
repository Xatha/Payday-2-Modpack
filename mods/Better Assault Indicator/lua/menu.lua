Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_BAI", function(loc)
    local language_filename = nil
    for _, mod in pairs(BLT and BLT.Mods:Mods() or {}) do
        if mod:GetName() == "PAYDAY 2 THAI LANGUAGE Mod" and mod:IsEnabled() then
            language_filename = "thai"
            break
        elseif mod:GetName() == "ChnMod (Patch)" and mod:IsEnabled() then
            language_filename = "chinese"
            break
        end
    end
    if not language_filename then
        for _, filename in pairs(file.GetFiles(BAI.ModPath .. "loc/")) do
            local str = filename:match('^(.*).json$')
            if str and Idstring(str) and Idstring(str):key() == SystemInfo:language():key() then
                language_filename = str
                break
            end
        end
    end
    if language_filename then
        BAI.Language = language_filename
        loc:load_localization_file(BAI.ModPath .. "loc/" .. language_filename .. ".json")
    end
    loc:load_localization_file(BAI.ModPath .. 'loc/english.json', false)
end)

--local hud = "Vanilla"
Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_BAI", function( menu_manager )
    --
    -- Main menu stuff (menu.json)
    --
    MenuCallbackHandler.BAIChangedFocus = function(node, focus)
        if focus then
            if NepgearsyHUDReborn or BAI.settings.hud_compatibility == 4 then
                node:item("bai_completely_hide_hostage_panel_choice"):set_enabled(false)
            end
            if (pdth_hud or BAI.settings.hud_compatibility == 7) or (MUIMenu or BAI.settings.hud_compatibility == 9) then -- 9 = MUI
                node:item("bai_show_difficulty_name_instead_of_skulls_choice"):set_enabled(false)
                node:item("bai_show_advanced_assault_info_choice"):set_enabled(false)
                node:item("bai_advanced_assault_info_menu"):set_enabled(false)
            end
            if MUIMenu or BAI.settings.hud_compatibility == 9 then -- 9 = MUI
                node:item("bai_show_wave_survived_choice"):set_enabled(false)
            end
            BAI:CreatePanel()
            BAI:CreateBitmaps()
            BAI:CreateTexts()
        end
    end

    MenuCallbackHandler.callback_bai_compatibility = function(self, item)
        BAI.settings.hud_compatibility = item:value()
    end

    MenuCallbackHandler.callback_bai_show_wave_survived = function(self, item)
        BAI.settings.show_wave_survived = item:value() == "on"
    end

    MenuCallbackHandler.callback_bai_completely_hide_hostage_panel = function(self, item)
        BAI.settings.completely_hide_hostage_panel = item:value() == "on"
    end

    MenuCallbackHandler.callback_bai_show_advanced_assault_info = function(self, item)
        BAI.settings.show_advanced_assault_info = item:value() == "on"
    end

    MenuCallbackHandler.callback_bai_trigger_endless_assault_client = function(self, item)
        BAI.settings.trigger_endless_assault_client = item:value() == "on"
    end

    MenuCallbackHandler.callback_bai_show_difficulty_name_instead_of_skulls = function(self, item)
        BAI.settings.show_difficulty_name_instead_of_skulls = item:value() == "on"
    end

    MenuCallbackHandler.callback_bai_show_assault_states = function(self, item)
        BAI.settings.show_assault_states = item:value() == "on"
    end

    MenuCallbackHandler.BAISave = function(this, item)
        BAI:Save()
        BAI:DestroyPanel()
        if Utils:IsInHeist() then
            BAI.Update = true
            managers.hud:UpdateColors()
        end
    end

    --
    -- Assault Box menu (assault_box.json)
    --
    MenuCallbackHandler.BAIAssaultBoxChangedFocus = function(node, focus)
        if focus then
            if not bai_assault_loaded then
                BAI:SetColorValues("assault", "bai_assault_box_menu", false, BAI.settings.colors.assault_box)
                BAI:SetColorValues("assault", "bai_assault_box_menu", true, BAI.settings.colors.assault_box_mutated)
                BAI:SetBoolValueHostagePanel("assault", "bai_assault_box_menu", BAI.settings.hostage_panel.assault)
                bai_assault_loaded = true
            end
            if NepgearsyHUDReborn then
                node:item("bai_hide_hostage_panel_during_assault_choice"):set_enabled(false)
            end
            BAI:UpdateColor(BAI._assault_box_1_bmp, BAI.settings.colors.assault_box)
            BAI:UpdateColor(BAI._assault_box_2_bmp, BAI.settings.colors.assault_box_mutated)
        end
        BAI:SetBoxesVisibility(focus, "assault")
    end

    MenuCallbackHandler.callback_bai_assault_box_r = function(self, item)
        BAI.settings.colors.assault_box.r = math.floor(item:value())
        BAI:UpdateColor(BAI._assault_box_1_bmp, BAI.settings.colors.assault_box)
    end

    MenuCallbackHandler.callback_bai_assault_box_g = function(self, item)
        BAI.settings.colors.assault_box.g = math.floor(item:value())
        BAI:UpdateColor(BAI._assault_box_1_bmp, BAI.settings.colors.assault_box)
    end

    MenuCallbackHandler.callback_bai_assault_box_b = function(self, item)
        BAI.settings.colors.assault_box.b = math.floor(item:value())
        BAI:UpdateColor(BAI._assault_box_1_bmp, BAI.settings.colors.assault_box)
    end

    MenuCallbackHandler.callback_bai_assault_box_r_mutated = function(self, item)
        BAI.settings.colors.assault_box_mutated.r = math.floor(item:value())
        BAI:UpdateColor(BAI._assault_box_2_bmp, BAI.settings.colors.assault_box_mutated)
    end

    MenuCallbackHandler.callback_bai_assault_box_g_mutated = function(self, item)
        BAI.settings.colors.assault_box_mutated.g = math.floor(item:value())
        BAI:UpdateColor(BAI._assault_box_2_bmp, BAI.settings.colors.assault_box_mutated)
    end

    MenuCallbackHandler.callback_bai_assault_box_b_mutated = function(self, item)
        BAI.settings.colors.assault_box_mutated.b = math.floor(item:value())
        BAI:UpdateColor(BAI._assault_box_2_bmp, BAI.settings.colors.assault_box_mutated)
    end

    MenuCallbackHandler.callback_bai_hide_hostage_panel_during_assault = function(self, item)
        BAI.settings.hostage_panel.assault.hidden = item:value() == "on"
    end

    MenuCallbackHandler.callback_bai_assault_box_colors_reset = function(self, item)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_assault_box_r_choice"] = true, ["bai_assault_box_g_choice"] = true, ["bai_assault_box_b_mutated_choice"] = true}, 255)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_assault_box_r_mutated_choice"] = true}, 211)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_assault_box_g_mutated_choice"] = true}, 133)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_assault_box_b_choice"] = true}, 0)
    end

    --
    -- Assault Box (Captain) menu (captain_box.json)
    --
    MenuCallbackHandler.BAICaptainBoxChangedFocus = function(node, focus)
        if focus then
            if not bai_captain_loaded then
                BAI:SetColorValues("captain", "bai_captain_box_menu", false, BAI.settings.colors.captain_box)
                BAI:SetColorValues("captain", "bai_captain_box_menu", true, BAI.settings.colors.captain_box_mutated)
                BAI:SetBoolValueHostagePanel("captain", "bai_captain_box_menu", BAI.settings.hostage_panel.captain)
                bai_captain_loaded = true
            end
            if NepgearsyHUDReborn then
                node:item("bai_hide_hostage_panel_during_captain_choice"):set_enabled(false)
            end
            BAI:UpdateColor(BAI._padlock_box_1_bmp, BAI.settings.colors.captain_box)
            BAI:UpdateColor(BAI._padlock_box_2_bmp, BAI.settings.colors.captain_box_mutated)
        end
        BAI:SetBoxesVisibility(focus, "endless") -- Not a bug!
    end

    MenuCallbackHandler.callback_bai_captain_box_r = function(self, item)
        BAI.settings.colors.captain_box.r = math.floor(item:value())
        BAI:UpdateColor(BAI._padlock_box_1_bmp, BAI.settings.colors.captain_box)
    end

    MenuCallbackHandler.callback_bai_captain_box_g = function(self, item)
        BAI.settings.colors.captain_box.g = math.floor(item:value())
        BAI:UpdateColor(BAI._padlock_box_1_bmp, BAI.settings.colors.captain_box)
    end

    MenuCallbackHandler.callback_bai_captain_box_b = function(self, item)
        BAI.settings.colors.captain_box.b = math.floor(item:value())
        BAI:UpdateColor(BAI._padlock_box_1_bmp, BAI.settings.colors.captain_box)
    end

    MenuCallbackHandler.callback_bai_captain_box_r_mutated = function(self, item)
        BAI.settings.colors.captain_box_mutated.r = math.floor(item:value())
        BAI:UpdateColor(BAI._padlock_box_2_bmp, BAI.settings.colors.captain_box_mutated)
    end

    MenuCallbackHandler.callback_bai_captain_box_g_mutated = function(self, item)
        BAI.settings.colors.captain_box_mutated.g = math.floor(item:value())
        BAI:UpdateColor(BAI._padlock_box_2_bmp, BAI.settings.colors.captain_box_mutated)
    end

    MenuCallbackHandler.callback_bai_captain_box_b_mutated = function(self, item)
        BAI.settings.colors.captain_box_mutated.b = math.floor(item:value())
        BAI:UpdateColor(BAI._padlock_box_2_bmp, BAI.settings.colors.captain_box_mutated)
    end

    MenuCallbackHandler.callback_bai_hide_hostage_panel_during_captain = function(self, item)
        BAI.settings.hostage_panel.captain.hidden = item:value() == "on"
    end

    MenuCallbackHandler.callback_bai_captain_box_colors_reset = function(self, item)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_captain_box_r_choice"] = true, ["bai_captain_box_r_mutated_choice"] = true}, 255)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_captain_box_b_mutated_choice"] = true}, 225)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_captain_box_g_mutated_choice"] = true}, 133)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_captain_box_g_choice"] = true}, 128)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_captain_box_b_choice"] = true}, 0)
    end

    --
    -- Endless Box menu (endless_box.json)
    --
    MenuCallbackHandler.BAIEndlessBoxChangedFocus = function(node, focus)
        if focus then
            if not bai_endless_loaded then
                BAI:SetColorValues("endless", "bai_endless_box_menu", false, BAI.settings.colors.endless_box)
                BAI:SetColorValues("endless", "bai_endless_box_menu", true, BAI.settings.colors.endless_box_mutated)
                BAI:SetBoolValueHostagePanel("endless_assault", "bai_endless_box_menu", BAI.settings.hostage_panel.endless_assault)
                bai_endless_loaded = true
            end
            if NepgearsyHUDReborn or VoidUI or Holo or restoration then
                if NepgearsyHUDReborn then
                    node:item("bai_hide_hostage_panel_during_endless_assault_choice"):set_enabled(false)
                end
                node:item("bai_padlock_end_line_choice"):set_enabled(false)
            end
            BAI:UpdateColor(BAI._padlock_box_1_bmp, BAI.settings.colors.endless_box)
            BAI:UpdateColor(BAI._padlock_box_2_bmp, BAI.settings.colors.endless_box_mutated)
        end
        BAI:SetBoxesVisibility(focus, "endless")
    end

    MenuCallbackHandler.callback_bai_endless_box_r = function(self, item)
        BAI.settings.colors.endless_box.r = math.floor(item:value())
        BAI:UpdateColor(BAI._padlock_box_1_bmp, BAI.settings.colors.endless_box)
    end

    MenuCallbackHandler.callback_bai_endless_box_g = function(self, item)
        BAI.settings.colors.endless_box.g = math.floor(item:value())
        BAI:UpdateColor(BAI._padlock_box_1_bmp, BAI.settings.colors.endless_box)
    end

    MenuCallbackHandler.callback_bai_endless_box_b = function(self, item)
        BAI.settings.colors.endless_box.b = math.floor(item:value())
        BAI:UpdateColor(BAI._padlock_box_1_bmp, BAI.settings.colors.endless_box)
    end

    MenuCallbackHandler.callback_bai_endless_box_r_mutated = function(self, item)
        BAI.settings.colors.endless_box_mutated.r = math.floor(item:value())
        BAI:UpdateColor(BAI._padlock_box_2_bmp, BAI.settings.colors.endless_box_mutated)
    end

    MenuCallbackHandler.callback_bai_endless_box_g_mutated = function(self, item)
        BAI.settings.colors.endless_box_mutated.g = math.floor(item:value())
        BAI:UpdateColor(BAI._padlock_box_2_bmp, BAI.settings.colors.endless_box_mutated)
    end

    MenuCallbackHandler.callback_bai_endless_box_b_mutated = function(self, item)
        BAI.settings.colors.endless_box_mutated.b = math.floor(item:value())
        BAI:UpdateColor(BAI._padlock_box_2_bmp, BAI.settings.colors.endless_box_mutated)
    end

    MenuCallbackHandler.callback_bai_hide_hostage_panel_during_endless_assault = function(self, item)
        BAI.settings.hostage_panel.endless_assault.hidden = item:value() == "on"
    end

    MenuCallbackHandler.callback_bai_padlock_end_line_endless_assault = function(self, item)
        BAI.settings.box.endless_box.padlock_end_line = item:value() == "on"
    end

    MenuCallbackHandler.callback_bai_endless_box_colors_reset = function(self, item)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_endless_box_r_choice"] = true, ["bai_endless_box_b_mutated_choice"] = true}, 255)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_endless_box_r_mutated_choice"] = true}, 106)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_endless_box_g_mutated_choice"] = true}, 67)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_endless_box_g_choice"] = true, ["bai_endless_box_b_choice"] = true}, 0)
    end

    --
    -- Wave Survived Box menu (survived_box.json)
    --
    MenuCallbackHandler.BAISurvivedBoxChangedFocus = function(node, focus)
        BAI:SetBoxesVisibility(focus, "both")
        BAI:SetTop(BAI._padlock_box_2_bmp, focus and 0.175 or 0.30)
        if focus then
            if not bai_survived_loaded then
                BAI:SetColorValues("survived", "bai_survived_box_menu", false, nil)
                bai_survived_loaded = true
            end
            if NepgearsyHUDReborn or VoidUI or Holo or restoration then
                node:item("bai_padlock_end_line_choice"):set_enabled(false)
            end
            BAI:UpdateColor(BAI._assault_box_1_bmp, BAI.settings.colors.survived_box)
            BAI:UpdateColor(BAI._padlock_box_2_bmp, BAI.settings.colors.survived_box)
        end
    end

    MenuCallbackHandler.callback_bai_survived_box_r = function(self, item)
        BAI.settings.colors.survived_box.r = math.floor(item:value())
        BAI:UpdateColor(BAI._assault_box_1_bmp, BAI.settings.colors.survived_box)
        BAI:UpdateColor(BAI._padlock_box_2_bmp, BAI.settings.colors.survived_box)
    end

    MenuCallbackHandler.callback_bai_survived_box_g = function(self, item)
        BAI.settings.colors.survived_box.g = math.floor(item:value())
        BAI:UpdateColor(BAI._assault_box_1_bmp, BAI.settings.colors.survived_box)
        BAI:UpdateColor(BAI._padlock_box_2_bmp, BAI.settings.colors.survived_box)
    end

    MenuCallbackHandler.callback_bai_survived_box_b = function(self, item)
        BAI.settings.colors.survived_box.b = math.floor(item:value())
        BAI:UpdateColor(BAI._assault_box_1_bmp, BAI.settings.colors.survived_box)
        BAI:UpdateColor(BAI._padlock_box_2_bmp, BAI.settings.colors.survived_box)
    end

    MenuCallbackHandler.callback_bai_padlock_end_line_endless_wave_survived = function(self, item)
        BAI.settings.box.endless_wave_survived_box.padlock_end_line = item:value() == "on"
    end

    MenuCallbackHandler.callback_bai_survived_box_color_reset = function(self, item)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_survived_box_g_choice"] = true}, 230)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_survived_box_r_choice"] = true, ["bai_survived_box_b_choice"] = true}, 32)
    end

    --
    -- Escape Box menu (escape_box.json)
    --
    MenuCallbackHandler.BAIEscapeBoxChangedFocus = function(node, focus)
        BAI:SetBoxesVisibility(focus, "escape")
        if focus then
            BAI:UpdateColor(BAI._escape_box_bmp, BAI.settings.colors.escape_box)
        end
    end

    MenuCallbackHandler.callback_bai_escape_box_r = function(self, item)
        BAI.settings.colors.escape_box.r = math.floor(item:value())
        BAI:UpdateColor(BAI._escape_box_bmp, BAI.settings.colors.escape_box)
    end

    MenuCallbackHandler.callback_bai_escape_box_g = function(self, item)
        BAI.settings.colors.escape_box.g = math.floor(item:value())
        BAI:UpdateColor(BAI._escape_box_bmp, BAI.settings.colors.escape_box)
    end

    MenuCallbackHandler.callback_bai_escape_box_b = function(self, item)
        BAI.settings.colors.escape_box.b = math.floor(item:value())
        BAI:UpdateColor(BAI._escape_box_bmp, BAI.settings.colors.escape_box)
    end

    MenuCallbackHandler.callback_bai_escape_box_color_reset = function(self, item)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_escape_box_r_choice"] = true}, 255)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_escape_box_g_choice"] = true, ["bai_escape_box_b_choice"] = true}, 0)
    end

    --
    -- Holdout Box menu (holdout_box.json)
    --
    MenuCallbackHandler.BAIHoldoutBoxChangedFocus = function(node, focus)
        BAI:SetBoxesVisibility(focus, "holdout")
        if focus then
            BAI:UpdateColor(BAI._holdout_box_bmp, BAI.settings.colors.holdout_box)
        end
    end

    MenuCallbackHandler.callback_bai_holdout_box_r = function(self, item)
        BAI.settings.colors.holdout_box.r = math.floor(item:value())
        BAI:UpdateColor(BAI._holdout_box_bmp, BAI.settings.colors.holdout_box)
    end

    MenuCallbackHandler.callback_bai_holdout_box_g = function(self, item)
        BAI.settings.colors.holdout_box.g = math.floor(item:value())
        BAI:UpdateColor(BAI._holdout_box_bmp, BAI.settings.colors.holdout_box)
    end

    MenuCallbackHandler.callback_bai_holdout_box_b = function(self, item)
        BAI.settings.colors.holdout_box.b = math.floor(item:value())
        BAI:UpdateColor(BAI._holdout_box_bmp, BAI.settings.colors.holdout_box)
    end

    MenuCallbackHandler.callback_bai_holdout_box_color_reset = function(self, item)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_holdout_box_r_choice"] = true}, 255)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_holdout_box_g_choice"] = true}, 85)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_holdout_box_b_choice"] = true}, 30)
    end

    --
    -- Assault States menu (assault_states.json)
    --
    MenuCallbackHandler.BAIAssaultStatesChangedFocus = function(node, focus)
        BAI:SetBoxesVisibility(focus, "states")
        BAI:SetTextsVisibility(focus)
        if focus then
            if not bai_states_loaded then
                BAI:SetColorValues("control", "bai_assault_states_menu", false, BAI.settings.colors.states.control)
                BAI:SetBoolValue("control", "bai_assault_states_menu", BAI.settings.states.control)
                BAI:SetColorValues("anticipation", "bai_assault_states_menu", false, BAI.settings.colors.states.anticipation)
                BAI:SetBoolValue("anticipation", "bai_assault_states_menu", BAI.settings.states.anticipation)
                BAI:SetColorValues("build", "bai_assault_states_menu", false, BAI.settings.colors.states.build)
                BAI:SetBoolValue("build", "bai_assault_states_menu", BAI.settings.states.build)
                BAI:SetColorValues("sustain", "bai_assault_states_menu", false, BAI.settings.colors.states.sustain)
                BAI:SetBoolValue("sustain", "bai_assault_states_menu", BAI.settings.states.sustain)
                BAI:SetColorValues("fade", "bai_assault_states_menu", false, BAI.settings.colors.states.fade)
                BAI:SetBoolValue("fade", "bai_assault_states_menu", BAI.settings.states.fade)
                bai_states_loaded = true
            end
            BAI:UpdateColor(BAI._control_box_bmp, BAI.settings.colors.states.control)
            BAI:UpdateColor(BAI._anticipation_box_bmp, BAI.settings.colors.states.anticipation)
            BAI:UpdateColor(BAI._build_box_bmp, BAI.settings.colors.states.build)
            BAI:UpdateColor(BAI._sustain_box_bmp, BAI.settings.colors.states.sustain)
            BAI:UpdateColor(BAI._fade_box_bmp, BAI.settings.colors.states.fade)
        end
    end

    --
    -- Control
    --
    MenuCallbackHandler.callback_bai_control_box_r = function(self, item)
        BAI.settings.colors.states.control.r = math.floor(item:value())
        BAI:UpdateColor(BAI._control_box_bmp, BAI.settings.colors.states.control)
    end

    MenuCallbackHandler.callback_bai_control_box_g = function(self, item)
        BAI.settings.colors.states.control.g = math.floor(item:value())
        BAI:UpdateColor(BAI._control_box_bmp, BAI.settings.colors.states.control)
    end

    MenuCallbackHandler.callback_bai_control_box_b = function(self, item)
        BAI.settings.colors.states.control.b = math.floor(item:value())
        BAI:UpdateColor(BAI._control_box_bmp, BAI.settings.colors.states.control)
    end

    MenuCallbackHandler.callback_bai_control_box_enabled = function(self, item)
        BAI.settings.states.control.enabled = item:value() == "on"
    end

    --
    -- Anticipation
    --
    MenuCallbackHandler.callback_bai_anticipation_box_r = function(self, item)
        BAI.settings.colors.states.anticipation.r = math.floor(item:value())
        BAI:UpdateColor(BAI._anticipation_box_bmp, BAI.settings.colors.states.anticipation)
    end

    MenuCallbackHandler.callback_bai_anticipation_box_g = function(self, item)
        BAI.settings.colors.states.anticipation.g = math.floor(item:value())
        BAI:UpdateColor(BAI._anticipation_box_bmp, BAI.settings.colors.states.anticipation)
    end

    MenuCallbackHandler.callback_bai_anticipation_box_b = function(self, item)
        BAI.settings.colors.states.anticipation.b = math.floor(item:value())
        BAI:UpdateColor(BAI._anticipation_box_bmp, BAI.settings.colors.states.anticipation)
    end

    MenuCallbackHandler.callback_bai_anticipation_box_enabled = function(self, item)
        BAI.settings.states.anticipation.enabled = item:value() == "on"
    end

    --
    -- Build
    --
    MenuCallbackHandler.callback_bai_build_box_r = function(self, item)
        BAI.settings.colors.states.build.r = math.floor(item:value())
        BAI:UpdateColor(BAI._build_box_bmp, BAI.settings.colors.states.build)
    end

    MenuCallbackHandler.callback_bai_build_box_g = function(self, item)
        BAI.settings.colors.states.build.g = math.floor(item:value())
        BAI:UpdateColor(BAI._build_box_bmp, BAI.settings.colors.states.build)
    end

    MenuCallbackHandler.callback_bai_build_box_b = function(self, item)
        BAI.settings.colors.states.build.b = math.floor(item:value())
        BAI:UpdateColor(BAI._build_box_bmp, BAI.settings.colors.states.build)
    end

    MenuCallbackHandler.callback_bai_build_box_enabled = function(self, item)
        BAI.settings.states.build.enabled = item:value() == "on"
    end

    --
    -- Sustain
    --
    MenuCallbackHandler.callback_bai_sustain_box_r = function(self, item)
        BAI.settings.colors.states.sustain.r = math.floor(item:value())
        BAI:UpdateColor(BAI._sustain_box_bmp, BAI.settings.colors.states.sustain)
    end

    MenuCallbackHandler.callback_bai_sustain_box_g = function(self, item)
        BAI.settings.colors.states.sustain.g = math.floor(item:value())
        BAI:UpdateColor(BAI._sustain_box_bmp, BAI.settings.colors.states.sustain)
    end

    MenuCallbackHandler.callback_bai_sustain_box_b = function(self, item)
        BAI.settings.colors.states.sustain.b = math.floor(item:value())
        BAI:UpdateColor(BAI._sustain_box_bmp, BAI.settings.colors.states.sustain)
    end

    MenuCallbackHandler.callback_bai_sustain_box_enabled = function(self, item)
        BAI.settings.states.sustain.enabled = item:value() == "on"
    end

    --
    -- Fade
    --
    MenuCallbackHandler.callback_bai_fade_box_r = function(self, item)
        BAI.settings.colors.states.fade.r = math.floor(item:value())
        BAI:UpdateColor(BAI._fade_box_bmp, BAI.settings.colors.states.fade)
    end

    MenuCallbackHandler.callback_bai_fade_box_g = function(self, item)
        BAI.settings.colors.states.fade.g = math.floor(item:value())
        BAI:UpdateColor(BAI._fade_box_bmp, BAI.settings.colors.states.fade)
    end

    MenuCallbackHandler.callback_bai_fade_box_b = function(self, item)
        BAI.settings.colors.states.fade.b = math.floor(item:value())
        BAI:UpdateColor(BAI._fade_box_bmp, BAI.settings.colors.states.fade)
    end

    MenuCallbackHandler.callback_bai_fade_box_enabled = function(self, item)
        BAI.settings.states.fade.enabled = item:value() == "on"
    end

    MenuCallbackHandler.callback_bai_assault_states_colors_reset = function(self, item)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_control_box_r_choice"] = true, ["bai_control_box_g_choice"] = true, ["bai_control_box_b_choice"] = true, ["bai_build_box_r_choice"] = true, ["bai_build_box_g_choice"] = true}, 255)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_anticipation_box_r_choice"] = true, ["bai_fade_box_r_choice"] = true}, 186)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_anticipation_box_g_choice"] = true, ["bai_fade_box_g_choice"] = true}, 204)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_anticipation_box_b_choice"] = true, ["bai_fade_box_b_choice"] = true}, 28)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_sustain_box_r_choice"] = true}, 237)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_sustain_box_g_choice"] = true, ["bai_sustain_box_b_choice"] = true}, 127)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_build_box_b_choice"] = true}, 0)
    end

    --
    -- Advanced Assault Info menu (advanced_assault_info.json)
    --
    MenuCallbackHandler.BAIAdvancedAssaultInfoChangedFocus = function(node, focus)
        if focus then
            if not bai_aai_loaded then
                BAI:SetValuesInAAI("time", BAI.settings.advanced_assault_info.time_left, true)
                BAI:SetValuesInAAI("spawns", BAI.settings.advanced_assault_info.spawns_left)
                bai_aai_loaded = true
            end
        end
    end

    MenuCallbackHandler.callback_bai_show_time_left = function(self, item)
        BAI.settings.advanced_assault_info.time_left.show = item:value() == "on"
    end

    MenuCallbackHandler.callback_bai_time_format = function(self, item)
        BAI.settings.advanced_assault_info.time_left.time_format = item:value()
    end

    MenuCallbackHandler.callback_bai_show_spawns_left = function(self, item)
        BAI.settings.advanced_assault_info.spawns_left.show = item:value() == "on"
    end

    --
    -- HoloUI options (compatibility/holoui.json)
    --
    MenuCallbackHandler.callback_bai_holoui_update_text_color = function(self, item)
        BAI.settings.hud.holoui.update_text_color = item:value() == "on"
    end

    --
    -- PD:TH HUD Reborn options (compatibility/pdth_hud_reborn.json)
    --
    MenuCallbackHandler.BAIPDTHHUDRebornChangedFocus = function(node, focus)
        if focus then
            if not bai_pdthhudreborn then
                BAI:SetColorValues("pdth_hud_reborn_text", "bai_pdth_hud_reborn_menu", false, BAI.settings.hud.pdth_hud_reborn.color)
                bai_pdthhudreborn = true
            end
            BAI:UpdateColor(BAI._pdth_hud_box_bmp, BAI.settings.hud.pdth_hud_reborn.color)
        end
        BAI:SetVisibility(BAI._pdth_hud_box_bmp, focus)
    end

    MenuCallbackHandler.callback_bai_pdth_hud_reborn_custom_text_color = function(self, item)
        BAI.settings.hud.pdth_hud_reborn.custom_text_color = item:value() == "on"
    end

    MenuCallbackHandler.callback_bai_pdth_hud_reborn_text_box_r = function(self, item)
        BAI.settings.hud.pdth_hud_reborn.color.r = math.floor(item:value())
        BAI:UpdateColor(BAI._pdth_hud_box_bmp, BAI.settings.hud.pdth_hud_reborn.color)
    end

    MenuCallbackHandler.callback_bai_pdth_hud_reborn_text_box_g = function(self, item)
        BAI.settings.hud.pdth_hud_reborn.color.g = math.floor(item:value())
        BAI:UpdateColor(BAI._pdth_hud_box_bmp, BAI.settings.hud.pdth_hud_reborn.color)
    end

    MenuCallbackHandler.callback_bai_pdth_hud_reborn_text_box_b = function(self, item)
        BAI.settings.hud.pdth_hud_reborn.color.b = math.floor(item:value())
        BAI:UpdateColor(BAI._pdth_hud_box_bmp, BAI.settings.hud.pdth_hud_reborn.color)
    end

    --
    -- Restoration Mod options (compatibility/restoration_mod.json)
    --
    MenuCallbackHandler.callback_bai_restoration_mod_use_alpha_assault_text = function(self, item)
        BAI.settings.hud.restoration_mod.use_alpha_assault_text = item:value() == "on"
    end

    MenuCallbackHandler.callback_bai_restoration_mod_use_alpha_endless_text = function(self, item)
        BAI.settings.hud.restoration_mod.use_alpha_endless_text = item:value() == "on"
    end

    MenuCallbackHandler.callback_bai_restoration_mod_include_cover_text = function(self, item)
        BAI.settings.hud.restoration_mod.include_cover_text = item:value() == "on"
    end

    --
    -- Assault Box in Restoration Mod options (compatibility/restoration_mod/assault_box.json)
    --
    MenuCallbackHandler.BAIRestorationModAssaultBoxChangedFocus = function(node, focus)
        if focus then
            if not bai_restorationmod_assaultbox then
                BAI:SetColorValues("restoration_mod_c1_assault", "bai_restoration_mod_assault_box_menu", false, BAI.settings.hud.restoration_mod.colors.assault_box.c1)
                BAI:SetColorValues("restoration_mod_c2_assault", "bai_restoration_mod_assault_box_menu", false, BAI.settings.hud.restoration_mod.colors.assault_box.c2)
                bai_restorationmod_assaultbox = true
            end
            BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.assault_box.c1)
            BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.assault_box.c2)
        end
        BAI:SetBoxesVisibility(focus, "restoration_mod")
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_assault_box_r = function(self, item)
        BAI.settings.hud.restoration_mod.colors.assault_box.c1.r = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.assault_box.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_assault_box_g = function(self, item)
        BAI.settings.hud.restoration_mod.colors.assault_box.c1.g = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.assault_box.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_assault_box_b = function(self, item)
        BAI.settings.hud.restoration_mod.colors.assault_box.c1.b = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.assault_box.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_assault_box_r = function(self, item)
        BAI.settings.hud.restoration_mod.colors.assault_box.c2.r = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.assault_box.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_assault_box_g = function(self, item)
        BAI.settings.hud.restoration_mod.colors.assault_box.c2.g = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.assault_box.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_assault_box_b = function(self, item)
        BAI.settings.hud.restoration_mod.colors.assault_box.c2.b = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.assault_box.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_assault_box_colors_reset = function(self, item)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_restoration_mod_c1_assault_box_r_choice"] = true, ["bai_restoration_mod_c2_assault_box_b_choice"] = true}, 255)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_restoration_mod_c1_assault_box_g_choice"] = true, ["bai_restoration_mod_c1_assault_box_b_choice"] = true, ["bai_restoration_mod_c2_assault_box_r_choice"] = true, ["bai_restoration_mod_c2_assault_box_g_choice"] = true}, 0)
    end

    --
    -- Captain Box in Restoration Mod options (compatibility/restoration_mod/captain_box.json)
    --
    MenuCallbackHandler.BAIRestorationModCaptainBoxChangedFocus = function(node, focus)
        if focus then
            if not bai_restorationmod_captainbox then
                BAI:SetColorValues("restoration_mod_c1_captain", "bai_restoration_mod_captain_box_menu", false, BAI.settings.hud.restoration_mod.colors.captain_box.c1)
                BAI:SetColorValues("restoration_mod_c2_captain", "bai_restoration_mod_captain_box_menu", false, BAI.settings.hud.restoration_mod.colors.captain_box.c2)
                bai_restorationmod_captainbox = true
            end
            BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.captain_box.c1)
            BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.captain_box.c2)
        end
        BAI:SetBoxesVisibility(focus, "restoration_mod")
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_captain_box_r = function(self, item)
        BAI.settings.hud.restoration_mod.colors.captain_box.c1.r = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.captain_box.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_captain_box_g = function(self, item)
        BAI.settings.hud.restoration_mod.colors.captain_box.c1.g = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.captain_box.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_captain_box_b = function(self, item)
        BAI.settings.hud.restoration_mod.colors.captain_box.c1.b = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.captain_box.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_captain_box_r = function(self, item)
        BAI.settings.hud.restoration_mod.colors.captain_box.c2.r = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.captain_box.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_captain_box_g = function(self, item)
        BAI.settings.hud.restoration_mod.colors.captain_box.c2.g = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.captain_box.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_captain_box_b = function(self, item)
        BAI.settings.hud.restoration_mod.colors.captain_box.c2.b = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.captain_box.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_captain_box_colors_reset = function(self, item)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_restoration_mod_c1_captain_box_b_choice"] = true, ["bai_restoration_mod_c2_captain_box_r_choice"] = true, ["bai_restoration_mod_c2_captain_box_g_choice"] = true, ["bai_restoration_mod_c2_captain_box_b_choice"] = true}, 255)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_restoration_mod_c1_captain_box_r_choice"] = true, ["bai_restoration_mod_c1_captain_box_g_choice"] = true}, 0)
    end

    --
    -- Holdout Box in Restoration Mod options (compatibility/restoration_mod/holdout_box.json)
    --
    MenuCallbackHandler.BAIRestorationModHoldoutBoxChangedFocus = function(node, focus)
        if focus then
            if not bai_restorationmod_holdoutbox then
                BAI:SetColorValues("restoration_mod_c1_holdout", "bai_restoration_mod_holdout_box_menu", false, BAI.settings.hud.restoration_mod.colors.holdout_box.c1)
                BAI:SetColorValues("restoration_mod_c2_holdout", "bai_restoration_mod_holdout_box_menu", false, BAI.settings.hud.restoration_mod.colors.holdout_box.c2)
                bai_restorationmod_holdoutbox = true
            end
            BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.holdout_box.c1)
            BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.holdout_box.c2)
        end
        BAI:SetBoxesVisibility(focus, "restoration_mod")
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_holdout_box_r = function(self, item)
        BAI.settings.hud.restoration_mod.colors.holdout_box.c1.r = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.holdout_box.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_holdout_box_g = function(self, item)
        BAI.settings.hud.restoration_mod.colors.holdout_box.c1.g = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.holdout_box.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_holdout_box_b = function(self, item)
        BAI.settings.hud.restoration_mod.colors.holdout_box.c1.b = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.holdout_box.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_holdout_box_r = function(self, item)
        BAI.settings.hud.restoration_mod.colors.holdout_box.c2.r = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.holdout_box.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_holdout_box_g = function(self, item)
        BAI.settings.hud.restoration_mod.colors.holdout_box.c2.g = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.holdout_box.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_holdout_box_b = function(self, item)
        BAI.settings.hud.restoration_mod.colors.holdout_box.c2.b = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.holdout_box.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_holdout_box_colors_reset = function(self, item)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_restoration_mod_c1_holdout_box_r_choice"] = true}, 255)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_restoration_mod_c1_holdout_box_g_choice"] = true}, 85)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_restoration_mod_c1_holdout_box_b_choice"] = true}, 30)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_restoration_mod_c2_holdout_box_r_choice"] = true, ["bai_restoration_mod_c2_holdout_box_g_choice"] = true, ["bai_restoration_mod_c2_holdout_box_b_choice"] = true}, 0)
    end

    --
    -- Endless Box in Restoration Mod options (compatibility/restoration_mod/endless_box.json)
    --
    MenuCallbackHandler.BAIRestorationModEndlessBoxChangedFocus = function(node, focus)
        if focus then
            if not bai_restorationmod_endlessbox then
                BAI:SetColorValues("restoration_mod_c1_endless", "bai_restoration_mod_endless_box_menu", false, BAI.settings.hud.restoration_mod.colors.endless_box.c1)
                BAI:SetColorValues("restoration_mod_c2_endless", "bai_restoration_mod_endless_box_menu", false, BAI.settings.hud.restoration_mod.colors.endless_box.c2)
                bai_restorationmod_endlessbox = true
            end
            BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.endless_box.c1)
            BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.endless_box.c2)
        end
        BAI:SetBoxesVisibility(focus, "restoration_mod")
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_endless_box_r = function(self, item)
        BAI.settings.hud.restoration_mod.colors.endless_box.c1.r = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.endless_box.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_endless_box_g = function(self, item)
        BAI.settings.hud.restoration_mod.colors.endless_box.c1.g = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.endless_box.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_endless_box_b = function(self, item)
        BAI.settings.hud.restoration_mod.colors.endless_box.c1.b = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.endless_box.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_endless_box_r = function(self, item)
        BAI.settings.hud.restoration_mod.colors.endless_box.c2.r = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.endless_box.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_endless_box_g = function(self, item)
        BAI.settings.hud.restoration_mod.colors.endless_box.c2.g = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.endless_box.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_endless_box_b = function(self, item)
        BAI.settings.hud.restoration_mod.colors.endless_box.c2.b = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.endless_box.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_endless_box_colors_reset = function(self, item)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_restoration_mod_c1_endless_box_r_choice"] = true}, 255)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_restoration_mod_c1_endless_box_g_choice"] = true, ["bai_restoration_mod_c1_endless_box_b_choice"] = true, ["bai_restoration_mod_c2_endless_box_r_choice"] = true, ["bai_restoration_mod_c2_endless_box_g_choice"] = true, ["bai_restoration_mod_c2_endless_box_b_choice"] = true}, 0)
    end

    --
    -- Survived Box in Restoration Mod options (compatibility/restoration_mod/survived_box.json)
    --
    MenuCallbackHandler.BAIRestorationModSurvivedBoxChangedFocus = function(node, focus)
        if focus then
            if not bai_restorationmod_survivedbox then
                BAI:SetColorValues("restoration_mod_c1_survived", "bai_restoration_mod_survived_box_menu", false, BAI.settings.hud.restoration_mod.colors.survived_box.c1)
                BAI:SetColorValues("restoration_mod_c2_survived", "bai_restoration_mod_survived_box_menu", false, BAI.settings.hud.restoration_mod.colors.survived_box.c2)
                bai_restorationmod_survivedbox = true
            end
            BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.survived_box.c1)
            BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.survived_box.c2)
        end
        BAI:SetBoxesVisibility(focus, "restoration_mod")
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_survived_box_r = function(self, item)
        BAI.settings.hud.restoration_mod.colors.survived_box.c1.r = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.survived_box.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_survived_box_g = function(self, item)
        BAI.settings.hud.restoration_mod.colors.survived_box.c1.g = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.survived_box.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_survived_box_b = function(self, item)
        BAI.settings.hud.restoration_mod.colors.survived_box.c1.b = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.survived_box.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_survived_box_r = function(self, item)
        BAI.settings.hud.restoration_mod.colors.survived_box.c2.r = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.survived_box.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_survived_box_g = function(self, item)
        BAI.settings.hud.restoration_mod.colors.survived_box.c2.g = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.survived_box.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_survived_box_b = function(self, item)
        BAI.settings.hud.restoration_mod.colors.survived_box.c2.b = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.survived_box.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_survived_box_colors_reset = function(self, item)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_restoration_mod_c1_survived_box_g_choice"] = true, ["bai_restoration_mod_c2_survived_box_r_choice"] = true}, 255)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_restoration_mod_c2_survived_box_g_choice"] = true}, 204)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_restoration_mod_c1_survived_box_r_choice"] = true, ["bai_restoration_mod_c1_survived_box_b_choice"] = true, ["bai_restoration_mod_c2_survived_box_b_choice"] = true}, 0)
    end

    --
    -- Assault States in Restoration Mod options (compatibility/restoration_mod/assault_states.json)
    --
    MenuCallbackHandler.BAIRestorationModAssaultStatesChangedFocus = function(node, focus)
        BAI:SetBoxesVisibility(focus, "restoration_mod_all")
        BAI:SetTextsVisibility(focus, true)
        BAI:SetTop(BAI._restoration_mod_c2_bmp, focus and 0.10 or 0.30)
        BAI:SetRight(BAI._restoration_mod_c1_bmp, focus and 0.07 or 0.02)
        if focus then
            if not bai_restorationmod_assaultstates then
                BAI:SetColorValues("restoration_mod_c1_control", "bai_restoration_mod_assault_states_menu", false, BAI.settings.hud.restoration_mod.colors.states.control.c1)
                BAI:SetColorValues("restoration_mod_c2_control", "bai_restoration_mod_assault_states_menu", false, BAI.settings.hud.restoration_mod.colors.states.control.c2)
                BAI:SetColorValues("restoration_mod_c1_anticipation", "bai_restoration_mod_assault_states_menu", false, BAI.settings.hud.restoration_mod.colors.states.anticipation.c1)
                BAI:SetColorValues("restoration_mod_c2_anticipation", "bai_restoration_mod_assault_states_menu", false, BAI.settings.hud.restoration_mod.colors.states.anticipation.c2)
                BAI:SetColorValues("restoration_mod_c1_build", "bai_restoration_mod_assault_states_menu", false, BAI.settings.hud.restoration_mod.colors.states.build.c1)
                BAI:SetColorValues("restoration_mod_c2_build", "bai_restoration_mod_assault_states_menu", false, BAI.settings.hud.restoration_mod.colors.states.build.c2)
                BAI:SetColorValues("restoration_mod_c1_sustain", "bai_restoration_mod_assault_states_menu", false, BAI.settings.hud.restoration_mod.colors.states.sustain.c1)
                BAI:SetColorValues("restoration_mod_c2_sustain", "bai_restoration_mod_assault_states_menu", false, BAI.settings.hud.restoration_mod.colors.states.sustain.c2)
                BAI:SetColorValues("restoration_mod_c1_fade", "bai_restoration_mod_assault_states_menu", false, BAI.settings.hud.restoration_mod.colors.states.fade.c1)
                BAI:SetColorValues("restoration_mod_c2_fade", "bai_restoration_mod_assault_states_menu", false, BAI.settings.hud.restoration_mod.colors.states.fade.c2)
                bai_restorationmod_assaultstates = true
            end
            BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.states.control.c1)
            BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.states.control.c2)
            BAI:UpdateColor(BAI._restoration_mod_c3_bmp, BAI.settings.hud.restoration_mod.colors.states.anticipation.c1)
            BAI:UpdateColor(BAI._restoration_mod_c4_bmp, BAI.settings.hud.restoration_mod.colors.states.anticipation.c2)
            BAI:UpdateColor(BAI._restoration_mod_c5_bmp, BAI.settings.hud.restoration_mod.colors.states.build.c1)
            BAI:UpdateColor(BAI._restoration_mod_c6_bmp, BAI.settings.hud.restoration_mod.colors.states.build.c2)
            BAI:UpdateColor(BAI._restoration_mod_c7_bmp, BAI.settings.hud.restoration_mod.colors.states.sustain.c1)
            BAI:UpdateColor(BAI._restoration_mod_c8_bmp, BAI.settings.hud.restoration_mod.colors.states.sustain.c2)
            BAI:UpdateColor(BAI._restoration_mod_c9_bmp, BAI.settings.hud.restoration_mod.colors.states.fade.c1)
            BAI:UpdateColor(BAI._restoration_mod_c10_bmp, BAI.settings.hud.restoration_mod.colors.states.fade.c2)
        end
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_control_box_r = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.control.c1.r = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.states.control.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_control_box_g = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.control.c1.g = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.states.control.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_control_box_b = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.control.c1.b = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c1_bmp, BAI.settings.hud.restoration_mod.colors.states.control.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_control_box_r = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.control.c2.r = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.states.control.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_control_box_g = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.control.c2.g = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.states.control.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_control_box_b = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.control.c2.b = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c2_bmp, BAI.settings.hud.restoration_mod.colors.states.control.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_anticipation_box_r = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.anticipation.c1.r = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c3_bmp, BAI.settings.hud.restoration_mod.colors.states.anticipation.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_anticipation_box_g = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.anticipation.c1.g = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c3_bmp, BAI.settings.hud.restoration_mod.colors.states.anticipation.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_anticipation_box_b = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.anticipation.c1.b = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c3_bmp, BAI.settings.hud.restoration_mod.colors.states.anticipation.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_anticipation_box_r = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.anticipation.c2.r = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c4_bmp, BAI.settings.hud.restoration_mod.colors.states.anticipation.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_anticipation_box_g = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.anticipation.c2.g = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c4_bmp, BAI.settings.hud.restoration_mod.colors.states.anticipation.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_anticipation_box_b = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.anticipation.c2.b = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c4_bmp, BAI.settings.hud.restoration_mod.colors.states.anticipation.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_build_box_r = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.build.c1.r = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c5_bmp, BAI.settings.hud.restoration_mod.colors.states.build.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_build_box_g = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.build.c1.g = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c5_bmp, BAI.settings.hud.restoration_mod.colors.states.build.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_build_box_b = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.build.c1.b = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c5_bmp, BAI.settings.hud.restoration_mod.colors.states.build.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_build_box_r = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.build.c2.r = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c6_bmp, BAI.settings.hud.restoration_mod.colors.states.build.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_build_box_g = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.build.c2.g = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c6_bmp, BAI.settings.hud.restoration_mod.colors.states.build.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_build_box_b = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.build.c2.b = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c6_bmp, BAI.settings.hud.restoration_mod.colors.states.build.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_sustain_box_r = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.sustain.c1.r = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c7_bmp, BAI.settings.hud.restoration_mod.colors.states.sustain.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_sustain_box_g = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.sustain.c1.g = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c7_bmp, BAI.settings.hud.restoration_mod.colors.states.sustain.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_sustain_box_b = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.sustain.c1.b = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c7_bmp, BAI.settings.hud.restoration_mod.colors.states.sustain.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_sustain_box_r = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.sustain.c2.r = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c8_bmp, BAI.settings.hud.restoration_mod.colors.states.sustain.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_sustain_box_g = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.sustain.c2.g = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c8_bmp, BAI.settings.hud.restoration_mod.colors.states.sustain.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_sustain_box_b = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.sustain.c2.b = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c8_bmp, BAI.settings.hud.restoration_mod.colors.states.sustain.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_fade_box_r = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.fade.c1.r = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c9_bmp, BAI.settings.hud.restoration_mod.colors.states.fade.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_fade_box_g = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.fade.c1.g = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c9_bmp, BAI.settings.hud.restoration_mod.colors.states.fade.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c1_fade_box_b = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.fade.c1.b = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c9_bmp, BAI.settings.hud.restoration_mod.colors.states.fade.c1)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_fade_box_r = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.fade.c2.r = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c10_bmp, BAI.settings.hud.restoration_mod.colors.states.fade.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_fade_box_g = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.fade.c2.g = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c10_bmp, BAI.settings.hud.restoration_mod.colors.states.fade.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_c2_fade_box_b = function(self, item)
        BAI.settings.hud.restoration_mod.colors.states.fade.c2.b = math.floor(item:value())
        BAI:UpdateColor(BAI._restoration_mod_c10_bmp, BAI.settings.hud.restoration_mod.colors.states.fade.c2)
    end

    MenuCallbackHandler.callback_bai_restoration_mod_assault_states_colors_reset = function(self, item)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_restoration_mod_c1_control_box_r_choice"] = true, ["bai_restoration_mod_c1_control_box_g_choice"] = true, ["bai_restoration_mod_c1_control_box_b_choice"] = true, ["bai_restoration_mod_c1_build_box_r_choice"] = true, ["bai_restoration_mod_c1_build_box_g_choice"] = true}, 255)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_restoration_mod_c1_sustain_box_r_choice"] = true}, 237)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_restoration_mod_c1_anticipation_box_g_choice"] = true, ["bai_restoration_mod_c1_fade_box_g_choice"] = true}, 204)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_restoration_mod_c1_anticipation_box_r_choice"] = true, ["bai_restoration_mod_c1_fade_box_r_choice"] = true}, 186)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_restoration_mod_c1_sustain_box_g_choice"] = true, ["bai_restoration_mod_c1_sustain_box_b_choice"] = true}, 127)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_restoration_mod_c1_anticipation_box_b_choice"] = true, ["bai_restoration_mod_c1_fade_box_b_choice"] = true}, 28)
        MenuHelper:ResetItemsToDefaultValue(item, {["bai_restoration_mod_c2_control_box_r_choice"] = true, ["bai_restoration_mod_c2_control_box_g"] = true, ["bai_restoration_mod_c2_control_box_b_choice"] = true, ["bai_restoration_mod_c2_anticipation_box_r_choice"] = true, ["bai_restoration_mod_c2_anticipation_box_g_choice"] = true, ["bai_restoration_mod_c2_anticipation_box_b_choice"] = true, ["bai_restoration_mod_c1_build_box_b_choice"] = true, ["bai_restoration_mod_c2_build_box_r_choice"] = true, ["bai_restoration_mod_c2_build_box_g_choice"] = true, ["bai_restoration_mod_c2_build_box_b_choice"] = true, ["bai_restoration_mod_c2_sustain_box_r_choice"] = true, ["bai_restoration_mod_c2_sustain_box_g_choice"] = true, ["bai_restoration_mod_c2_sustain_box_b_choice"] = true, ["bai_restoration_mod_c2_fade_box_r_choice"] = true, ["bai_restoration_mod_c2_fade_box_g_choice"] = true, ["bai_restoration_mod_c2_fade_box_b_choice"] = true}, 0)
    end

    --
    -- MUI Options (compatibility/mui.json)
    --
    MenuCallbackHandler.callback_bai_mui_assault_text = function(self, item)
        BAI.settings.hud.mui.assault_text = item:value() == "on"
    end

    --
    -- Loading submenu code section
    --
    MenuHelper:LoadFromJsonFile(BAI.ModPath .. "menu/menu.json", BAI, BAI.settings)
    MenuHelper:LoadFromJsonFile(BAI.ModPath .. "menu/assault_box.json", BAI)
    MenuHelper:LoadFromJsonFile(BAI.ModPath .. "menu/captain_box.json", BAI)
    MenuHelper:LoadFromJsonFile(BAI.ModPath .. "menu/holdout_box.json", BAI, BAI.settings.colors.holdout_box)
    MenuHelper:LoadFromJsonFile(BAI.ModPath .. "menu/endless_box.json", BAI)
    MenuHelper:LoadFromJsonFile(BAI.ModPath .. "menu/survived_box.json", BAI, BAI.settings.colors.survived_box)
    MenuHelper:LoadFromJsonFile(BAI.ModPath .. "menu/escape_box.json", BAI, BAI.settings.colors.escape_box)
    MenuHelper:LoadFromJsonFile(BAI.ModPath .. "menu/assault_states.json", BAI)
    MenuHelper:LoadFromJsonFile(BAI.ModPath .. "menu/advanced_assault_info.json", BAI)
    if Holo or BAI.settings.hud_compatibility == 5 then
        MenuHelper:LoadFromJsonFile(BAI.MenuCompatibilityPath .. "holoui.json", BAI, BAI.settings.hud.holoui)
    end
    if pdth_hud or BAI.settings.hud_compatibility == 7 then
        MenuHelper:LoadFromJsonFile(BAI.MenuCompatibilityPath .. "pdth_hud_reborn.json", BAI, BAI.settings.hud.pdth_hud_reborn)
    end
    if restoration or BAI.settings.hud_compatibility == 8 then
        MenuHelper:LoadFromJsonFile(BAI.MenuCompatibilityPath .. "restoration_mod.json", BAI, BAI.settings.hud.restoration_mod)
        MenuHelper:LoadFromJsonFile(BAI.MenuCompatibilityPath .. "restoration_mod/assault_box.json", BAI)
        MenuHelper:LoadFromJsonFile(BAI.MenuCompatibilityPath .. "restoration_mod/captain_box.json", BAI)
        MenuHelper:LoadFromJsonFile(BAI.MenuCompatibilityPath .. "restoration_mod/holdout_box.json", BAI)
        MenuHelper:LoadFromJsonFile(BAI.MenuCompatibilityPath .. "restoration_mod/endless_box.json", BAI)
        MenuHelper:LoadFromJsonFile(BAI.MenuCompatibilityPath .. "restoration_mod/survived_box.json", BAI)
        MenuHelper:LoadFromJsonFile(BAI.MenuCompatibilityPath .. "restoration_mod/assault_states.json", BAI)
    end
    if MUIMenu or BAI.settings.hud_compatibility == 9 then
        MenuHelper:LoadFromJsonFile(BAI.MenuCompatibilityPath .. "mui.json", BAI.settings.hud.mui)
    end
end)