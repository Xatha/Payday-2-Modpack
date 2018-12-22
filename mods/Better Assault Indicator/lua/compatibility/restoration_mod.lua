function HUDAssaultCorner:SetImage(image)
end

function HUDAssaultCorner:UpdateText()
end

function HUDAssaultCorner:UpdatePONRBox()
    if not self._point_of_no_return then
        self._noreturn_color = BAI:GetColor("escape_box")
        self._hud_panel:child("point_of_no_return_panel"):child("point_of_no_return_text"):set_color(self._noreturn_color)
        self._hud_panel:child("point_of_no_return_panel"):child("point_of_no_return_timer"):set_color(self._noreturn_color)
    end
end

local _restoration_RestorationValueChanged = HUDAssaultCorner.RestorationValueChanged
function HUDAssaultCorner:RestorationValueChanged()
    _restoration_RestorationValueChanged(self)
    if not managers.mutators:are_mutators_active() then
        self._assault_color = BAI:GetColor("assault_box")
        self._vip_assault_color = BAI:GetColor("captain_box")
        self._assault_endless_color = BAI:GetColor("endless_box")
    else
        self._assault_color = BAI:GetColor("assault_box_mutated")
        self._vip_assault_color = BAI:GetColor("captain_box_mutated")
        self._assault_endless_color = BAI:GetColor("endless_box_mutated")
    end
    self._assault_survived_color = BAI:GetColor("survived_box")
    self._assault_corner_color = BAI:GetColorRestoration("assault_box", true)
    self._assault_corner2_color = BAI:GetColorRestoration("assault_box")
    self._assault_endless_corner_color = BAI:GetColorRestoration("endless_box", true)
    self._assault_endless_corner2_color = BAI:GetColorRestoration("endless_box")
	self._wave_corner_color = BAI:GetColorRestoration("survived_box", true)
	self._wave_corner2_color = BAI:GetColorRestoration("survived_box")
	self._captain_corner_color = BAI:GetColorRestoration("captain_box", true)
	self._captain_corner2_color = BAI:GetColorRestoration("captain_box")
    if self.is_skirmish then
        self._assault_color = BAI:GetColor("holdout_box")
        self._assault_corner_color = BAI:GetColorRestoration("holdout_box", true)
        self._assault_corner2_color = BAI:GetColorRestoration("holdout_box")
    end
end

local _BAI_sync_set_assault_mode = HUDAssaultCorner.sync_set_assault_mode
function HUDAssaultCorner:sync_set_assault_mode(mode)
    _BAI_sync_set_assault_mode(self, mode)
    if mode == "phalanx" and self._v2_corner then
        self._hud_panel:child("corner_panel"):child("corner_title"):set_text(managers.localization:text("hud_captain"))
    end
end

local _BAI_start_endless_assault = HUDAssaultCorner._start_endless_assault
function HUDAssaultCorner:_start_endless_assault(text_list)
    _BAI_start_endless_assault(self, text_list)
    if self._v2_corner then
        self._hud_panel:child("corner_panel"):child("corner_title"):set_text(managers.localization:text("hud_endless"))
        self._hud_panel:child("corner_panel"):child("corner"):set_color(self._assault_endless_corner_color)
		self._hud_panel:child("corner_panel"):child("corner2"):set_color(self._assault_endless_corner2_color)
    end
end

function HUDAssaultCorner:_animate_assault_corner(corner_panel)
	local corner = corner_panel:child("corner")
	local corner2 = corner_panel:child("corner2")
	local corner_title = corner_panel:child("corner_title")
	while true do
		local a = 0.25 + (math.sin(Application:time() * 750) + 1) / 4
		-- print( "a", a, 1 - a )
		corner:set_color(corner:color():with_alpha(a))
		corner2:set_color(corner2:color():with_alpha(0.25))
		corner_title:set_color(Color(a, 0, 0.8 - a))
		if self._assault_mode == "phalanx" then	
			corner_title:set_color(Color.white:with_alpha(a))
		end
		-- o:set_color( o:color():with_alpha( 0.5 + (math.sin( Application:time()*750 )+1)/4 ) )
		coroutine.yield()
	end
end

