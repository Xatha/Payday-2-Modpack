local old = MenuNodeMainGui._setup_item_rows
function MenuNodeMainGui:_setup_item_rows(node)
    old(self, node)
    --
    -- Incompatibilities
    --
    if BAI.warnings_showed then
        return
    end
    if WolfHUD and WolfHUD:getSetting({"AssaultBanner", "USE_ADV_ASSAULT"}, true) then
        QuickMenu:new(
            managers.localization:text("bai_detected_wolfhud"),
            managers.localization:text("bai_detected_wolfhud_desc"),
            {
                {
                    text = managers.localization:text("bai_button_ok"),
                    is_cancel_button = true
                }
            },
            true
        )
        WolfHUD:setSetting({"AssaultBanner", "USE_ADV_ASSAULT"}, false)
        WolfHUD:Save() -- Save WolfHUD's settings so it would be disabled next time
        BAI.settings.show_advanced_assault_info = true
        BAI.settings.show_assault_states = true
        BAI:Save()
    end
    if AssaultStates then
        QuickMenu:new(
            managers.localization:text("bai_detected_assault_states"),
            managers.localization:text("bai_detected_assault_states_desc"),
            {
                {
                    text = managers.localization:text("bai_button_ok"),
                    is_cancel_button = true
                }
            },
            true
        )
    end
    if WaveSurvived then
        QuickMenu:new(
            managers.localization:text("bai_detected_wave_survived"),
            managers.localization:text("bai_detected_wave_survived_desc"),
            {
                {
                    text = managers.localization:text("bai_button_ok"),
                    is_cancel_button = true
                }
            },
            true
        )
    end
    if SydneyHUD and SydneyHUD:GetOption("enable_enhanced_assault_banner") then
        QuickMenu:new(
            managers.localization:text("bai_detected_sydneyhud"),
            managers.localization:text("bai_detected_sydneyhud_desc"),
            {
                {
                    text = managers.localization:text("bai_button_ok"),
                    is_cancel_button = true
                }
            },
            true
        )
        SydneyHUD._data.enable_enhanced_assault_banner = false
        SydneyHUD:Save()
        BAI.settings.show_advanced_assault_info = true
        BAI.settings.show_assault_states = true
    end
    BAI.warnings_showed = true
end