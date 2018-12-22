-- Original code written by Kamikaze94. For original code, go see WolfHUD (WolfHUD/lua/AdvAssault.lua)
-- "Fixed" and improved by me
local tweak, gai_state, assault_data, get_value, get_mult
if Network:is_server() then
	tweak = tweak_data.group_ai.besiege.assault
	gai_state = managers.groupai:state()
	assault_data = gai_state and gai_state._task_data.assault
	get_value = gai_state._get_difficulty_dependent_value or function() return 0 end
	get_mult = gai_state._get_balancing_multiplier or function() return 0 end
end
local crimespree = managers.crime_spree:is_active()
local skirmish = managers.skirmish:is_skirmish()
local spacer = string.rep(" ", 10)
local sep = string.format("%s%s%s", spacer, managers.localization:text("hud_assault_end_line"), spacer)
local text_original = LocalizationManager.text
function LocalizationManager:text(string_id, macros)
	return string_id == "hud_advanced_info" and self:HUDAdvancedInfo() or text_original(self, string_id, macros)
end

function LocalizationManager:SetClient()
	self.is_client = true
end

function LocalizationManager:SetSynchronization(setter)
	self.synchronize_time = setter
end

function LocalizationManager:SetVariables()
	self.show_spawns_left = BAI.settings.advanced_assault_info.spawns_left.show
	self.show_time_left = BAI.settings.advanced_assault_info.time_left.show
	self.time_left_format = BAI.settings.advanced_assault_info.time_left.time_format
end

function LocalizationManager:HUDAdvancedInfo()
	if tweak and gai_state and assault_data and assault_data.active then
		local s = nil

		if self.show_spawns_left then
			local spawns = get_value(gai_state, tweak.force_pool) * get_mult(gai_state, tweak.force_pool_balance_mul)
			local spawns_left = self:text("hud_spawns_left") .. "  " .. math.round(math.max(spawns - assault_data.force_spawned, 0))
			s = string.format("%s", spawns_left)
		end

		if self.show_time_left then
			local add
			local time_left = assault_data.phase_end_t - gai_state._t -- Removing 350 here will make Time Left more accurate
			if crimespree then
				local sustain_duration = math.lerp(get_value(gai_state, tweak.sustain_duration_min), get_value(gai_state, tweak.sustain_duration_max), 0.5) * get_mult(gai_state, tweak.sustain_duration_balance_mul)
				add = managers.modifiers:modify_value("GroupAIStateBesiege:SustainEndTime", sustain_duration) - sustain_duration
			end
			if assault_data.phase == "build" then
				local sustain_duration = math.lerp(get_value(gai_state, tweak.sustain_duration_min), get_value(gai_state, tweak.sustain_duration_max), 0.5) * get_mult(gai_state, tweak.sustain_duration_balance_mul)
				time_left = time_left + sustain_duration + tweak.fade_duration
				if add then
					time_left = time_left + add
				end
				if skirmish then
					time_left = 140 - gai_state._t -- 140 is precalculated from SkirmishTweakData.lua
				end
			elseif assault_data.phase == "sustain" then
				time_left = time_left + tweak.fade_duration
				if add then
					time_left = time_left + add
				end
			end
			
			if self.synchronize_time then
				LuaNetworking:SendToPeers("BAI_AdvancedAssaultInfo_TimeLeft", time_left)
				self.synchronize_time = false
			end

			if time_left < 0 then
				time_left = self:text("hud_overdue")
			else
				if self.time_left_format == 1 or self.time_left_format == 2 then
					time_left = self:text("hud_time_left") .. " " .. string.format("%.2f", time_left)
					if self.time_left_format == 2 then
						time_left = time_left .. " " .. self:text("hud_s")
					end
				elseif self.time_left_format == 3 or self.time_left_format == 4 then
					time_left = self:text("hud_time_left") .. " " .. string.format("%.0f", time_left)
					if self.time_left_format == 4 then
						time_left = time_left .. "  " .. self:text("hud_s")
					end
				else
					local min = math.floor(time_left / 60)
					local s = math.floor(time_left % 60)
					if s >= 60 then
						s = s - 60
						min = min + 1
					end
					if self.time_left_format == 5 then
						time_left = self:text("hud_time_left") .. " " .. string.format("%.0f%s%s%s%.0f%s%s", min, " ", self:text("hud_min"), "  ", s, " ", self:text("hud_s"))
					else
						time_left = self:text("hud_time_left") .. " " .. string.format("%.0f%s%s", min, ":", (s <= 9 and "0" .. string.format("%.0f", s) or string.format("%.0f", s)))
					end
				end
			end
			if s then
				s = string.format("%s%s%s", s, sep, time_left)
			else
				s = string.format("%s", time_left)
			end
		end
		
		if s then
			return s
		end
		return ""
	end

	if self.is_client then
		local time
		if self.show_time_left then
			local client_time_left = managers.hud:GetTimeLeft()
			if client_time_left < 0 then
				time = self:text("hud_overdue")
			else
				if self.time_left_format == 1 or self.time_left_format == 2 then
					time = self:text("hud_time_left") .. " " .. string.format("%.2f", client_time_left)
					if self.time_left_format == 2 then
						time = time .. " " .. self:text("hud_s")
					end
				elseif self.time_left_format == 3 or self.time_left_format == 4 then
					time = self:text("hud_time_left") .. " " .. string.format("%.0f", client_time_left)
					if self.time_left_format == 4 then
						time = time .. "  " .. self:text("hud_s")
					end
				else
					local min = math.floor(client_time_left / 60)
					local s = math.floor(client_time_left % 60)
					if s >= 60 then
						s = s - 60
						min = min + 1
					end
					if self.time_left_format == 5 then
						time = self:text("hud_time_left") .. " " .. string.format("%.0f%s%s%s%.0f%s%s", min, " ", self:text("hud_min"), "  ", s, " ", self:text("hud_s"))
					else
						time = self:text("hud_time_left") .. " " .. string.format("%.0f%s%s", min, ":", (s <= 9 and "0" .. string.format("%.0f", s) or string.format("%.0f", s)))
					end
				end
			end
		end
		return string.format("%s", time)
	end
	return ""
end