function HUDAssaultCorner:_animate_wave_corner(corner_panel)
	local corner = corner_panel:child("corner")
	local corner2 = corner_panel:child("corner2")
	local corner_title = corner_panel:child("corner_title")
	while true do
		local a = 0.25 + (math.sin(Application:time() * 375) + 1) / 4
		-- print( "a", a, 1 - a )
		corner:set_color(corner:color():with_alpha(a))
		corner2:set_color(corner2:color():with_alpha(0.25))
		corner_title:set_color(Color(1, 0.8, 0):with_alpha(a))
		-- o:set_color( o:color():with_alpha( 0.5 + (math.sin( Application:time()*750 )+1)/4 ) )
		coroutine.yield()
	end
end

function HUDAssaultCorner:_start_assault(text_list)
	text_list = text_list or {""}
	local assault_panel = self._hud_panel:child("assault_panel")
	local text_panel = assault_panel:child("text_panel")
	local corner_panel = self._hud_panel:child("corner_panel")
    self:_set_text_list(text_list)
	self._assault = true
	if text_panel then
		text_panel:stop()
		text_panel:clear()
	else
		assault_panel:panel({name = "text_panel"})
	end
	corner_panel:set_visible(self._v2_corner)
	corner_panel:stop()
	corner_panel:animate(callback(self, self, "_animate_assault_corner"))
	assault_panel:set_visible(not self._v2_corner)
	text_panel:stop()
	assault_panel:stop()
	assault_panel:animate(callback(self, self, "_animate_assault"))
	text_panel:animate(callback(self, self, "_animate_text"), nil, nil, nil)
    self:_set_feedback_color(self._assault_color)
    
    if self._v2_corner then
        if BAI.settings.show_assault_states and self.assault_type and BAI:IsStateEnabled("build") then
            if self.is_host or (self.is_client and self.multiplayer_game) then
                self:SetAlphaCornerText("hud_build")
            end
        end
    end
	
    if self.is_skirmish and self.show_popup then
        self:_popup_wave_started()
        self.show_popup = false
    end

    if BAI:IsHostagePanelHidden(self.assault_type) then
        self:_hide_hostages()
    end
end

function HUDAssaultCorner:_end_assault()
	if not self._assault then
		self._start_assault_after_hostage_offset = nil
		return
    end
	self._remove_hostage_offset = true
    self._start_assault_after_hostage_offset = nil
    self._assault = false
    local endless_assault = self._assault_endless
    self._assault_endless = false
	self:_set_feedback_color(nil)
	local corner_panel = self._hud_panel:child("corner_panel")
	corner_panel:set_visible(false)
	corner_panel:stop()
	local assault_panel = self._hud_panel:child("assault_panel")
	local text_panel = assault_panel:child("text_panel")
	text_panel:stop()
    text_panel:clear()
    assault_panel:stop()
	if self:has_waves() then
		assault_panel:set_visible(not self._v2_corner)
		local wave_panel = self._hud_panel:child("wave_panel")
		
		if self._v2_corner then
			corner_panel:child("corner"):set_color(self._wave_corner_color)
			corner_panel:child("corner2"):set_color(self._wave_corner2_color)
			corner_panel:child("corner_title"):set_text(managers.localization:text("hud_survived"))
			corner_panel:set_visible(true)
            corner_panel:animate(callback(self, self, "_animate_wave_corner"))
        else
            self:_start_assault(self:_get_survived_assault_strings())
            self:_update_assault_hud_color(self._assault_survived_color)
        end

        self._completed_waves = self._completed_waves + 1
		wave_panel:animate(callback(self, self, "_animate_wave_completed"), self)
		
		if self.is_skirmish then
            self:_popup_wave_finished()
            self.show_popup = true
		end
    else -- Hack! Don't try to fix it
        assault_panel:set_visible(not self._v2_corner)
        if BAI.settings.show_wave_survived then
            self.wave_survived = true
            if not self._v2_corner then
                if endless_assault then
                    self.wave_survived_endless = true
                    self:_start_assault(self:_get_survived_assault_endless_strings())
                else
                    self:_start_assault(self:_get_survived_assault_strings())
                end
                self:_update_assault_hud_color(self._assault_survived_color)
                text_panel:animate(callback(self, self, "_animate_normal_wave_completed"), self)
            else
                corner_panel:child("corner"):set_color(self._wave_corner_color)
                corner_panel:child("corner2"):set_color(self._wave_corner2_color)
                corner_panel:child("corner_title"):set_text(managers.localization:text("hud_survived"))
                corner_panel:set_visible(true)
                corner_panel:animate(callback(self, self, "_animate_wave_corner"))
                corner_panel:animate(callback(self, self, "_animate_normal_wave_completed"))
            end
            --[[if not self._v2_corner then
                self._hud_panel:child("assault_panel"):child("text_panel"):stop()
                self._hud_panel:child("assault_panel"):stop()
                self._hud_panel:child("assault_panel"):animate(callback(self, self, "_animate_assault"))
                self._hud_panel:child("assault_panel"):child("text_panel"):set_visible(true)
                self._hud_panel:child("assault_panel"):child("text_panel"):animate(callback(self, self, "_animate_text"), nil, nil, nil)
                self._hud_panel:child("assault_panel"):child("text_panel"):animate(callback(self, self, "_animate_normal_wave_completed"), self)
            else

            end]]
        else
            if BAI.settings.show_assault_states then
                if self.is_host or (self.is_client and self.multiplayer_game) then
                    self:UpdateAssaultStateOverride("control", true)
                    if BAI:IsHostagePanelVisible() then
                        self:_show_hostages()
                    end
                else
                    self:_close_assault_box()
                end
            else
                self:_close_assault_box()
            end
        end
    end
    if self.is_client then
        if not self.dont_override_endless then
            if self.endless_client and not self._assault_endless then
                self.endless_client = false
            end
        end
    end
end

function HUDAssaultCorner:has_waves()
    return self.is_skirmish or self.is_safehouse_raid
end

function HUDAssaultCorner:_animate_normal_wave_corner(panel, hud)
    wait(8.6)
    self.wave_survived = false
    self.wave_survived_endless = false
    if BAI.settings.show_assault_states then
        if self.is_host or (self.is_client and self.multiplayer_game) then
            self:UpdateAssaultStateOverride("control")
            if BAI:IsHostagePanelVisible() then
                self:_show_hostages()
            end
        else
            self:_close_assault_box()
        end
    else
        self:_close_assault_box()
    end
end

function HUDAssaultCorner:_animate_wave_completed(panel, assault_hud)
	local wave_text = panel:child("num_waves")
	wait(1.4)
	wave_text:set_text(self:get_completed_waves_string())
	wait(7.2)
    if BAI.settings.show_assault_states then
        if self.is_host or (self.is_client and self.multiplayer_game) then
            self:UpdateAssaultStateOverride("control")
        else
            assault_hud:_close_assault_box()
        end
    else
        assault_hud:_close_assault_box()
    end
    self.wave_survived = false
end

function HUDAssaultCorner:show_point_of_no_return_timer()
    local delay_time = self._assault and 1.2 or 0
	self:_close_assault_box()
	local point_of_no_return_panel = self._hud_panel:child("point_of_no_return_panel")
	point_of_no_return_panel:stop()
	point_of_no_return_panel:animate(callback(self, self, "_animate_show_noreturn"), delay_time)
	self:_hide_hostages()
    self._hud_panel:child("point_of_no_return_panel"):set_visible(true)
    self._point_of_no_return = true
	self:_set_feedback_color(self._noreturn_color)
end

function HUDAssaultCorner:feed_point_of_no_return_timer(time, is_inside)
	time = math.floor(time)
	local minutes = math.floor(time / 60)
	local seconds = math.round(time - minutes * 60)
	local text = (minutes < 10 and "0" .. minutes or minutes) .. ":" .. (seconds < 10 and "0" .. seconds or seconds)
	self._hud_panel:child("point_of_no_return_panel"):child("point_of_no_return_timer"):set_text(text)
end

function HUDAssaultCorner:flash_point_of_no_return_timer(beep)
	local function flash_timer(o)
		local t = 0
		while t < 0.5 do
			t = t + coroutine.yield()
			local n = 1 - math.sin(t * 180)
			local r = math.lerp(self._noreturn_color.r, 1, n)
			local g = math.lerp(self._noreturn_color.g, 0.8, n)
			local b = math.lerp(self._noreturn_color.b, 0.2, n)
			o:set_color(Color(r, g, b))
			o:set_font_size(math.lerp(50, 50 * 1.25, n))
		end
	end
	local point_of_no_return_timer = self._hud_panel:child("point_of_no_return_panel"):child("point_of_no_return_timer")
	point_of_no_return_timer:animate(flash_timer)
end

function HUDAssaultCorner:UpdateAssaultStateColor(state, force_update)
    if state then
        if BAI:IsStateDisabled(state) then
            return
        end
        self:_update_assault_hud_color(BAI:GetStateColor(state))
        self._hud_panel:child("assault_panel"):child("text_panel"):animate(callback(self, self, "_animate_text_change_assault_state"), state)
        if force_update then
            if self.is_host then
                self:UpdateAssaultState(managers.groupai:state():GetAssaultState())
            end
        end
    end
end

function HUDAssaultCorner:UpdateAssaultColor(color, assault_type)
    self:_update_assault_hud_color(BAI:GetColor(color))
    self._hud_panel:child("assault_panel"):child("text_panel"):animate(callback(self, self, "_animate_text_change_normal_assault"), assault_type)
end

function HUDAssaultCorner:UpdateAssaultStateOverride(state, override)
    if not self._assault_vip and not self._assault_endless and not self._point_of_no_return then
        if BAI.settings.show_assault_states then
            if state then
                if BAI:IsOr(state, "control", "anticipation") then
                    self.assault_state = state
                    if BAI:IsStateDisabled(state) then
                        self:_close_assault_box()
                        return
                    end
                    self._assault = true
                    self:_set_text_list(self:_get_state_strings(state))
                    self:_update_assault_hud_color(BAI:GetStateColor(state))
                    if self._v2_corner then
                        self:SetAlphaCornerText("hud_" .. state)
                        self._hud_panel:child("corner_panel"):child("corner"):set_color(BAI:GetStateColorRestoration(state, true))
                        self._hud_panel:child("corner_panel"):child("corner2"):set_color(BAI:GetStateColorRestoration(state, false))
                    end
                    if override then
                        if not self._v2_corner then
                            self._hud_panel:child("assault_panel"):child("text_panel"):stop()
                            self._hud_panel:child("assault_panel"):stop()
                            self._hud_panel:child("assault_panel"):animate(callback(self, self, "_animate_assault"))
                            self._hud_panel:child("assault_panel"):child("text_panel"):set_visible(true)
                            self._hud_panel:child("assault_panel"):child("text_panel"):animate(callback(self, self, "_animate_text"), nil, nil, nil)
                        else
                            self._hud_panel:child("corner_panel"):child("corner"):set_color(BAI:GetStateColorRestoration(state, true))
                            self._hud_panel:child("corner_panel"):child("corner2"):set_color(BAI:GetStateColorRestoration(state, false))
                            self:SetAlphaCornerText("hud_" .. state)
                            self._hud_panel:child("corner_panel"):animate(callback(self, self, "_animate_wave_corner"))
                        end
                    end     
                else
                    self.assault_state = state
                    if BAI:IsStateDisabled(state) then
                        self:_update_assault_hud_color(self._assault_color)
                        if BAI.settings.show_advanced_assault_info then
                            self:_set_text_list(self:_get_assault_strings_info())
                        else
                            self:_set_text_list(self:_get_assault_strings())
                        end
                        if self._v2_corner then
                            self._hud_panel:child("corner_panel"):child("corner_title"):set_text(managers.localization:text("hud_assault"))
                            self._hud_panel:child("corner_panel"):child("corner"):set_color(self._assault_corner_color)
                            self._hud_panel:child("corner_panel"):child("corner2"):set_color(self._assault_corner2_color)
                        end
                        return
                    end
                    if BAI.settings.show_advanced_assault_info then
                        self:_set_text_list(self:_get_assault_state_strings_info(state))
                    else
                        self:_set_text_list(self:_get_assault_state_strings(state))
                    end
                    if self._v2_corner then
                        self:SetAlphaCornerText("hud_" .. state)
                        self._hud_panel:child("corner_panel"):child("corner"):set_color(BAI:GetStateColorRestoration(state, true))
                        self._hud_panel:child("corner_panel"):child("corner2"):set_color(BAI:GetStateColorRestoration(state, false))
                    end
                    self:_update_assault_hud_color(BAI:GetStateColor(state))
                    if self.is_host and self.multiplayer_game then
                        LuaNetworking:SendToPeers("BAI_AssaultStateOverride", state)
                    end
                end
            end
        end
    end
end

function HUDAssaultCorner:UpdateAssaultState(state)
    if not self._assault_vip and not self._assault_endless and not self._point_of_no_return then
        if BAI.settings.show_assault_states then
            if state and self.assault_state ~= state then
                self.assault_state = state
                if state == "build" then
                    self:_update_assault_hud_color(BAI:GetStateColor(state))
                    if self._v2_corner then
                        self._hud_panel:child("corner_panel"):child("corner"):set_color(BAI:GetStateColorRestoration(state, true))
                        self._hud_panel:child("corner_panel"):child("corner2"):set_color(BAI:GetStateColorRestoration(state, false))
                    end
                    return
                end
                if state == "anticipation" and self.is_client and not self.multiplayer_game then
                    return
                end
                if self.send_assault_state and state ~= "control" then
                    LuaNetworking:SendToPeers("BAI_AssaultState", state)
                end
                if BAI:IsStateDisabled(state) then
                    if BAI:IsOr(state, "control", "anticipation") then
                        if self._assault then
                            self._assault = false
                            self._remove_hostage_offset = true
                            self._start_assault_after_hostage_offset = nil
                            self:_close_assault_box()
                        end
                    else
                        if self._assault then
                            if BAI.settings.show_advanced_assault_info then
                                self:_set_text_list(self:_get_assault_strings_info())
                            else
                                self:_set_text_list(self:_get_assault_strings())
                            end
                            self:_update_assault_hud_color(self._assault_color)
                        end
                        if self._v2_corner then
                            self._hud_panel:child("corner_panel"):child("corner_title"):set_text(managers.localization:text("hud_assault"))
                            self._hud_panel:child("corner_panel"):child("corner"):set_color(self._assault_corner_color)
                            self._hud_panel:child("corner_panel"):child("corner2"):set_color(self._assault_corner2_color)
                        end
                    end
                    return
                end
                if BAI:IsOr(state, "control", "anticipation") then
                    if not self._assault then
                        self.show_popup = false
                        self:_start_assault(self:_get_state_strings(state))
                        if self._v2_corner then
                            self._hud_panel:child("corner_panel"):stop()
                            self._hud_panel:child("corner_panel"):animate(callback(self, self, "_animate_wave_corner"))
                        end
                        self:_set_hostage_offseted(true)
                        self.show_popup = true
                    else
                        if state == "anticipation" then
                            self:_set_text_list(self:_get_state_strings(state))
                        end
                    end
                else
                    if BAI.settings.show_advanced_assault_info then
                        self:_set_text_list(self:_get_assault_state_strings_info(state))
                    else
                        self:_set_text_list(self:_get_assault_state_strings(state))
                    end
                end
                if self._v2_corner then
                    self:SetAlphaCornerText("hud_" .. state)
                    self._hud_panel:child("corner_panel"):child("corner"):set_color(BAI:GetStateColorRestoration(state, true))
                    self._hud_panel:child("corner_panel"):child("corner2"):set_color(BAI:GetStateColorRestoration(state, false))
                end
                self:_update_assault_hud_color(BAI:GetStateColor(state))
            end
        else
            if state and self.assault_state ~= state then
                self.assault_state = state
                if self.send_assault_state and not BAI:IsOr(state, "control", "anticipation", "build") then
                    LuaNetworking:SendToPeers("BAI_AssaultState", state)
                end
            end
        end
    end
end

function HUDAssaultCorner:_set_hostages_offseted(is_offseted)
    local hostage_panel = self._hud_panel:child("hostages_panel")
	self._remove_hostage_offset = nil
	hostage_panel:stop()
	hostage_panel:animate(callback(self, self, "_offset_hostages", is_offseted))
	local wave_panel = self._hud_panel:child("wave_panel")
	if wave_panel then
		wave_panel:stop()
		wave_panel:animate(callback(self, self, "_offset_hostages", is_offseted))
	end
end

function HUDAssaultCorner:_offset_hostages(is_offseted, hostage_panel)
	local TOTAL_T = 0.18
	local OFFSET = self._v2_corner and self._hud_panel:child("corner_panel"):h() or self._hud_panel:child("assault_panel"):h() + 8
	local from_y = is_offseted and 0 or OFFSET
	local target_y = is_offseted and OFFSET or 0
	local t = (1 - math.abs(hostage_panel:y() - target_y) / OFFSET) * TOTAL_T
	while TOTAL_T > t do
		local dt = coroutine.yield()
		t = math.min(t + dt, TOTAL_T)
		local lerp = t / TOTAL_T
		hostage_panel:set_y(math.lerp(from_y, target_y, lerp))
	end
end

function HUDAssaultCorner:SetAlphaCornerText(text)
    self._hud_panel:child("corner_panel"):child("corner_title"):set_text(utf8.to_upper(managers.localization:text(text)))
end

local _BAI_get_assault_strings = HUDAssaultCorner._get_assault_strings
function HUDAssaultCorner:_get_assault_strings()
    local tbl = _BAI_get_assault_strings(self)
    if self._assault_mode ~= "normal" then
        return tbl
    end
    if BAI.settings.hud.restoration_mod.use_alpha_assault_text then
        for k, v in pairs(tbl) do
            if v == "hud_assault_assault" then
                tbl[k] = "hud_assault_alpha"
            end
        end
    end
    if BAI.settings.hud.restoration_mod.include_cover_text then
        table.insert(tbl, 3, "hud_cover")
        table.insert(tbl, 4, "hud_assault_end_line")
        local plus = managers.job:current_difficulty_stars() > 0 and 2 or 0
        table.insert(tbl, 7 + plus, "hud_cover")
        table.insert(tbl, 8 + plus, "hud_assault_end_line")
    end
    return tbl
end

local _BAI_get_assault_state_strings = HUDAssaultCorner._get_assault_state_strings
function HUDAssaultCorner:_get_assault_state_strings(state)
    local tbl = _BAI_get_assault_state_strings(self, state)
    if BAI.settings.hud.restoration_mod.use_alpha_assault_text then
        for k, v in pairs(tbl) do
            if v == "hud_assault_assault" then
                tbl[k] = "hud_assault_alpha"
            end
        end
    end
    if BAI.settings.hud.restoration_mod.include_cover_text then
        table.insert(tbl, 3, "hud_cover")
        table.insert(tbl, 4, "hud_assault_end_line")
        local plus = managers.job:current_difficulty_stars() > 0 and 2 or 0
        table.insert(tbl, 9 + plus, "hud_cover")
        table.insert(tbl, 10 + plus, "hud_assault_end_line")
    end
    return tbl
end

local _BAI_get_assault_state_strings_info = HUDAssaultCorner._get_assault_state_strings_info
function HUDAssaultCorner:_get_assault_state_strings_info(state)
    local tbl = _BAI_get_assault_state_strings_info(self, state)
    if BAI.settings.hud.restoration_mod.use_alpha_assault_text then
        for k, v in pairs(tbl) do
            if v == "hud_assault_assault" then
                tbl[k] = "hud_assault_alpha"
            end
        end
    end
    if BAI.settings.hud.restoration_mod.include_cover_text then
        if not table.contains(tbl, "hud_cover") then
            table.insert(tbl, 3, "hud_cover")
            table.insert(tbl, 4, "hud_assault_end_line")
            local plus = managers.job:current_difficulty_stars() > 0 and 2 or 0
            table.insert(tbl, 11 + plus, "hud_cover")
            table.insert(tbl, 12 + plus, "hud_assault_end_line")
        end
    end
    return tbl
end

local _BAI_get_assault_strings_info = HUDAssaultCorner._get_assault_strings_info
function HUDAssaultCorner:_get_assault_strings_info()
    local tbl = _BAI_get_assault_strings_info(self)
    if BAI.settings.hud.restoration_mod.use_alpha_assault_text then
        for k, v in pairs(tbl) do
            if v == "hud_assault_assault" then
                tbl[k] = "hud_assault_alpha"
            end
        end
    end
    if BAI.settings.hud.restoration_mod.include_cover_text then
        if not table.contains(tbl, "hud_cover") then
            table.insert(tbl, 3, "hud_cover")
            table.insert(tbl, 4, "hud_assault_end_line")
            local plus = managers.job:current_difficulty_stars() > 0 and 2 or 0
            table.insert(tbl, 9 + plus, "hud_cover")
            table.insert(tbl, 10 + plus, "hud_assault_end_line")
        end
    end
    return tbl
end

local _BAI_get_assault_endless_strings = HUDAssaultCorner._get_assault_endless_strings
function HUDAssaultCorner:_get_assault_endless_strings()
    local tbl = _BAI_get_assault_endless_strings(self)
    if BAI.settings.hud.restoration_mod.use_alpha_endless_text then
        for k, v in pairs(tbl) do
            if v == "hud_assault_endless" then
                tbl[k] = v .. "_alpha"
            end
        end
    end
    return tbl
end