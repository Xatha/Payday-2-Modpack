function WeaponFactoryTweakData:cafcw_add_to_parts(part_type, param1, param2, param3, param4, param5, param6)
	if self.parts[param2] then
		if part_type == "attach_adds" or part_type == "gadget_rail" then
			table.insert(self[param1].uses_parts, param2)
			if self.parts[param3] then
				if self[param1].adds then
					self[param1].adds[param2] = {param3}
				else
					log("[ERROR] CAFCW: Missing adds table: " .. param1, param2)
				end
			else
				log("[ERROR] CAFCW: Missing required part: " .. param1, param2, param3)
			end
		elseif part_type == "forbids" then
			if self.parts[param1] then
				if self.parts[param1].forbids then
					table.insert(self.parts[param1].forbids, param2)
				else
					log("[ERROR] CAFCW: Missing forbids table: " .. param1, param2)
				end
			else
				log("[ERROR] CAFCW: Missing required part: " .. param1, param2)
			end
		elseif part_type == "forbids_add" then
			if self.parts[param1] then
				if self.parts[param2].forbids then
					table.insert(self.parts[param2].forbids, param1)
				else
					log("[ERROR] CAFCW: Missing forbids table: " .. param2, param1)
				end
			else
				log("[ERROR] CAFCW: Missing required part: " .. param2, param1)
			end
		elseif part_type == "sight" then
			if param3 == "specter" then
				param3 = "wpn_fps_upg_o_specter"
			end
			if param3 == "acog" then
				param3 = "wpn_fps_upg_o_acog"
			end
			table.insert(self[param1].uses_parts, param2)
			if self.parts[param3] and self.parts[param3].stance_mod[param4] then
				self.parts[param2].stance_mod[param1] = deep_clone(self.parts[param3].stance_mod[param4])
			else
				log("[ERROR] CAFCW: Missing required stance_mod: " .. param1, param2, param3, param4)
			end
		elseif part_type == "sight_rail" then
			if param3 == "specter" then
				param3 = "wpn_fps_upg_o_specter"
			end
			if param3 == "acog" then
				param3 = "wpn_fps_upg_o_acog"
			end
			table.insert(self[param1].uses_parts, param2)
			if self.parts[param5] then
				if self[param1].adds then
					self[param1].adds[param2] = {param5}
				else
					log("[ERROR] CAFCW: Missing adds table: " .. param1, param2)
				end
			else
				log("[ERROR] CAFCW: Missing required part: " .. param1, param2, param5)
			end
			if self.parts[param3] and self.parts[param3].stance_mod[param4] then
				self.parts[param2].stance_mod[param1] = deep_clone(self.parts[param3].stance_mod[param4])
			else
				log("[ERROR] CAFCW: Missing required stance_mod: " .. param1, param2, param3, param4)
			end
		elseif part_type == "sight_smcopy" then
			if param4 == "specter" then
				param4 = "wpn_fps_upg_o_specter"
			end
			if param4 == "acog" then
				param4 = "wpn_fps_upg_o_acog"
			end
			table.insert(self[param1].uses_parts, param2)
			if self.parts[param3] and self.parts[param3].override[param4].stance_mod[param5] then
				self.parts[param2].stance_mod[param1] = deep_clone(self.parts[param3].override[param4].stance_mod[param5])
			else
				log("[ERROR] CAFCW: Missing required stance_mod: " .. param1, param2, param3, param4, param5)
			end
		elseif part_type == "sight_smcopy_rail" then
			if param4 == "specter" then
				param4 = "wpn_fps_upg_o_specter"
			end
			if param4 == "acog" then
				param4 = "wpn_fps_upg_o_acog"
			end
			table.insert(self[param1].uses_parts, param2)
			if self.parts[param6] then
				if self[param1].adds then
					self[param1].adds[param2] = {param6}
				else
					log("[ERROR] CAFCW: Missing adds table: " .. param1, param2)
				end
			else
				log("[ERROR] CAFCW: Missing required part: " .. param1, param2, param6)
			end
			if self.parts[param3].override[param4].stance_mod[param5] then
				self.parts[param2].stance_mod[param1] = deep_clone(self.parts[param3].override[param4].stance_mod[param5])
			else
				log("[ERROR] CAFCW: Missing required stance_mod: " .. param1, param2, param3, param4, param5)
			end
		elseif part_type == "sight_vector" then
			table.insert(self[param1].uses_parts, param2)
			self.parts[param2].stance_mod[param1] = {translation = param3:ToVector3()}
		elseif part_type == "sight_vector_rail" then
			table.insert(self[param1].uses_parts, param2)
			self.parts[param2].stance_mod[param1] = {translation = param3:ToVector3()}
			if self.parts[param4] then
				if self[param1].adds then
					self[param1].adds[param2] = {param4}
				else
					log("[ERROR] CAFCW: Missing adds table: " .. param1, param2)
				end
			else
				log("[ERROR] CAFCW: Missing required part: " .. param1, param2, param4)
			end
		elseif part_type == "part_a_obj_ovr" then
			if self.parts[param1] then
				if self.parts[param1].override then
					self.parts[param1].override[param2] = {a_obj = param3}
				else
					log("[ERROR] CAFCW: Missing override table: " .. param1, param2)
				end
			else
				log("[ERROR] CAFCW: Missing required part: " .. param1, param2)
			end
		elseif part_type == "part_a_obj_adds_ovr" then
			if self.parts[param1] and self.parts[param2] and self.parts[param4] then
				if self.parts[param1].override then
					self.parts[param1].override[param2] = {a_obj = param3, adds = {param4}}
				else
					log("[ERROR] CAFCW: Missing override table: " .. param1, param2)
				end
			else
				log("[ERROR] CAFCW: Missing required part: " .. param1, param2)
			end
		elseif part_type == "part_copy_part_ovr" then
			if self.parts[param1] and self.parts[param3] then
				if self.parts[param1].override then
					if self.parts[param3].override[param4] then
						self.parts[param1].override[param2] = deep_clone(self.parts[param3].override[param4])
						else
							log("[ERROR] CAFCW: Missing override data: " .. param1, param2, param3, param4)
						end
				else
					log("[ERROR] CAFCW: Missing override table: " .. param1, param2)
				end
			else
				log("[ERROR] CAFCW: Missing required part: " .. param1, param2, param3)
			end
		elseif part_type == "part_unit_ovr" then
			if self.parts[param1] then
				if not self.parts[param2].override then
					self.parts[param2].override = {}
				end
				self.parts[param2].override[param1] = {unit = param3}
			else
				log("[ERROR] CAFCW: Missing required part: " .. param1, param2)
			end
		elseif part_type == "wpn_a_obj_ovr" then
			if self[param1].override then
				self[param1].override[param2] = {a_obj = param3}
			else
				log("[ERROR] CAFCW: Missing override table: " .. param1, param2)
			end
		elseif part_type == "wpn_a_obj_parent_ovr" then
			if self[param1].override then
				self[param1].override[param2] = {a_obj = param3, parent = param4}
			else
				log("[ERROR] CAFCW: Missing override table: " .. param1, param2)
			end
		elseif part_type == "wpn_parent_ovr" then
			if self[param1].override then
				self[param1].override[param2] = {parent = param3}
			else
				log("[ERROR] CAFCW: Missing override table: " .. param1, param2)
			end
		else
			table.insert(self[param1].uses_parts, param2)
		end
    end
end
function WeaponFactoryTweakData:cafcw_acogrmr_stance(switch_id, wpn_id, stance)
	if self[wpn_id] then
		if switch_id == "ta31f" or switch_id == "ta648" then
			if switch_id == "ta31f" then
				switch_id = "wpn_fps_upg_o_acog_rmr_switch"
			elseif switch_id == "ta648" then
				switch_id = "wpn_fps_upg_o_ta648rmr_switch"
			end
			if self.parts[switch_id].stance_mod[stance] then
				self.parts[switch_id].stance_mod[wpn_id] = deep_clone(self.parts[switch_id].stance_mod[stance])
			else
				log("[ERROR] CAFCW-ACOGRMR: Missing required stance_mod: " .. wpn_id, switch_id, stance)
			end
		elseif switch_id == "ta31f_vector" or switch_id == "ta648_vector" then
			if switch_id == "ta31f_vector" then
				switch_id = "wpn_fps_upg_o_acog_rmr_switch"
			elseif switch_id == "ta648_vector" then
				switch_id = "wpn_fps_upg_o_ta648rmr_switch"
			end
			self.parts[switch_id].stance_mod[wpn_id] = {translation = stance:ToVector3()}
		end
	end
end
function WeaponFactoryTweakData:cafcw_add_modpack(part_type, param1, param2, mod_name)
local mod_tables = {}
mod_tables._109x33mmR = {
	"wpn_fps_upg_a_poison44"
}
mod_tables._127x99mm = {
	"wpn_fps_rifleapin50"
}
mod_tables._545x18mm = {
	"wpn_fps_upg_a_pso545x18"
}
mod_tables._545x18mm_nonap = {
	"wpn_fps_upg_a_pso545x18"
}
mod_tables._762x51mm = {
	"wpn_fps_upg_a_762x51_xm115",
	"wpn_fps_upg_a_762x51_m852",
	"wpn_fps_upg_a_762x51_m118",
	"wpn_fps_upg_a_762x51_m118lr",
	"wpn_fps_upg_a_762x51_mk316mod0",
	"wpn_fps_upg_a_762x51_m80",
	"wpn_fps_upg_a_762x51_dm41",
	"wpn_fps_upg_a_762x51_dm111",
	"wpn_fps_upg_a_762x51_m948",
	"wpn_fps_upg_a_762x51_m959",
	"wpn_fps_upg_a_762x51_m993",
	"wpn_fps_upg_a_762x51_m61",
	"wpn_fps_upg_a_762x51_m62",
	"wpn_fps_upg_a_762x51_xm256"
}
mod_tables._556x45mm = {
	"wpn_fps_upg_a_taser556",
	"wpn_fps_riflein556",
	"wpn_fps_upg_a_556x45_ppa",
	"wpn_fps_upg_a_556x45_dm31",
	"wpn_fps_upg_a_556x45_m995",
	"wpn_fps_upg_a_556x45_mk318mod0",
	"wpn_fps_upg_a_556x45_xm777",
	"wpn_fps_upg_a_556x45_xm778",
	"wpn_fps_upg_a_556x45_m196",
	"wpn_fps_upg_a_556x45_l110",
	"wpn_fps_upg_a_556x45_m855",
	"wpn_fps_upg_a_556x45_m855a1",
	"wpn_fps_upg_a_556x45_mk262",
	"wpn_fps_upg_a_556x45_mk318",
	"wpn_fps_upg_a_556x45_gp90"
}
mod_tables._545x39mm = {
	"wpn_fps_upg_a_545x39_7u1",
	"wpn_fps_upg_a_545x39_7n6",
	"wpn_fps_upg_a_545x39_7n6m",
	"wpn_fps_upg_a_545x39_7n10",
	"wpn_fps_upg_a_545x39_7n22",
	"wpn_fps_upg_a_545x39_7n24"
}
mod_tables._762x39mm = {
	"wpn_fps_riflein762x39",
	"wpn_fps_upg_a_762x39_hp",
	"wpn_fps_upg_a_762x39_m67",
	"wpn_fps_upg_a_762x39_8m3",
	"wpn_fps_upg_a_762x39_tsr",
	"wpn_fps_upg_a_762x39_poison",
	"wpn_fps_upg_a_762x39_57n231u",
	"wpn_fps_upg_a_762x39_g2",
	"wpn_fps_upg_a_762x39_57n231",
	"wpn_fps_upg_a_762x39_7n23",
	"wpn_fps_upg_a_762x39_hv",
	"wpn_fps_upg_a_762x39_fmjtit56",
	"wpn_fps_upg_a_762x39_z",
	"wpn_fps_upg_a_762x39_m83",
	"wpn_fps_upg_a_762x39_t56api",
	"wpn_fps_upg_a_762x39_bz",
	"wpn_fps_upg_a_762x39_elysium"
}
mod_tables._792x57mm = {
	"wpn_fps_upg_a_he8mm",
	"wpn_fps_upg_a_ince8mm",
	"wpn_fps_upg_a_ap8mm"
}
mod_tables._762x54mmr = {
	"wpn_fps_upg_a_762x54r_57n323s",
	"wpn_fps_upg_a_762x54r_7n13",
	"wpn_fps_upg_a_762x54r_7n26",
	"wpn_fps_upg_a_762x54r_7bz3",
	"wpn_fps_upg_a_762x54r_t46",
	"wpn_fps_upg_a_762x54r_t46m",
	"wpn_fps_upg_a_762x54r_7bt1",
	"wpn_fps_upg_a_762x54r_7n1",
	"wpn_fps_upg_a_762x54r_7n14",
	"wpn_fps_upg_a_762x54r_73p2"
}
mod_tables._9x39mm = {
	"wpn_fps_upg_a_9x39_pab9",
	"wpn_fps_upg_a_9x39_sp5",
	"wpn_fps_upg_a_9x39_spp",
	"wpn_fps_upg_a_9x39_sp6",
	"wpn_fps_upg_a_9x39_bp"
}
mod_tables._9x19mm = {
	"wpn_fps_pistolin9mm",
	"wpn_fps_upg_a_taser9mm",
	"wpn_fps_upg_a_lap9mm",
	"wpn_fps_upg_a_ap9mm",
	"wpn_fps_upg_a_hv9mm"
}
mod_tables._9x19mm_p = {
	"wpn_fps_upg_a_7h21",
	"wpn_fps_upg_a_7h31"
}
mod_tables._12ga = {
	"wpn_fps_xrepslug",
	"wpn_fps_ionshot",
	"wpn_fps_taserslug",
	"wpn_fps_aptaser",
	"wpn_fps_hvshell",
	"wpn_fps_upg_a_minislug",
	"wpn_fps_upg_a_minibuck",
	"wpn_fps_upg_a_poisonslug"
}
mod_tables._12ga_auto = {
	"wpn_fps_taserslug"
}
mod_tables._12ga_mag = {
	"wpn_fps_xrepslug",
	"wpn_fps_ionshot",
	"wpn_fps_taserslug",
	"wpn_fps_aptaser",
	"wpn_fps_hvshell",
	"wpn_fps_upg_a_poisonslug"
}
mod_tables.AR15_StockPack = {
	"wpn_fps_upg_m4_s_caastock",
	"wpn_fps_upg_m4_s_caastock_black",
	"wpn_fps_upg_m4_s_hke1",
	"wpn_fps_upg_m4_s_viper"
}
mod_tables.Stock_Attachment_Pack = {
	"wpn_fps_upg_m4_s_collapsed",
	"wpn_fps_upg_m4_s_pts_col",
	"wpn_fps_upg_m4_s_crane_col",
	"wpn_fps_upg_m4_s_mk46_col",
	"wpn_fps_upg_m4_s_ubr_col"
}
mod_tables.SneakySuppressorPack = {
	"wpn_fps_ass_ns_g_sup3",
	"wpn_fps_ass_ns_g_sup4",
	"wpn_fps_ass_ns_g_sup5"
}
	for i, part_id in pairs(mod_tables[param2]) do
		if part_type == "forbids_add" then
			if self.parts[param1] then
				if not self.parts[param1].forbids then
					self.parts[param1].forbids = {}
				end
				table.insert(self.parts[param1].forbids, part_id)
			end
		else
			if self.parts[part_id] then
				table.insert(self[param1].uses_parts, part_id)
			end
		end
	end
end
function WeaponFactoryTweakData:cafcw_add_custom_sights(sight_base, wpn_id, stance_wpn_id, add_id, custom_stance)
sight_tables = {}
sight_tables.acog = {
	"wpn_fps_upg_o_acog_rmr",
	"wpn_fps_upg_o_gitsch",
	"wpn_fps_upg_o_aog"
}
sight_tables.custom = {
	"wpn_fps_upg_o_rmr_riser",
	"wpn_fps_upg_o_eotech552",
	"wpn_fps_upg_o_po4",
	"wpn_fps_upg_o_st10",
	"wpn_fps_upg_o_susat",
	"wpn_fps_upg_o_okp7",
	"wpn_fps_upg_o_visionking",
	"wpn_fps_upg_o_compm2"
}
sight_tables.custom_sniper = {
	"wpn_fps_upg_o_1p69",
	"wpn_fps_upg_o_deltatitanium",
	"wpn_fps_upg_o_csgoscope"
}
sight_tables.custom_pistol = {
	"wpn_fps_upg_o_deltapoint"
}
sight_tables.rds45 = {
	"wpn_fps_upg_o_delta_rm55"
}
sight_tables.shortdot = {
	"wpn_fps_upg_o_ta648",
	"wpn_fps_upg_o_ta648rmr"
}
sight_tables.specter = {
	"wpn_fps_upg_o_kobra",
	"wpn_fps_upg_o_compm4s",
	"wpn_fps_upg_o_m145",
	"wpn_fps_upg_o_pkas",
	"wpn_fps_upg_o_coyote",
	"wpn_fps_upg_o_hologram",
	"wpn_fps_upg_o_zeiss",
	"wpn_fps_upg_o_hd33",
	"wpn_fps_upg_o_prismatic",
	"wpn_fps_upg_o_srs",
	"wpn_fps_upg_o_hcog",
	"wpn_fps_upg_o_reflexholo",
	"wpn_fps_upg_o_elo",
	"wpn_fps_upg_o_kemper",
	"wpn_fps_upg_o_mepro",
	"wpn_fps_upg_o_rusak",
	"wpn_fps_upg_o_horzine",
	"wpn_fps_upg_o_pka",
	"wpn_fps_upg_o_anpas13d"
}
-- Unique weapon tables to exclude sights from custom tables.
sight_tables.custom_amr2 = {
	"wpn_fps_upg_o_rmr_riser",
	"wpn_fps_upg_o_eotech552",
	"wpn_fps_upg_o_po4",
	"wpn_fps_upg_o_st10",
	"wpn_fps_upg_o_susat",
	"wpn_fps_upg_o_okp7",
	"wpn_fps_upg_o_compm2"
}
sight_tables.custom_g3m203 = {
	"wpn_fps_upg_o_rmr_riser",
	"wpn_fps_upg_o_eotech552",
	"wpn_fps_upg_o_po4",
	"wpn_fps_upg_o_st10",
	"wpn_fps_upg_o_susat",
	"wpn_fps_upg_o_okp7",
	"wpn_fps_upg_o_visionking"
}
sight_tables.custom_mk12 = {
	"wpn_fps_upg_o_rmr_riser",
	"wpn_fps_upg_o_eotech552",
	"wpn_fps_upg_o_po4",
	"wpn_fps_upg_o_susat",
	"wpn_fps_upg_o_okp7",
	"wpn_fps_upg_o_compm2"
}
sight_tables.custom_obrez = {
	"wpn_fps_upg_o_rmr_riser",
	"wpn_fps_upg_o_eotech552",
	"wpn_fps_upg_o_po4",
	"wpn_fps_upg_o_st10",
	"wpn_fps_upg_o_susat",
	"wpn_fps_upg_o_okp7",
	"wpn_fps_upg_o_compm2"
}
sight_tables.custom_sniper_sv98 = {
	"wpn_fps_upg_o_deltatitanium",
	"wpn_fps_upg_o_csgoscope"
}
	for i, sight_id in pairs(sight_tables[sight_base]) do
		if self.parts[sight_id] then
			if sight_base == "acog" then
				sight_base = "wpn_fps_upg_o_acog"
			elseif sight_base == "rds45" then
				sight_base = "wpn_fps_upg_o_45rds"
			elseif sight_base == "shortdot" then
				sight_base = "wpn_fps_upg_o_shortdot"
			elseif sight_base == "specter" then
				sight_base = "wpn_fps_upg_o_specter"
			end
			table.insert(self[wpn_id].uses_parts, sight_id)
			if string.match(sight_base, "custom") then
				if self.parts[sight_id].stance_mod[stance_wpn_id] then
					self.parts[sight_id].stance_mod[wpn_id] = deep_clone(self.parts[sight_id].stance_mod[stance_wpn_id])
					if custom_stance then
						self.parts[sight_id].stance_mod[wpn_id].translation = (self.parts[sight_id].stance_mod[wpn_id].translation + custom_stance:ToVector3())
					end
				else
					log("[ERROR] CAFCW: Missing required stance_mod: " .. wpn_id, sight_id, stance_wpn_id)
				end
			else
				if self.parts[sight_base].stance_mod[stance_wpn_id] then
					self.parts[sight_id].stance_mod[wpn_id] = deep_clone(self.parts[sight_base].stance_mod[stance_wpn_id])
					if custom_stance then
						self.parts[sight_id].stance_mod[wpn_id].translation = custom_stance:ToVector3()
					end
				else
					log("[ERROR] CAFCW: Missing required stance_mod: " .. wpn_id, sight_id, stance_wpn_id, sight_base)
				end
			end
		end
		if self.parts[add_id] then
			if self[wpn_id].adds then
				self[wpn_id].adds[sight_id] = {add_id}
			else
				log("[ERROR] CAFCW: Missing adds table: " .. wpn_id, sight_id, add_id)
			end
		end
	end
end
function WeaponFactoryTweakData:cafcw_category_forbid(wpn_id, cat_id, attach_id, exce_id)
	if self.parts[attach_id] then
		self.parts[attach_id].forbids = self.parts[attach_id].forbids or {}
		for _, part_id in pairs(self[wpn_id].uses_parts) do
			if self.parts[part_id].type == cat_id and part_id ~= exce_id then
				table.insert(self.parts[attach_id].forbids, part_id)
			end
		end
	end
end
Hooks:PostHook(WeaponFactoryTweakData, "create_bonuses", "CAFCWModInit", function(self)
-- Primary
--
-- AK12
if self.wpn_fps_ass_ak12 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ak12", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ak12", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_ak12", "wpn_fps_shield_m4")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_ak12", "wpn_fps_shield_skin_ftp")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_ak12", "wpn_fps_shield_skin_urban")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ak12", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ak12", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ak12", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ak12", "wpn_fps_upg_fl_utg")
	self:cafcw_add_modpack("stock", "wpn_fps_ass_ak12", "AR15_StockPack")
	self:cafcw_add_modpack("stock", "wpn_fps_ass_ak12", "Stock_Attachment_Pack")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_ak12", "_545x39mm", "MoreAmmoTypes")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_ak12", "wpn_fps_ass_flint")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_ak12", "wpn_fps_ass_flint")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_ak12", "wpn_fps_ass_flint")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_ak12", "wpn_fps_ass_flint")
end
-- M40A5
if self.wpn_fps_snp_m40a5 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_m40a5", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_m40a5", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_m40a5", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_m40a5", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_m40a5", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_m40a5", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_m40a5", "wpn_fps_upg_o_dd_a1", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_model70")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_m40a5", "wpn_fps_upg_o_m4flipup", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_model70")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_m40a5", "wpn_fps_upg_o_mbus", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_model70")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_m40a5", "wpn_fps_upg_o_scorpionevo", "wpn_fps_upg_o_scorpionevo", "wpn_fps_snp_model70")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_m40a5", "wpn_fps_upg_o_troy", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_model70")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_m40a5", "wpn_fps_upg_o_troy_m4", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_model70")
	self:cafcw_add_custom_sights("specter", "wpn_fps_snp_m40a5", "wpn_fps_snp_model70")
	self:cafcw_add_custom_sights("acog", "wpn_fps_snp_m40a5", "wpn_fps_snp_model70")
	self:cafcw_add_custom_sights("custom", "wpn_fps_snp_m40a5", "wpn_fps_snp_model70")
	self:cafcw_add_custom_sights("custom_sniper", "wpn_fps_snp_m40a5", "wpn_fps_snp_model70")
	self:cafcw_add_custom_sights("shortdot", "wpn_fps_snp_m40a5", "wpn_fps_snp_model70")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_snp_m40a5", "wpn_fps_snp_m40a5")
end
-- L115
if self.wpn_fps_snp_l115 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_l115", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_l115", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_l115", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_l115", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_l115", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_l115", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_l115", "wpn_fps_upg_o_dd_a1", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_l115", "wpn_fps_upg_o_m4flipup", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_l115", "wpn_fps_upg_o_mbus", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_l115", "wpn_fps_upg_o_scorpionevo", "wpn_fps_upg_o_scorpionevo", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_l115", "wpn_fps_upg_o_troy", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_l115", "wpn_fps_upg_o_troy_m4", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("specter", "wpn_fps_snp_l115", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("acog", "wpn_fps_snp_l115", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("custom", "wpn_fps_snp_l115", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("custom_sniper", "wpn_fps_snp_l115", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("shortdot", "wpn_fps_snp_l115", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_snp_l115", "wpn_fps_snp_l115")
end
-- SR-3M Vikhr
-- Specter stance_mod: 0,10,-6.48
-- Acog stance_mod: 0,14,-6.48
if self.wpn_fps_ass_sr3m then
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_kobra", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_compm4s", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_m145", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_pkas", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_coyote", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_acog_rmr", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_hologram", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_zeiss", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_okp7", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_compm4s", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_gitsch", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_hd33", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_prismatic", "a_o_railcover")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sr3m", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_supp", "wpn_fps_upg_fl_ass_spotter", "a_fl_barrel")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_srs", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_hcog", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_reflexholo", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_aog", "a_o_railcover")
	self:cafcw_add_to_parts("stock", "wpn_fps_ass_sr3m", "wpn_fps_upg_m4_s_caastock")
	self:cafcw_add_to_parts("stock", "wpn_fps_ass_sr3m", "wpn_fps_upg_m4_s_hke1")
	self:cafcw_add_to_parts("stock", "wpn_fps_ass_sr3m", "wpn_fps_upg_m4_s_viper")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_elo", "a_o_railcover")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_ass_sr3m", "wpn_fps_upg_o_susat", "0,14,-8.235", "wpn_fps_ass_sr3m_scopemount")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_susat", "a_o_railcover")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sr3m", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_supp", "wpn_fps_upg_fl_wml", "a_fl_barrel")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_kemper", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_mepro", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_rusak", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_horzine", "a_o_railcover")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sr3m", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_supp", "wpn_fps_upg_fl_anpeq2", "a_fl_barrel")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sr3m", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_supp", "wpn_fps_upg_fl_dbal_d2", "a_fl_barrel")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sr3m", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_supp", "wpn_fps_upg_fl_m600p", "a_fl_barrel")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sr3m", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_supp", "wpn_fps_upg_fl_utg", "a_fl_barrel")
	self:cafcw_add_modpack("stock", "wpn_fps_ass_sr3m", "Stock_Attachment_Pack")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_pka", "a_o_railcover")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_sr3m", "wpn_fps_upg_o_1p29", "wpn_fps_upg_o_1p29", "wpn_fps_ass_asval")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_1p29")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_sr3m", "wpn_fps_upg_o_ekp_1s_03", "0.015,3,-3.5")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_ekp_1s_03")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_sr3m", "wpn_fps_upg_o_pso1_rifle", "wpn_fps_upg_o_pso1_rifle", "wpn_fps_ass_asval")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_pso1_rifle")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_sr3m", "wpn_fps_upg_o_1pn93", "wpn_fps_upg_o_1pn93", "wpn_fps_ass_asval")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_1pn93")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_sr3m", "wpn_fps_upg_o_okp7_dove", "0.425,3,-2.85")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_okp7_dove")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_anpas13d", "a_o_railcover")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_sr3m", "wpn_fps_ass_sr3m", "wpn_fps_ass_sr3m_scopemount")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_sr3m", "wpn_fps_ass_sr3m", "wpn_fps_ass_sr3m_scopemount")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_ass_sr3m", "wpn_fps_upg_o_eotech552", "0,10,-6.145", "wpn_fps_ass_sr3m_scopemount")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_eotech552", "a_o_railcover")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_ass_sr3m", "wpn_fps_upg_o_st10", "0,10,-6.48", "wpn_fps_ass_sr3m_scopemount")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_st10", "a_o_railcover")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_ass_sr3m", "wpn_fps_upg_o_visionking", "0,10,-6.48", "wpn_fps_ass_sr3m_scopemount")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_visionking", "a_o_railcover")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_ass_sr3m", "wpn_fps_upg_o_compm2", "0,10,-5.83", "wpn_fps_ass_sr3m_scopemount")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_compm2", "a_o_railcover")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_sr3m", "_9x39mm", "MoreAmmoTypes")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_ass_sr3m", "wpn_fps_upg_o_rmr_riser", "0,7,-5.1", "wpn_fps_ass_sr3m_scopemount")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_rmr_riser", "a_o_railcover")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_ass_sr3m", "wpn_fps_upg_o_okp7", "0.6,10,-5.55", "wpn_fps_ass_sr3m_scopemount")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr3m_cover_rail", "wpn_fps_upg_o_okp7", "a_o_railcover")
end
-- FD338
if self.wpn_fps_ass_fd338 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_fd338", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_fd338", "wpn_fps_upg_o_1p69", "-0.002,-20,-4.275")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_fd338", "wpn_fps_upg_o_csgoscope", "-0.002,-22,-4.275")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_fd338", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_fd338", "wpn_fps_shield_lr")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_fd338", "wpn_fps_shield_skin_ftp")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_fd338", "wpn_fps_shield_skin_urban")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_fd338", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_fd338", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_fd338", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_fd338", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_fd338", "wpn_fps_upg_o_ta648rmr", "wpn_fps_upg_o_shortdot", "wpn_fps_ass_fd338")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_fd338", "wpn_fps_upg_o_dd_a1", "0,3,-3.08")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_fd338", "wpn_fps_upg_o_m4flipup", "0,3,-3.08")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_fd338", "wpn_fps_upg_o_mbus", "0,3,-3.08")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_fd338", "wpn_fps_upg_o_scorpionevo", "0,2,-1.06")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_fd338", "wpn_fps_upg_o_troy", "0,3,-3.08")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_fd338", "wpn_fps_upg_o_troy_m4", "0,3,-3.08")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_fd338", "wpn_fps_upg_o_st10", "0,4,-3.5")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_fd338", "wpn_fps_upg_o_visionking", "0,14,-3.5")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_fd338", "wpn_fps_ass_fal")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_fd338", "wpn_fps_ass_fal")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_fd338", "wpn_fps_ass_fal")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_fd338", "wpn_fps_ass_fal")
end
-- HK G36K
if self.wpn_fps_ass_g36k then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_g36k", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_g36k", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_g36k", "wpn_fps_shield_v2")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_g36k", "wpn_fps_shield_skin_ftp")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_g36k", "wpn_fps_shield_skin_urban")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_g36k", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_g36k", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_g36k", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_g36k", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_g36k", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_g36k", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_g36k", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_g36k", "wpn_fps_ass_g36")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_g36k", "wpn_fps_ass_g36")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_g36k", "wpn_fps_ass_g36")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_g36k", "wpn_fps_ass_g36")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_g36k", "wpn_fps_upg_o_var_kac_rear", "wpn_fps_upg_o_var_kac_rear", "wpn_fps_ass_g36")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_g36k", "wpn_fps_upg_o_var_m4flipup_rear", "wpn_fps_upg_o_var_m4flipup_rear", "wpn_fps_ass_g36")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_g36k", "wpn_fps_upg_o_var_mbus_rear", "wpn_fps_upg_o_var_mbus_rear", "wpn_fps_ass_g36")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_g36k", "wpn_fps_upg_o_var_troy_rear", "wpn_fps_upg_o_var_troy_rear", "wpn_fps_ass_g36")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_g36k", "wpn_fps_upg_o_var_troym4_rear", "wpn_fps_upg_o_var_troym4_rear", "wpn_fps_ass_g36")
end
-- SKS
if self.wpn_fps_ass_sks then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sks", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sks", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("forbids", "wpn_fps_ass_sks_irons", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sks", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sks", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sks", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sks", "wpn_fps_upg_fl_utg")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_sks", "_762x39mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_to_parts("sight_rail", "wpn_fps_ass_sks", "wpn_fps_upg_o_1p29", "wpn_fps_upg_o_1p29", "wpn_fps_snp_siltstone","wpn_fps_ass_sks_sidemount")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_ass_sks", "wpn_fps_upg_o_ekp_1s_03", "0.025,-1,-3.11","wpn_fps_ass_sks_sidemount")
	self:cafcw_add_to_parts("sight_rail", "wpn_fps_ass_sks", "wpn_fps_upg_o_pso1_rifle", "wpn_fps_upg_o_pso1_rifle", "wpn_fps_snp_siltstone","wpn_fps_ass_sks_sidemount")
	self:cafcw_add_to_parts("sight_rail", "wpn_fps_ass_sks", "wpn_fps_upg_o_1pn93", "wpn_fps_upg_o_1pn93", "wpn_fps_snp_siltstone","wpn_fps_ass_sks_sidemount")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_ass_sks", "wpn_fps_upg_o_okp7_dove", "0.635,-1,-2.39","wpn_fps_ass_sks_sidemount")
	self:cafcw_add_to_parts("forbids", "wpn_fps_ass_sks_body_sksd", "wpn_fps_upg_o_1p29")
	self:cafcw_add_to_parts("forbids", "wpn_fps_ass_sks_body_sksd", "wpn_fps_upg_o_ekp_1s_03")
	self:cafcw_add_to_parts("forbids", "wpn_fps_ass_sks_body_sksd", "wpn_fps_upg_o_pso1_rifle")
	self:cafcw_add_to_parts("forbids", "wpn_fps_ass_sks_body_sksd", "wpn_fps_upg_o_1pn93")
	self:cafcw_add_to_parts("forbids", "wpn_fps_ass_sks_body_sksd", "wpn_fps_upg_o_okp7_dove")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_sks", "wpn_fps_snp_siltstone", "wpn_fps_ass_sks_sight_rail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_sks", "wpn_fps_snp_siltstone", "wpn_fps_ass_sks_sight_rail")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_sks", "wpn_fps_snp_siltstone", "wpn_fps_ass_sks_sight_rail")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_sks", "wpn_fps_ass_sks")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_sks", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_sks", "SneakySuppressorPack", "ARSupp")
end
-- FN F2000 Tactical
if self.wpn_fps_ass_f2000 then
	self:cafcw_add_to_parts("forbids", "wpn_fps_ass_f2000_irons", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("forbids", "wpn_fps_f2000_uupg_o_fnoptic", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("forbids", "wpn_fps_f2000_uupg_o_fnoptic_noswitch", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_ass_f2000", "wpn_fps_upg_fl_ass_spotter", "wpn_fps_ass_f2000_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_ass_f2000", "wpn_fps_upg_fl_wml", "wpn_fps_ass_f2000_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_ass_f2000", "wpn_fps_upg_fl_anpeq2", "wpn_fps_ass_f2000_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_ass_f2000", "wpn_fps_upg_fl_dbal_d2", "wpn_fps_ass_f2000_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_ass_f2000", "wpn_fps_upg_fl_m600p", "wpn_fps_ass_f2000_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_ass_f2000", "wpn_fps_upg_fl_utg", "wpn_fps_ass_f2000_gadget_rail")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_f2000", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_f2000", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_f2000", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_f2000", "wpn_fps_ass_vhs")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_f2000", "wpn_fps_ass_vhs")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_f2000", "wpn_fps_ass_vhs")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_f2000", "wpn_fps_ass_vhs")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_f2000", "wpn_fps_upg_o_var_dd_a1_rear", "0.005,-8,-0.805")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_f2000", "wpn_fps_upg_o_var_kac_rear", "0.005,-8,-1.315")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_f2000", "wpn_fps_upg_o_var_m4flipup_rear", "0.005,-8,-0.805")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_f2000", "wpn_fps_upg_o_var_mbus_rear", "0.005,-8,-0.805")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_f2000", "wpn_fps_upg_o_var_scorpionevo_rear", "0.005,-8,1.225")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_f2000", "wpn_fps_upg_o_var_troy_rear", "0.005,-8,-0.805")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_f2000", "wpn_fps_upg_o_var_troym4_rear", "0.005,-8,-0.805")
end
-- AK12-76
if self.wpn_fps_shot_ak12_76 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_ak12_76", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_ak12_76", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_shot_ak12_76", "wpn_fps_upg_ns_sho_salvo_small")
	self:cafcw_add_to_parts("other", "wpn_fps_shot_ak12_76", "wpn_fps_shield_m4")
	self:cafcw_add_to_parts("other", "wpn_fps_shot_ak12_76", "wpn_fps_shield_skin_ftp")
	self:cafcw_add_to_parts("other", "wpn_fps_shot_ak12_76", "wpn_fps_shield_skin_urban")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_ak12_76", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_ak12_76", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_ak12_76", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_ak12_76", "wpn_fps_upg_fl_utg")
	self:cafcw_add_modpack("ammo", "wpn_fps_shot_ak12_76", "_12ga_auto", "TaserAmmo")
	self:cafcw_add_modpack("stock", "wpn_fps_shot_ak12_76", "AR15_StockPack")
	self:cafcw_add_modpack("stock", "wpn_fps_shot_ak12_76", "Stock_Attachment_Pack")
	self:cafcw_add_custom_sights("specter", "wpn_fps_shot_ak12_76", "wpn_fps_ass_flint")
	self:cafcw_add_custom_sights("acog", "wpn_fps_shot_ak12_76", "wpn_fps_ass_flint")
	self:cafcw_add_custom_sights("custom", "wpn_fps_shot_ak12_76", "wpn_fps_ass_flint")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_shot_ak12_76", "wpn_fps_ass_flint")
end
-- SV-98
if self.wpn_fps_snp_sv98 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_sv98", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_sv98", "wpn_fps_upg_o_dd_a1", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_sv98", "wpn_fps_upg_o_m4flipup", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_sv98", "wpn_fps_upg_o_mbus", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_sv98", "wpn_fps_upg_o_scorpionevo", "wpn_fps_upg_o_scorpionevo", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_sv98", "wpn_fps_upg_o_troy", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_sv98", "wpn_fps_upg_o_troy_m4", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_sv98", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_sv98", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_sv98", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_sv98", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_sv98", "wpn_fps_upg_fl_utg")
	self:cafcw_add_custom_sights("specter", "wpn_fps_snp_sv98", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("acog", "wpn_fps_snp_sv98", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("custom", "wpn_fps_snp_sv98", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("shortdot", "wpn_fps_snp_sv98", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("custom_sniper_sv98", "wpn_fps_snp_sv98", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_snp_sv98", "wpn_fps_snp_sv98")
	self:cafcw_add_modpack("ammo", "wpn_fps_snp_sv98", "_762x54mmr", "MoreAmmoTypes")
end
-- AKU-94
if self.wpn_fps_ass_aku94 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_aku94", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_aku94_gadgets_leftrail", "wpn_fps_upg_fl_ass_spotter", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_aku94", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_aku94_gadgets_leftrail", "wpn_fps_upg_fl_wml", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_aku94", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_aku94_gadgets_leftrail", "wpn_fps_upg_fl_anpeq2", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_aku94", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_aku94_gadgets_leftrail", "wpn_fps_upg_fl_dbal_d2", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_aku94", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_aku94_gadgets_leftrail", "wpn_fps_upg_fl_m600p", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_aku94", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_aku94_gadgets_leftrail", "wpn_fps_upg_fl_utg", "a_fl_leftrail")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_aku94", "_762x39mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_aku94", "wpn_fps_ass_l85a2")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_aku94", "wpn_fps_ass_l85a2")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_aku94", "wpn_fps_ass_l85a2")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_aku94", "wpn_fps_ass_l85a2")
end
-- Valmet Rk.62
if self.wpn_fps_ass_rk62 then
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_kobra", "a_o_railed")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_compm4s", "a_o_railed")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_m145", "a_o_railed")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_pkas", "a_o_railed")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_coyote", "a_o_railed")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_acog_rmr", "a_o_railed")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_hologram", "a_o_railed")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_zeiss", "a_o_railed")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_okp7", "a_o_railed")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_hd33", "a_o_railed")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_prismatic", "a_o_railed")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_rk62", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_fl_ass_spotter", "a_fl_railed")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_srs", "a_o_railed")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_hcog", "a_o_railed")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_reflexholo", "a_o_railed")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_aog", "a_o_railed")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_rmr_riser", "a_o_railed")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_elo", "a_o_railed")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_rk62", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_fl_wml", "a_fl_railed")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_kemper", "a_o_railed")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_mepro", "a_o_railed")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_rusak", "a_o_railed")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_delta_rm55", "a_o_railed_45")
	self:cafcw_add_to_parts("forbids", "wpn_fps_ass_rk62_handguard", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("forbids", "wpn_fps_ass_rk62_rear_sight", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_rk62_handguard_rk95", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_horzine", "a_o_railed")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_rk62", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_fl_anpeq2", "a_fl_railed")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_rk62", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_fl_dbal_d2", "a_fl_railed")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_rk62", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_fl_m600p", "a_fl_railed")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_rk62", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_fl_utg", "a_fl_railed")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_rk62", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_rk62", "_762x39mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("stock", "wpn_fps_ass_rk62", "AR15_StockPack")
	self:cafcw_add_modpack("stock", "wpn_fps_ass_rk62", "Stock_Attachment_Pack")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_rk62", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_pka", "a_o_railed")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rk62_handguard_railed", "wpn_fps_upg_o_anpas13d", "a_o_railed")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_rk62", "wpn_fps_ass_akm", "wpn_fps_ass_rk62_rail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_rk62", "wpn_fps_ass_akm", "wpn_fps_ass_rk62_rail")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_rk62", "wpn_fps_ass_rk62")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_rk62", "wpn_fps_ass_akm", "wpn_fps_ass_rk62_rail")
end
-- VSS
-- Specter stance_mod: 0,10,-6.48
-- Acog stance_mod: 0,14,-6.48
-- Shortdot stance_mod: 0,-12,-7.24
if self.wpn_fps_snp_vss then
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_kobra", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_compm4s", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_m145", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_pkas", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_coyote", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_acog_rmr", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_hologram", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_zeiss", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_okp7", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_gitsch", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_hd33", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_prismatic", "a_o_railcover")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_vss", "wpn_fps_upg_fl_ass_spotter", "wpn_fps_snp_vss_barrel_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_srs", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_hcog", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_reflexholo", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_aog", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_elo", "a_o_railcover")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_vss", "wpn_fps_upg_o_susat", "0,14,-8.235", "wpn_fps_snp_vss_mount_molot")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_susat", "a_o_railcover")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_vss", "wpn_fps_upg_fl_wml", "wpn_fps_snp_vss_barrel_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_kemper", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_mepro", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_rusak", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_horzine", "a_o_railcover")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_vss", "wpn_fps_upg_o_eotech552", "0,10,-6.145", "wpn_fps_snp_vss_mount_molot")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_eotech552", "a_o_railcover")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_vss", "wpn_fps_upg_fl_anpeq2", "wpn_fps_snp_vss_barrel_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_vss", "wpn_fps_upg_fl_dbal_d2", "wpn_fps_snp_vss_barrel_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_vss", "wpn_fps_upg_fl_m600p", "wpn_fps_snp_vss_barrel_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_vss", "wpn_fps_upg_fl_utg", "wpn_fps_snp_vss_barrel_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_ta648", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_ta648rmr", "a_o_railcover")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_vss", "wpn_fps_upg_o_deltatitanium", "0,-15,-7.24", "wpn_fps_snp_vss_mount_molot")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_deltatitanium", "a_o_railcover")
	self:cafcw_add_to_parts("part_copy_part_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_delta_rm55", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_45rds")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_pka", "a_o_railcover")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_vss", "wpn_fps_upg_o_1p29", "-0.501,6,-4.788")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_1p29")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_vss", "wpn_fps_upg_o_ekp_1s_03", "0.2,2,-3.79")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_ekp_1s_03")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_vss", "wpn_fps_upg_o_1pn93", "-0.501,6,-4.788")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_vss", "wpn_fps_upg_o_okp7_dove", "0.425,2,-3.18")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_okp7_dove")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_1pn93", "a_o_railcover")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_vss", "wpn_fps_upg_o_1p69", "0,-13,-7.24", "wpn_fps_snp_vss_mount_molot")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_1p69", "a_o_railcover")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_vss", "wpn_fps_upg_o_csgoscope", "0,-17,-7.24", "wpn_fps_snp_vss_mount_molot")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_csgoscope", "a_o_railcover")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_vss", "wpn_fps_upg_o_st10", "0,13,-6.48", "wpn_fps_snp_vss_mount_molot")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_st10", "a_o_railcover")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_vss", "wpn_fps_upg_o_visionking", "0,22,-6.48", "wpn_fps_snp_vss_mount_molot")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_visionking", "a_o_railcover")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_anpas13d", "a_o_railcover")
	self:cafcw_add_custom_sights("specter", "wpn_fps_snp_vss", "wpn_fps_snp_vss", "wpn_fps_snp_vss_mount_molot")
	self:cafcw_add_custom_sights("acog", "wpn_fps_snp_vss", "wpn_fps_snp_vss", "wpn_fps_snp_vss_mount_molot")
	self:cafcw_add_custom_sights("shortdot", "wpn_fps_snp_vss", "wpn_fps_snp_vss", "wpn_fps_snp_vss_mount_molot")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_snp_vss", "wpn_fps_snp_vss")
	self:cafcw_add_modpack("ammo", "wpn_fps_snp_vss", "_9x39mm", "MoreAmmoTypes")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_vss", "wpn_fps_upg_o_rmr_riser", "0,7,-5.1", "wpn_fps_snp_vss_mount_molot")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_rmr_riser", "a_o_railcover")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_vss", "wpn_fps_upg_o_okp7", "0.6,10,-5.55", "wpn_fps_snp_vss_mount_molot")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vss_cover_rail", "wpn_fps_upg_o_okp7", "a_o_railcover")
end
-- Colt 9mm Submachine Gun
if self.wpn_fps_ass_r0991 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_r0991", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_r0991", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_r0991", "wpn_fps_upg_o_delta_rm55", "a_o_45")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_r0991", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_r0991", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_r0991", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_r0991", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_r0991", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_r0991_barrel_supp", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_r0991", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("stock", "wpn_fps_ass_r0991", "AR15_StockPack")
	self:cafcw_add_modpack("stock", "wpn_fps_ass_r0991", "Stock_Attachment_Pack")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_r0991", "wpn_fps_ass_m4")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_r0991", "wpn_fps_ass_m4")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_r0991", "wpn_fps_ass_m4")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_r0991", "wpn_fps_ass_m4")
end
-- SA vz. 58P
if self.wpn_fps_ass_vz58 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_vz58", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vz58_gadget_top_rail", "wpn_fps_upg_fl_ass_spotter", "a_fl_toprail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_vz58", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vz58_gadget_top_rail", "wpn_fps_upg_fl_wml", "a_fl_toprail")
	self:cafcw_add_to_parts("forbids", "wpn_fps_ass_vz58_irons", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_vz58", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vz58_gadget_top_rail", "wpn_fps_upg_fl_anpeq2", "a_fl_toprail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_vz58", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vz58_gadget_top_rail", "wpn_fps_upg_fl_dbal_d2", "a_fl_toprail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_vz58", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vz58_gadget_top_rail", "wpn_fps_upg_fl_m600p", "a_fl_toprail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_vz58", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vz58_gadget_top_rail", "wpn_fps_upg_fl_utg", "a_fl_toprail")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_vz58", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_vz58", "_762x39mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("stock", "wpn_fps_ass_vz58", "AR15_StockPack")
	self:cafcw_add_modpack("stock", "wpn_fps_ass_vz58", "Stock_Attachment_Pack")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_vz58", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_vz58", "wpn_fps_ass_akm")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_vz58", "wpn_fps_ass_akm")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_vz58", "wpn_fps_ass_akm")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_vz58", "wpn_fps_ass_akm")
end
-- KAC SR-25 E2 ACC
-- Shortdot stance_mod: -0.002,-21,-0.854
if self.wpn_fps_snp_sr25 then
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_sr25", "wpn_fps_upg_o_1p69", "-0.002,-23,-0.854")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_sr25", "wpn_fps_upg_o_deltatitanium", "-0.002,-22 -0.854")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_sr25", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_sr25", "wpn_fps_upg_o_csgoscope", "-0.002,-25,-0.854")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_sr25", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("other", "wpn_fps_snp_sr25", "wpn_fps_shield_lr")
	self:cafcw_add_to_parts("other", "wpn_fps_snp_sr25", "wpn_fps_shield_skin_ftp")
	self:cafcw_add_to_parts("other", "wpn_fps_snp_sr25", "wpn_fps_shield_skin_urban")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_sr25", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_sr25", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_sr25", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_sr25", "wpn_fps_upg_fl_utg")
	self:cafcw_add_modpack("stock", "wpn_fps_snp_sr25", "AR15_StockPack")
	self:cafcw_add_modpack("stock", "wpn_fps_snp_sr25", "Stock_Attachment_Pack")
	self:cafcw_add_modpack("ammo", "wpn_fps_snp_sr25", "_762x51mm", "MoreAmmoTypes")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_sr25", "wpn_fps_upg_o_dd_a1", "0,2,0.335")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr25_handguard_mk11", "wpn_fps_upg_o_dd_a1_front", "a_o_f_mk11")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_sr25", "wpn_fps_upg_o_m4flipup", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_sr25")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr25_handguard_mk11", "wpn_fps_upg_o_m4flipup_front", "a_o_f_mk11")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_sr25", "wpn_fps_upg_o_mbus", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_sr25")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr25_handguard_mk11", "wpn_fps_upg_o_mbus_frontsight", "a_o_f_mk11")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_sr25", "wpn_fps_upg_o_scorpionevo", "0,0,2.35")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr25_handguard_mk11", "wpn_fps_upg_o_scorpionevo_front", "a_o_f_mk11")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_sr25", "wpn_fps_upg_o_troy", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_sr25")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr25_handguard_mk11", "wpn_fps_upg_o_troy_front", "a_o_f_mk11")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_sr25", "wpn_fps_upg_o_troy_m4", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_sr25")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sr25_handguard_mk11", "wpn_fps_upg_o_troy_m4_front", "a_o_f_mk11")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_sr25", "wpn_fps_upg_o_st10", "0,2,-0.12")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_sr25", "wpn_fps_upg_o_visionking", "0,12,-0.12")
	self:cafcw_add_custom_sights("specter", "wpn_fps_snp_sr25", "wpn_fps_ass_m16")
	self:cafcw_add_custom_sights("acog", "wpn_fps_snp_sr25", "wpn_fps_ass_m16")
	self:cafcw_add_custom_sights("custom", "wpn_fps_snp_sr25", "wpn_fps_ass_m16")
	self:cafcw_add_custom_sights("shortdot", "wpn_fps_snp_sr25", "wpn_fps_snp_sr25")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_snp_sr25", "wpn_fps_ass_m16")
end
-- OTs-14-4A Groza
if self.wpn_fps_ass_ots_14_4a then
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_kobra", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_compm4s", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_m145", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_pkas", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_coyote", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_acog_rmr", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_hologram", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_gitsch", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_zeiss", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_okp7", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_hd33", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_prismatic", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_srs", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_hcog", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_reflexholo", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_aog", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_elo", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_po4", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_susat", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_kemper", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_mepro", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_rusak", "a_o_handle")
	self:cafcw_add_to_parts("forbids", "wpn_fps_ass_ots_14_4a_handle", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_ots_14_4a_visionking", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_horzine", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_eotech552", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_rmr_riser", "a_o_handle")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_ass_ots_14_4a", "wpn_fps_upg_fl_ass_spotter", "wpn_fps_ass_ots_14_4a_gadget_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_supp_b", "wpn_fps_upg_fl_ass_spotter", "a_fl_supp")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_ass_ots_14_4a", "wpn_fps_upg_fl_wml", "wpn_fps_ass_ots_14_4a_gadget_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_supp_b", "wpn_fps_upg_fl_wml", "a_fl_supp")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_ass_ots_14_4a", "wpn_fps_upg_fl_anpeq2", "wpn_fps_ass_ots_14_4a_gadget_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_supp_b", "wpn_fps_upg_fl_anpeq2", "a_fl_supp")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_ass_ots_14_4a", "wpn_fps_upg_fl_dbal_d2", "wpn_fps_ass_ots_14_4a_gadget_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_supp_b", "wpn_fps_upg_fl_dbal_d2", "a_fl_supp")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_ass_ots_14_4a", "wpn_fps_upg_fl_m600p", "wpn_fps_ass_ots_14_4a_gadget_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_supp_b", "wpn_fps_upg_fl_m600p", "a_fl_supp")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_ass_ots_14_4a", "wpn_fps_upg_fl_utg", "wpn_fps_ass_ots_14_4a_gadget_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_supp_b", "wpn_fps_upg_fl_utg", "a_fl_supp")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_visionking", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_st10", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_pka", "a_o_handle")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_anpas13d", "a_o_handle")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_ots_14_4a", "wpn_fps_ass_l85a2", "wpn_fps_ass_ots_14_4a_sight_rail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_ots_14_4a", "wpn_fps_ass_l85a2", "wpn_fps_ass_ots_14_4a_sight_rail")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_ots_14_4a", "wpn_fps_ass_l85a2", "wpn_fps_ass_ots_14_4a_sight_rail")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_ots_14_4a", "wpn_fps_ass_l85a2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ots_14_4a_handle_rail", "wpn_fps_upg_o_compm2", "a_o_handle")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_ots_14_4a", "_9x39mm", "MoreAmmoTypes")
end
-- McMillan TAC-50
if self.wpn_fps_snp_tac50 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_tac50", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_tac50", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_tac50", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_tac50", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_tac50", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_tac50", "wpn_fps_upg_fl_utg")
	self:cafcw_add_modpack("ammo", "wpn_fps_snp_tac50", "_127x99mm", "IncendiaryAmmo")
	self:cafcw_add_custom_sights("specter", "wpn_fps_snp_tac50", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("acog", "wpn_fps_snp_tac50", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("custom", "wpn_fps_snp_tac50", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("custom_sniper", "wpn_fps_snp_tac50", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("shortdot", "wpn_fps_snp_tac50", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_snp_tac50", "wpn_fps_snp_msr")
end
-- FN SCAR-L M203
if self.wpn_fps_ass_scar_m203 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_scar_m203", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_scar_m203_gadgets_leftrail", "wpn_fps_upg_fl_ass_spotter", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_scar_m203", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_scar_m203_gadgets_leftrail", "wpn_fps_upg_fl_wml", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_scar_m203", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_scar_m203_gadgets_leftrail", "wpn_fps_upg_fl_anpeq2", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_scar_m203", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_scar_m203_gadgets_leftrail", "wpn_fps_upg_fl_dbal_d2", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_scar_m203", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_scar_m203_gadgets_leftrail", "wpn_fps_upg_fl_m600p", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_scar_m203", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_scar_m203_gadgets_leftrail", "wpn_fps_upg_fl_utg", "a_fl_leftrail")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_scar_m203", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_scar_m203", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_scar_m203", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_scar_m203", "wpn_fps_ass_contraband", "wpn_fps_ass_scar_m203_irons_front")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_scar_m203", "wpn_fps_ass_contraband", "wpn_fps_ass_scar_m203_irons_front")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_scar_m203", "wpn_fps_ass_contraband", "wpn_fps_ass_scar_m203_irons_front")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_scar_m203", "wpn_fps_ass_contraband")
	self:cafcw_add_to_parts("sight_rail", "wpn_fps_ass_scar_m203", "wpn_fps_upg_o_var_kac_rear", "wpn_fps_upg_o_var_kac_rear", "wpn_fps_ass_contraband", "wpn_fps_ass_scar_m203_irons_front")
	self:cafcw_add_to_parts("sight_rail", "wpn_fps_ass_scar_m203", "wpn_fps_upg_o_var_m4flipup_rear", "wpn_fps_upg_o_var_m4flipup_rear", "wpn_fps_ass_contraband", "wpn_fps_ass_scar_m203_irons_front")
	self:cafcw_add_to_parts("sight_rail", "wpn_fps_ass_scar_m203", "wpn_fps_upg_o_var_mbus_rear", "wpn_fps_upg_o_var_mbus_rear", "wpn_fps_ass_contraband", "wpn_fps_ass_scar_m203_irons_front")
	self:cafcw_add_to_parts("sight_rail", "wpn_fps_ass_scar_m203", "wpn_fps_upg_o_var_scorpionevo_rear", "wpn_fps_upg_o_var_scorpionevo_rear", "wpn_fps_ass_contraband", "wpn_fps_ass_scar_m203_irons_front")
	self:cafcw_add_to_parts("sight_rail", "wpn_fps_ass_scar_m203", "wpn_fps_upg_o_var_troy_rear", "wpn_fps_upg_o_var_troy_rear", "wpn_fps_ass_contraband", "wpn_fps_ass_scar_m203_irons_front")
	self:cafcw_add_to_parts("sight_rail", "wpn_fps_ass_scar_m203", "wpn_fps_upg_o_var_troym4_rear", "wpn_fps_upg_o_var_troym4_rear", "wpn_fps_ass_contraband", "wpn_fps_ass_scar_m203_irons_front")
end
-- HK XM8
if self.wpn_fps_ass_xm8 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_xm8", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_xm8", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_xm8", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_xm8", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_xm8", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_xm8", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_xm8", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_xm8", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_xm8", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_xm8", "wpn_fps_ass_g36", "wpn_fps_ass_xm8_handguard_rail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_xm8", "wpn_fps_ass_g36", "wpn_fps_ass_xm8_handguard_rail")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_xm8", "wpn_fps_ass_g36", "wpn_fps_ass_xm8_handguard_rail")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_xm8", "wpn_fps_ass_g36")
end
-- Galil ACE 23
if self.wpn_fps_ass_galilace then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_galilace", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_gadgets_leftrail", "wpn_fps_upg_fl_ass_spotter", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_galilace", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_gadgets_leftrail", "wpn_fps_upg_fl_wml", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_galilace", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_gadgets_leftrail", "wpn_fps_upg_fl_anpeq2", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_galilace", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_gadgets_leftrail", "wpn_fps_upg_fl_dbal_d2", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_galilace", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_gadgets_leftrail", "wpn_fps_upg_fl_m600p", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_galilace", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_gadgets_leftrail", "wpn_fps_upg_fl_utg", "a_fl_leftrail")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_galilace", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_galilace", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_galilace", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_galilace", "wpn_fps_smg_hajk")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_galilace", "wpn_fps_smg_hajk")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_galilace", "wpn_fps_smg_hajk")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_galilace", "wpn_fps_upg_o_var_kac_rear", "wpn_fps_upg_o_var_kac_rear", "wpn_fps_smg_hajk")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_galilace", "wpn_fps_upg_o_var_m4flipup_rear", "wpn_fps_upg_o_var_m4flipup_rear", "wpn_fps_smg_hajk")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_galilace", "wpn_fps_upg_o_var_mbus_rear", "wpn_fps_upg_o_var_mbus_rear", "wpn_fps_smg_hajk")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_galilace", "wpn_fps_upg_o_var_scorpionevo_rear", "wpn_fps_upg_o_var_scorpionevo_rear", "wpn_fps_smg_hajk")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_galilace", "wpn_fps_upg_o_var_troy_rear", "wpn_fps_upg_o_var_troy_rear", "wpn_fps_smg_hajk")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_galilace", "wpn_fps_upg_o_var_troym4_rear", "wpn_fps_upg_o_var_troym4_rear", "wpn_fps_smg_hajk")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_barrel_ace21", "wpn_fps_upg_o_var_kac_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_barrel_ace21", "wpn_fps_upg_o_var_m4flipup_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_barrel_ace21", "wpn_fps_upg_o_var_mbus_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_barrel_ace21", "wpn_fps_upg_o_var_scorpionevo_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_barrel_ace21", "wpn_fps_upg_o_var_troy_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_barrel_ace21", "wpn_fps_upg_o_var_troym4_front", "a_of_short")
end
-- Galil ACE 52
if self.wpn_fps_ass_galilace_762 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_galilace_762", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_gadgets_leftrail", "wpn_fps_upg_fl_ass_spotter", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_galilace_762", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_gadgets_leftrail", "wpn_fps_upg_fl_wml", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_galilace_762", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_gadgets_leftrail", "wpn_fps_upg_fl_anpeq2", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_galilace_762", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_gadgets_leftrail", "wpn_fps_upg_fl_dbal_d2", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_galilace_762", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_gadgets_leftrail", "wpn_fps_upg_fl_m600p", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_galilace_762", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_gadgets_leftrail", "wpn_fps_upg_fl_utg", "a_fl_leftrail")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_galilace_762", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_galilace_762", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_galilace_762", "_762x51mm", "MoreAmmoTypes")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_galilace_762", "wpn_fps_smg_hajk")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_galilace_762", "wpn_fps_smg_hajk")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_galilace_762", "wpn_fps_smg_hajk")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_galilace_762", "wpn_fps_upg_o_var_kac_rear", "wpn_fps_upg_o_var_kac_rear", "wpn_fps_smg_hajk")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_galilace_762", "wpn_fps_upg_o_var_m4flipup_rear", "wpn_fps_upg_o_var_m4flipup_rear", "wpn_fps_smg_hajk")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_galilace_762", "wpn_fps_upg_o_var_mbus_rear", "wpn_fps_upg_o_var_mbus_rear", "wpn_fps_smg_hajk")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_galilace_762", "wpn_fps_upg_o_var_scorpionevo_rear", "wpn_fps_upg_o_var_scorpionevo_rear", "wpn_fps_smg_hajk")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_galilace_762", "wpn_fps_upg_o_var_troy_rear", "wpn_fps_upg_o_var_troy_rear", "wpn_fps_smg_hajk")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_galilace_762", "wpn_fps_upg_o_var_troym4_rear", "wpn_fps_upg_o_var_troym4_rear", "wpn_fps_smg_hajk")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_barrel_cqb", "wpn_fps_upg_o_var_kac_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_barrel_cqb", "wpn_fps_upg_o_var_m4flipup_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_barrel_cqb", "wpn_fps_upg_o_var_mbus_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_barrel_cqb", "wpn_fps_upg_o_var_scorpionevo_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_barrel_cqb", "wpn_fps_upg_o_var_troy_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_galilace_barrel_cqb", "wpn_fps_upg_o_var_troym4_front", "a_of_short")
end
-- AEK-971
-- Switch to AK stance_mod
if self.wpn_fps_ass_aek971 then
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_kobra", "a_o_sm")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_compm4s", "a_o_sm")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_m145", "a_o_sm")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_pkas", "a_o_sm")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_coyote", "a_o_sm")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_acog_rmr", "a_o_sm")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_hologram", "a_o_sm")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_gitsch", "a_o_sm")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_zeiss", "a_o_sm")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_okp7", "a_o_sm")
	self:cafcw_add_to_parts("stock", "wpn_fps_ass_aek971", "wpn_fps_upg_m4_s_hke1")
	self:cafcw_add_to_parts("stock", "wpn_fps_ass_aek971", "wpn_fps_upg_m4_s_viper")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_hd33", "a_o_sm")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_prismatic", "a_o_sm")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_aek971", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_srs", "a_o_sm")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_hcog", "a_o_sm")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_reflexholo", "a_o_sm")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_aog", "a_o_sm")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_rmr_riser", "a_o_sm")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_elo", "a_o_sm")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_aek971", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_kemper", "a_o_sm")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_mepro", "a_o_sm")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_rusak", "a_o_sm")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_horzine", "a_o_sm")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_aek971", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_aek971", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_aek971", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_aek971", "wpn_fps_upg_fl_utg")
	self:cafcw_add_modpack("stock", "wpn_fps_ass_aek971", "Stock_Attachment_Pack")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_pka", "a_o_sm")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_susat", "a_o_sm")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_aek971", "_545x39mm", "MoreAmmoTypes")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_aek971", "wpn_fps_upg_o_anpas13d", "a_o_sm")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_aek971", "wpn_fps_ass_aek971", "wpn_fps_ass_aek971_mtk8")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_aek971", "wpn_fps_ass_aek971", "wpn_fps_ass_aek971_mtk8")
end
-- ZiD A-545
if self.wpn_fps_ass_a545 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_a545", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_a545", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_a545", "wpn_fps_shield_aug")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_a545", "wpn_fps_shield_skin_ftp")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_a545", "wpn_fps_shield_skin_urban")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_a545", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_a545", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_a545", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_a545", "wpn_fps_upg_fl_utg")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_a545", "_545x39mm", "MoreAmmoTypes")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_a545", "wpn_fps_ass_galil")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_a545", "wpn_fps_ass_galil")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_a545", "wpn_fps_ass_galil")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_a545", "wpn_fps_ass_galil")
end
-- Baikal MP-153
if self.wpn_fps_shot_mp153 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_mp153", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_mp153", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_mp153", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_mp153", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_mp153", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_mp153", "wpn_fps_upg_fl_utg")
	self:cafcw_add_modpack("ammo", "wpn_fps_shot_mp153", "_12ga_auto", "TaserAmmo")
	self:cafcw_add_custom_sights("specter", "wpn_fps_shot_mp153", "wpn_fps_sho_ben", "wpn_fps_shot_mp153_rail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_shot_mp153", "wpn_fps_sho_ben", "wpn_fps_shot_mp153_rail")
	self:cafcw_add_custom_sights("custom", "wpn_fps_shot_mp153", "wpn_fps_sho_ben", "wpn_fps_shot_mp153_rail")
end
-- Akimbo Sidekick
if self.wpn_fps_smg_x_sidekick then
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_sidekick", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_sidekick", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_sidekick", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_sidekick", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_sidekick", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_sidekick", "wpn_fps_upg_fl_utg")
end
-- RPD
if self.wpn_fps_lmg_rpd then
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_rpd", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_rpd", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_rpd", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_rpd", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_rpd", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_rpd", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_lmg_rpd", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("ammo", "wpn_fps_lmg_rpd", "_762x39mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_lmg_rpd", "SneakySuppressorPack", "ARSupp")
end
-- M60
if self.wpn_fps_lmg_m60 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_m60", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_m60", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("other", "wpn_fps_lmg_m60", "wpn_fps_shield_lmg")
	self:cafcw_add_to_parts("other", "wpn_fps_lmg_m60", "wpn_fps_shield_skin_ftp")
	self:cafcw_add_to_parts("other", "wpn_fps_lmg_m60", "wpn_fps_shield_skin_urban")
	self:cafcw_add_modpack("ammo", "wpn_fps_lmg_m60", "_762x51mm", "MoreAmmoTypes")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_lmg_m60", "wpn_fps_upg_ns_ass_smg_tromix")
if self.parts.wpn_fps_lmg_m60e4_body then
table.map_append(self.parts.wpn_fps_lmg_m60_body,{
		forbids = {"wpn_fps_shield_lmg"}
	}
)
end
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_m60", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_m60", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_m60", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_m60", "wpn_fps_upg_fl_utg")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_lmg_m60", "SneakySuppressorPack", "ARSupp")
end
-- Ohio Ordnance HCAR
if self.wpn_fps_ass_hcar then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_hcar", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hcar_gadgets_leftrail", "wpn_fps_upg_fl_ass_spotter", "a_fl_leftrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hcar_gadgets_toprail", "wpn_fps_upg_fl_ass_spotter", "a_fl_toprail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_hcar", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hcar_gadgets_leftrail", "wpn_fps_upg_fl_wml", "a_fl_leftrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hcar_gadgets_toprail", "wpn_fps_upg_fl_wml", "a_fl_toprail")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_hcar", "wpn_fps_shield_lr")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_hcar", "wpn_fps_shield_skin_ftp")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_hcar", "wpn_fps_shield_skin_urban")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_hcar", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hcar_gadgets_leftrail", "wpn_fps_upg_fl_anpeq2", "a_fl_leftrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hcar_gadgets_toprail", "wpn_fps_upg_fl_anpeq2", "a_fl_toprail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_hcar", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hcar_gadgets_leftrail", "wpn_fps_upg_fl_dbal_d2", "a_fl_leftrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hcar_gadgets_toprail", "wpn_fps_upg_fl_dbal_d2", "a_fl_toprail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_hcar", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hcar_gadgets_leftrail", "wpn_fps_upg_fl_m600p", "a_fl_leftrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hcar_gadgets_toprail", "wpn_fps_upg_fl_m600p", "a_fl_toprail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_hcar", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hcar_gadgets_leftrail", "wpn_fps_upg_fl_utg", "a_fl_leftrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hcar_gadgets_toprail", "wpn_fps_upg_fl_utg", "a_fl_toprail")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_hcar", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("stock", "wpn_fps_ass_hcar", "AR15_StockPack")
	self:cafcw_add_modpack("stock", "wpn_fps_ass_hcar", "Stock_Attachment_Pack")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_hcar", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_hcar", "wpn_fps_ass_fal")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_hcar", "wpn_fps_ass_fal")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_hcar", "wpn_fps_ass_fal")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_hcar", "wpn_fps_ass_fal")
end
-- HK416
if self.wpn_fps_ass_hk416 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_hk416", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_hk416", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_hk416", "wpn_fps_shield_m4")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_hk416", "wpn_fps_shield_skin_ftp")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_hk416", "wpn_fps_shield_skin_urban")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_hk416", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_hk416", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_hk416", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_hk416", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_hk416", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_hk416", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("stock", "wpn_fps_ass_hk416", "AR15_StockPack")
	self:cafcw_add_modpack("stock", "wpn_fps_ass_hk416", "Stock_Attachment_Pack")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_hk416", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_hk416", "wpn_fps_ass_m4")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_hk416", "wpn_fps_ass_m4")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_hk416", "wpn_fps_ass_m4")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_hk416", "wpn_fps_ass_hk416")
	self:cafcw_add_to_parts("magazine", "wpn_fps_ass_hk416", "wpn_fps_upg_m4_m_x15drum")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_hk416", "wpn_fps_upg_o_var_dd_a1_rear", "0,-6,-0.175")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_hk416", "wpn_fps_upg_o_var_kac_rear", "0,-6,-0.685")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_hk416", "wpn_fps_upg_o_var_m4flipup_rear", "0,-6,-0.175")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_hk416", "wpn_fps_upg_o_var_mbus_rear", "0,-6,-0.175")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_hk416", "wpn_fps_upg_o_var_scorpionevo_rear", "0,-4,1.85")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_hk416", "wpn_fps_upg_o_var_troy_rear", "0,-6,-0.175")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_hk416", "wpn_fps_upg_o_var_troym4_rear", "0,-6,-0.175")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hk416_handguard_c", "wpn_fps_upg_o_var_dd_a1_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hk416_handguard_c", "wpn_fps_upg_o_var_kac_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hk416_handguard_c", "wpn_fps_upg_o_var_m4flipup_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hk416_handguard_c", "wpn_fps_upg_o_var_mbus_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hk416_handguard_c", "wpn_fps_upg_o_var_scorpionevo_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hk416_handguard_c", "wpn_fps_upg_o_var_troy_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hk416_handguard_c", "wpn_fps_upg_o_var_troym4_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hk416_handguard_long", "wpn_fps_upg_o_var_dd_a1_front", "a_of_long")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hk416_handguard_long", "wpn_fps_upg_o_var_kac_front", "a_of_long")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hk416_handguard_long", "wpn_fps_upg_o_var_m4flipup_front", "a_of_long")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hk416_handguard_long", "wpn_fps_upg_o_var_mbus_front", "a_of_long")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hk416_handguard_long", "wpn_fps_upg_o_var_scorpionevo_front", "a_of_long")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hk416_handguard_long", "wpn_fps_upg_o_var_troy_front", "a_of_long")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_hk416_handguard_long", "wpn_fps_upg_o_var_troym4_front", "a_of_long")
end
-- SVD
if self.wpn_fps_snp_svd then
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_svd", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_svd", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("forbids", "wpn_fps_snp_svd_pso", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_svd_irons", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_svd_leupold_pro", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_svd", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_svd", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_svd", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_svd", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_svd", "wpn_fps_upg_o_1p29", "-0.405,7,-3.818")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_svd", "wpn_fps_upg_o_1pn93", "-0.405,7,-3.818")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_svd", "wpn_fps_upg_o_ekp_1s_03", "0.2,3,-3")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_svd", "wpn_fps_upg_o_okp7_dove", "0.655,5,-2.38")
	self:cafcw_add_custom_sights("specter", "wpn_fps_snp_svd", "wpn_fps_snp_siltstone", "wpn_fps_snp_svd_molot_mount")
	self:cafcw_add_custom_sights("acog", "wpn_fps_snp_svd", "wpn_fps_snp_siltstone", "wpn_fps_snp_svd_molot_mount")
	self:cafcw_add_custom_sights("custom", "wpn_fps_snp_svd", "wpn_fps_snp_siltstone", "wpn_fps_snp_svd_molot_mount")
	self:cafcw_add_custom_sights("custom_sniper", "wpn_fps_snp_svd", "wpn_fps_snp_siltstone", "wpn_fps_snp_svd_molot_mount")
	self:cafcw_add_custom_sights("shortdot", "wpn_fps_snp_svd", "wpn_fps_snp_siltstone", "wpn_fps_snp_svd_molot_mount")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_snp_svd", "wpn_fps_snp_siltstone")
	self:cafcw_add_modpack("ammo", "wpn_fps_snp_svd", "_762x54mmr", "MoreAmmoTypes")
end
-- CheyTac M200
if self.wpn_fps_snp_m200 then
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_m200", "wpn_fps_upg_o_1p69", "wpn_fps_upg_o_1p69", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_m200", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_m200", "wpn_fps_upg_o_csgoscope", "wpn_fps_upg_o_csgoscope", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_m200", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_m200", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_m200", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_m200", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_m200", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_m200", "wpn_fps_upg_o_dd_a1", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_m200", "wpn_fps_upg_o_m4flipup", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_m200", "wpn_fps_upg_o_mbus", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_m200", "wpn_fps_upg_o_scorpionevo", "wpn_fps_upg_o_scorpionevo", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_m200", "wpn_fps_upg_o_troy", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_m200", "wpn_fps_upg_o_troy_m4", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("specter", "wpn_fps_snp_m200", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("acog", "wpn_fps_snp_m200", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("custom", "wpn_fps_snp_m200", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("shortdot", "wpn_fps_snp_m200", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_snp_m200", "wpn_fps_snp_msr")
end
-- LaRue OBR 7.62
if self.wpn_fps_ass_obr7 then
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_obr7", "wpn_fps_upg_o_1p69", "wpn_fps_upg_o_1p69", "wpn_fps_snp_tti")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_obr7", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_obr7", "wpn_fps_upg_o_csgoscope", "wpn_fps_upg_o_csgoscope", "wpn_fps_snp_tti")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_obr7", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_obr7", "wpn_fps_shield_lr")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_obr7", "wpn_fps_shield_skin_ftp")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_obr7", "wpn_fps_shield_skin_urban")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_obr7", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_obr7", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_obr7", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_obr7", "wpn_fps_upg_fl_utg")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_obr7", "wpn_fps_snp_tti")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_obr7", "wpn_fps_snp_tti")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_obr7", "wpn_fps_snp_tti")
	self:cafcw_add_custom_sights("shortdot", "wpn_fps_ass_obr7", "wpn_fps_snp_tti")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_obr7", "wpn_fps_snp_tti")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_obr7", "_762x51mm", "MoreAmmoTypes")
end
-- FN SCAR-L
if self.wpn_fps_ass_scarl then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_scarl", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_scarl_upper_pdw", "wpn_fps_upg_fl_ass_spotter", "a_fl_pdw")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_scarl", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_scarl_upper_pdw", "wpn_fps_upg_fl_wml", "a_fl_pdw")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_scarl", "wpn_fps_shield_m4")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_scarl", "wpn_fps_shield_skin_ftp")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_scarl", "wpn_fps_shield_skin_urban")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_scarl", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_scarl_upper_pdw", "wpn_fps_upg_fl_anpeq2", "a_fl_pdw")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_scarl", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_scarl_upper_pdw", "wpn_fps_upg_fl_dbal_d2", "a_fl_pdw")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_scarl", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_scarl_upper_pdw", "wpn_fps_upg_fl_m600p", "a_fl_pdw")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_scarl", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_scarl_upper_pdw", "wpn_fps_upg_fl_utg", "a_fl_pdw")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_scarl", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_scarl", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_scarl", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_scarl", "wpn_fps_ass_m4", "wpn_fps_ass_scarl_ironsights_front_fold")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_scarl", "wpn_fps_ass_m4", "wpn_fps_ass_scarl_ironsights_front_fold")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_scarl", "wpn_fps_ass_m4", "wpn_fps_ass_scarl_ironsights_front_fold")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_scarl", "wpn_fps_ass_scarl")
	self:cafcw_add_to_parts("sight_rail", "wpn_fps_ass_scarl", "wpn_fps_upg_o_var_kac_rear", "wpn_fps_upg_o_var_kac_rear", "wpn_fps_ass_m4", "wpn_fps_ass_scarl_ironsights_front_fold")
	self:cafcw_add_to_parts("sight_rail", "wpn_fps_ass_scarl", "wpn_fps_upg_o_var_m4flipup_rear", "wpn_fps_upg_o_var_m4flipup_rear", "wpn_fps_ass_m4", "wpn_fps_ass_scarl_ironsights_front_fold")
	self:cafcw_add_to_parts("sight_rail", "wpn_fps_ass_scarl", "wpn_fps_upg_o_var_mbus_rear", "wpn_fps_upg_o_var_mbus_rear", "wpn_fps_ass_m4", "wpn_fps_ass_scarl_ironsights_front_fold")
	self:cafcw_add_to_parts("sight_rail", "wpn_fps_ass_scarl", "wpn_fps_upg_o_var_scorpionevo_rear", "wpn_fps_upg_o_var_scorpionevo_rear", "wpn_fps_ass_m4", "wpn_fps_ass_scarl_ironsights_front_fold")
	self:cafcw_add_to_parts("sight_rail", "wpn_fps_ass_scarl", "wpn_fps_upg_o_var_troy_rear", "wpn_fps_upg_o_var_troy_rear", "wpn_fps_ass_m4", "wpn_fps_ass_scarl_ironsights_front_fold")
	self:cafcw_add_to_parts("sight_rail", "wpn_fps_ass_scarl", "wpn_fps_upg_o_var_troym4_rear", "wpn_fps_upg_o_var_troym4_rear", "wpn_fps_ass_m4", "wpn_fps_ass_scarl_ironsights_front_fold")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_scarl_upper_pdw", "wpn_fps_upg_o_var_dd_a1_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_scarl_upper_pdw", "wpn_fps_upg_o_var_kac_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_scarl_upper_pdw", "wpn_fps_upg_o_var_m4flipup_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_scarl_upper_pdw", "wpn_fps_upg_o_var_mbus_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_scarl_upper_pdw", "wpn_fps_upg_o_var_scorpionevo_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_scarl_upper_pdw", "wpn_fps_upg_o_var_troy_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_scarl_upper_pdw", "wpn_fps_upg_o_var_troym4_front", "a_of_short")
end
-- XM21
if self.wpn_fps_snp_xm21 then
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_xm21", "wpn_fps_upg_o_1p69", "-0.04,-26,-4.63", "wpn_fps_snp_xm21_scope_mount")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_xm21", "wpn_fps_upg_o_deltatitanium", "-0.04,-25,-4.63", "wpn_fps_snp_xm21_scope_mount")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_xm21", "wpn_fps_upg_o_csgoscope", "-0.04,-28,-4.63", "wpn_fps_snp_xm21_scope_mount")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_xm21", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_xm21", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_snp_xm21", "wpn_fps_upg_o_delta_rm55", "a_o_45")
	self:cafcw_add_to_parts("forbids", "wpn_fps_snp_xm21_redfield_art", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_xm21_irons", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("other", "wpn_fps_snp_xm21", "wpn_fps_shield_dmr")
	self:cafcw_add_to_parts("other", "wpn_fps_snp_xm21", "wpn_fps_shield_skin_ftp")
	self:cafcw_add_to_parts("other", "wpn_fps_snp_xm21", "wpn_fps_shield_skin_urban")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_xm21", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_xm21", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_xm21", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_xm21", "wpn_fps_upg_fl_utg")
	self:cafcw_add_custom_sights("specter", "wpn_fps_snp_xm21", "wpn_fps_ass_m14", "wpn_fps_snp_xm21_scope_mount")
	self:cafcw_add_custom_sights("acog", "wpn_fps_snp_xm21", "wpn_fps_ass_m14", "wpn_fps_snp_xm21_scope_mount")
	self:cafcw_add_custom_sights("shortdot", "wpn_fps_snp_xm21", "wpn_fps_snp_xm21", "wpn_fps_snp_xm21_scope_mount")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_snp_xm21", "wpn_fps_snp_xm21", "wpn_fps_snp_xm21_offset_sight_rail")
	self:cafcw_add_custom_sights("custom", "wpn_fps_snp_xm21", "wpn_fps_ass_m14", "wpn_fps_snp_xm21_scope_mount")
	self:cafcw_add_modpack("ammo", "wpn_fps_snp_xm21", "_762x51mm", "MoreAmmoTypes")
end
-- Arisaka Type 38
if self.wpn_fps_snp_type38 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_type38", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_type97_scope_switch", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("forbids", "wpn_fps_snp_type38_irons", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_type38_irons_ladder", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("other", "wpn_fps_snp_type38", "wpn_fps_shield_aug")
	self:cafcw_add_to_parts("other", "wpn_fps_snp_type38", "wpn_fps_shield_skin_ftp")
	self:cafcw_add_to_parts("other", "wpn_fps_snp_type38", "wpn_fps_shield_skin_urban")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_type38", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_type38", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_type38", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_type38", "wpn_fps_upg_fl_utg")
	self:cafcw_add_custom_sights("specter", "wpn_fps_snp_type38", "wpn_fps_snp_mosin", "wpn_fps_snp_type38_sightrail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_snp_type38", "wpn_fps_snp_mosin", "wpn_fps_snp_type38_sightrail")
	self:cafcw_add_custom_sights("custom", "wpn_fps_snp_type38", "wpn_fps_snp_mosin", "wpn_fps_snp_type38_sightrail")
	self:cafcw_add_custom_sights("custom_sniper", "wpn_fps_snp_type38", "wpn_fps_snp_mosin", "wpn_fps_snp_type38_sightrail_alt")
	self:cafcw_add_custom_sights("shortdot", "wpn_fps_snp_type38", "wpn_fps_snp_mosin", "wpn_fps_snp_type38_sightrail_alt")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_snp_type38", "wpn_fps_snp_mosin")
end
-- IWI X95
if self.wpn_fps_ass_x95 then
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_ass_x95", "wpn_fps_upg_fl_ass_spotter", "wpn_fps_ass_x95_rm55")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_ass_x95", "wpn_fps_upg_fl_wml", "wpn_fps_ass_x95_rm55")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_ass_x95", "wpn_fps_upg_fl_anpeq2", "wpn_fps_ass_x95_rm55")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_ass_x95", "wpn_fps_upg_fl_dbal_d2", "wpn_fps_ass_x95_rm55")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_ass_x95", "wpn_fps_upg_fl_m600p", "wpn_fps_ass_x95_rm55")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_ass_x95", "wpn_fps_upg_fl_utg", "wpn_fps_ass_x95_rm55")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_x95", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_x95", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_x95", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_x95", "wpn_fps_ass_aug")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_x95", "wpn_fps_ass_aug")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_x95", "wpn_fps_ass_aug")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_x95", "wpn_fps_ass_aug")
end
-- Winchester Model 1894
-- Specter stance_mod: -0.005,4,-3.695
-- Acog stance_mod: -0.01,1,-3.655
if self.wpn_fps_snp_winchester1894 then
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_winchester1894", "wpn_fps_upg_fl_ass_spotter", "wpn_fps_snp_winchester1894_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_winchester1894", "wpn_fps_upg_fl_wml", "wpn_fps_snp_winchester1894_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_winchester1894", "wpn_fps_upg_fl_anpeq2", "wpn_fps_snp_winchester1894_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_winchester1894", "wpn_fps_upg_fl_dbal_d2", "wpn_fps_snp_winchester1894_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_winchester1894", "wpn_fps_upg_fl_m600p", "wpn_fps_snp_winchester1894_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_winchester1894", "wpn_fps_upg_fl_utg", "wpn_fps_snp_winchester1894_gadget_rail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_winchester1894", "wpn_fps_upg_o_susat", "-0.005,1,-5,45", "wpn_fps_snp_winchester1894_sight_rail")
	self:cafcw_add_custom_sights("specter", "wpn_fps_snp_winchester1894", "wpn_fps_snp_winchester1894", "wpn_fps_snp_winchester1894_sight_rail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_snp_winchester1894", "wpn_fps_snp_winchester1894", "wpn_fps_snp_winchester1894_sight_rail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_winchester1894", "wpn_fps_upg_o_eotech552", "-0.005,4,-3.36", "wpn_fps_snp_winchester1894_sight_rail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_winchester1894", "wpn_fps_upg_o_st10", "-0.005,4,-3.695", "wpn_fps_snp_winchester1894_sight_rail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_winchester1894", "wpn_fps_upg_o_visionking", "-0.005,4,-3.695", "wpn_fps_snp_winchester1894_sight_rail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_winchester1894", "wpn_fps_upg_o_compm2", "-0.005,4,-3.045", "wpn_fps_snp_winchester1894_sight_rail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_winchester1894", "wpn_fps_upg_o_rmr_riser", "-0.005,1,-2.315", "wpn_fps_snp_winchester1894_sight_rail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_winchester1894", "wpn_fps_upg_o_okp7", "0.595,4,-2.765", "wpn_fps_snp_winchester1894_sight_rail")
end
-- AAI LSAT
if self.wpn_fps_lmg_lsat then
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_lsat", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_lsat", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_lsat", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_lsat", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_lsat", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_lsat", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_lmg_lsat", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("stock", "wpn_fps_lmg_lsat", "AR15_StockPack")
	self:cafcw_add_modpack("stock", "wpn_fps_lmg_lsat", "Stock_Attachment_Pack")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_lmg_lsat", "SneakySuppressorPack", "ARSupp")
end
-- Molot Vepr-12
if self.wpn_fps_shot_vepr12 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_vepr12", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vepr12_handguard_midwest", "wpn_fps_upg_fl_ass_spotter", "a_fl_midwest")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vepr12_handguard_terminator", "wpn_fps_upg_fl_ass_spotter", "a_fl_terminator")
	self:cafcw_add_to_parts("stock", "wpn_fps_shot_vepr12", "wpn_fps_upg_m4_s_hke1")
	self:cafcw_add_to_parts("stock", "wpn_fps_shot_vepr12", "wpn_fps_upg_m4_s_viper")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_vepr12", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vepr12_handguard_midwest", "wpn_fps_upg_fl_wml", "a_fl_midwest")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vepr12_handguard_terminator", "wpn_fps_upg_fl_wml", "a_fl_terminator")
	self:cafcw_add_to_parts("forbids", "wpn_fps_shot_vepr12_rearsight", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_shot_vepr12", "wpn_fps_upg_ns_sho_salvo_small")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_vepr12", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vepr12_handguard_midwest", "wpn_fps_upg_fl_anpeq2", "a_fl_midwest")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vepr12_handguard_terminator", "wpn_fps_upg_fl_anpeq2", "a_fl_terminator")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_vepr12", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vepr12_handguard_midwest", "wpn_fps_upg_fl_dbal_d2", "a_fl_midwest")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vepr12_handguard_terminator", "wpn_fps_upg_fl_dbal_d2", "a_fl_terminator")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_vepr12", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vepr12_handguard_midwest", "wpn_fps_upg_fl_m600p", "a_fl_midwest")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vepr12_handguard_terminator", "wpn_fps_upg_fl_m600p", "a_fl_terminator")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_vepr12", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vepr12_handguard_midwest", "wpn_fps_upg_fl_utg", "a_fl_midwest")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vepr12_handguard_terminator", "wpn_fps_upg_fl_utg", "a_fl_terminator")
	self:cafcw_add_modpack("ammo", "wpn_fps_shot_vepr12", "_12ga_auto", "TaserAmmo")
	self:cafcw_add_modpack("stock", "wpn_fps_shot_vepr12", "Stock_Attachment_Pack")
	self:cafcw_add_to_parts("sight", "wpn_fps_shot_vepr12", "wpn_fps_upg_o_1p29", "wpn_fps_upg_o_1p29", "wpn_fps_snp_siltstone")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_shot_vepr12", "wpn_fps_upg_o_ekp_1s_03", "0.2,-11,-1.4")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_shot_vepr12", "wpn_fps_upg_o_okp7_dove", "0.625,-9,-0.98")
	self:cafcw_add_to_parts("sight", "wpn_fps_shot_vepr12", "wpn_fps_upg_o_pso1_rifle", "wpn_fps_upg_o_pso1_rifle", "wpn_fps_snp_siltstone")
	self:cafcw_add_to_parts("sight", "wpn_fps_shot_vepr12", "wpn_fps_upg_o_1pn93", "wpn_fps_upg_o_1pn93", "wpn_fps_snp_siltstone")
	self:cafcw_add_custom_sights("specter", "wpn_fps_shot_vepr12", "wpn_fps_ass_flint", "wpn_fps_shot_vepr12_rec_sight_rail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_shot_vepr12", "wpn_fps_ass_flint", "wpn_fps_shot_vepr12_rec_sight_rail")
	self:cafcw_add_custom_sights("custom", "wpn_fps_shot_vepr12", "wpn_fps_ass_flint", "wpn_fps_shot_vepr12_rec_sight_rail")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_shot_vepr12", "wpn_fps_ass_flint")
end
-- Tokarev SVT-40
if self.wpn_fps_ass_svt40 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_svt40", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_svt40", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("forbids", "wpn_fps_ass_svt40_irons", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_svt40_pu_scope_switch", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_svt40", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_svt40", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_svt40", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_svt40", "wpn_fps_upg_fl_utg")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_svt40", "wpn_fps_snp_siltstone", "wpn_fps_ass_svt40_sight_mount")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_svt40", "wpn_fps_snp_siltstone", "wpn_fps_ass_svt40_sight_mount")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_svt40", "wpn_fps_snp_siltstone", "wpn_fps_ass_svt40_sight_mount")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_svt40", "wpn_fps_snp_siltstone")
end
-- McMillan CS5
if self.wpn_fps_snp_cs5 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_cs5", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_cs5", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_cs5", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_cs5", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_cs5", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_cs5", "wpn_fps_upg_fl_utg")
	self:cafcw_add_custom_sights("specter", "wpn_fps_snp_cs5", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("acog", "wpn_fps_snp_cs5", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("custom", "wpn_fps_snp_cs5", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("custom_sniper", "wpn_fps_snp_cs5", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("shortdot", "wpn_fps_snp_cs5", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_snp_cs5", "wpn_fps_snp_msr")
end
-- Desert Tech MDR
if self.wpn_fps_ass_mdr then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_mdr", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_mdr_gadgets_leftrail", "wpn_fps_upg_fl_ass_spotter", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_mdr", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_mdr_gadgets_leftrail", "wpn_fps_upg_fl_wml", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_mdr", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_mdr_gadgets_leftrail", "wpn_fps_upg_fl_anpeq2", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_mdr", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_mdr_gadgets_leftrail", "wpn_fps_upg_fl_dbal_d2", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_mdr", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_mdr_gadgets_leftrail", "wpn_fps_upg_fl_m600p", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_mdr", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_mdr_gadgets_leftrail", "wpn_fps_upg_fl_utg", "a_fl_leftrail")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_mdr", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_mdr", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_mdr", "wpn_fps_ass_aug")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_mdr", "wpn_fps_ass_aug")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_mdr", "wpn_fps_ass_aug")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_mdr", "wpn_fps_ass_aug")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_mdr", "wpn_fps_upg_o_var_m4flipup_rear", "wpn_fps_upg_o_var_m4flipup_rear", "wpn_fps_ass_aug")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_mdr", "wpn_fps_upg_o_var_mbus_rear", "wpn_fps_upg_o_var_mbus_rear", "wpn_fps_ass_aug")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_mdr", "wpn_fps_upg_o_var_troy_rear", "wpn_fps_upg_o_var_troy_rear", "wpn_fps_ass_aug")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_mdr", "wpn_fps_upg_o_var_troym4_rear", "wpn_fps_upg_o_var_troym4_rear", "wpn_fps_ass_aug")
end
-- SIG SG 510
if self.wpn_fps_ass_sg510 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sg510", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sg510", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sg510", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sg510", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sg510", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sg510", "wpn_fps_upg_fl_utg")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_sg510", "wpn_fps_ass_galil", "wpn_fps_ass_sg510_sight_rail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_sg510", "wpn_fps_ass_galil", "wpn_fps_ass_sg510_sight_rail")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_sg510", "wpn_fps_ass_galil", "wpn_fps_ass_sg510_sight_rail")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_sg510", "_762x51mm", "MoreAmmoTypes")
end
-- FN FNAR
if self.wpn_fps_ass_fnar then
	self:cafcw_add_to_parts("forbids_add", "wpn_fps_upg_fnar_gadget_dueck_offset", "wpn_fps_upg_o_acog_rmr")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_fnar", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_fnar_gadgets_bottomrail", "wpn_fps_upg_fl_ass_spotter", "a_fl_bottomrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_fnar_gadgets_leftrail", "wpn_fps_upg_fl_ass_spotter", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_fnar", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_fnar_gadgets_bottomrail", "wpn_fps_upg_fl_wml", "a_fl_bottomrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_fnar_gadgets_leftrail", "wpn_fps_upg_fl_wml", "a_fl_leftrail")
	self:cafcw_add_to_parts("forbids_add", "wpn_fps_upg_fnar_gadget_dueck_offset", "wpn_fps_upg_o_ta648rmr")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_fnar", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_fnar_gadgets_bottomrail", "wpn_fps_upg_fl_anpeq2", "a_fl_bottomrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_fnar_gadgets_leftrail", "wpn_fps_upg_fl_anpeq2", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_fnar", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_fnar_gadgets_bottomrail", "wpn_fps_upg_fl_dbal_d2", "a_fl_bottomrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_fnar_gadgets_leftrail", "wpn_fps_upg_fl_dbal_d2", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_fnar", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_fnar_gadgets_bottomrail", "wpn_fps_upg_fl_m600p", "a_fl_bottomrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_fnar_gadgets_leftrail", "wpn_fps_upg_fl_m600p", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_fnar", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_fnar_gadgets_bottomrail", "wpn_fps_upg_fl_utg", "a_fl_bottomrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_fnar_gadgets_leftrail", "wpn_fps_upg_fl_utg", "a_fl_leftrail")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_fnar", "wpn_fps_snp_siltstone")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_fnar", "wpn_fps_snp_siltstone")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_fnar", "wpn_fps_snp_siltstone")
	self:cafcw_add_custom_sights("custom_sniper", "wpn_fps_ass_fnar", "wpn_fps_snp_siltstone")
	self:cafcw_add_custom_sights("shortdot", "wpn_fps_ass_fnar", "wpn_fps_snp_siltstone")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_fnar", "_762x51mm", "MoreAmmoTypes")
end
-- Mk 12 Mod 1 SPR
-- Shortdot stance_mod: 0,-21,-1.302
if self.wpn_fps_snp_mk12 then
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_mk12", "wpn_fps_upg_o_1p69", "0,-23,-1.302")
	self:cafcw_add_to_parts("forbids_add", "wpn_fps_upg_mk12_dueck_offset", "wpn_fps_upg_o_acog_rmr")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_mk12", "wpn_fps_upg_o_deltatitanium", "0,-25,-1.302")
	self:cafcw_add_to_parts("stock", "wpn_fps_snp_mk12", "wpn_fps_upg_m4_s_caastock")
	self:cafcw_add_to_parts("stock", "wpn_fps_snp_mk12", "wpn_fps_upg_m4_s_caastock_black")
	self:cafcw_add_to_parts("stock", "wpn_fps_snp_mk12", "wpn_fps_upg_m4_s_hke1")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_mk12", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_mk12", "wpn_fps_upg_o_csgoscope", "0,-25,-1.302")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_mk12", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("forbids_add", "wpn_fps_upg_mk12_dueck_offset", "wpn_fps_upg_o_ta648rmr")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_mk12", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_mk12", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_mk12", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_mk12", "wpn_fps_upg_fl_utg")
	self:cafcw_add_modpack("stock", "wpn_fps_snp_mk12", "Stock_Attachment_Pack")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_mk12", "wpn_fps_upg_o_st10", "0,3,-0.58")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_mk12", "wpn_fps_upg_o_visionking", "0,12,-0.58")
	self:cafcw_add_custom_sights("specter", "wpn_fps_snp_mk12", "wpn_fps_ass_m4")
	self:cafcw_add_custom_sights("acog", "wpn_fps_snp_mk12", "wpn_fps_ass_m4")
	self:cafcw_add_custom_sights("custom_mk12", "wpn_fps_snp_mk12", "wpn_fps_ass_m4")
	self:cafcw_add_custom_sights("shortdot", "wpn_fps_snp_mk12", "wpn_fps_snp_mk12")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_snp_mk12", "wpn_fps_ass_m4")
end
-- STK SAR 21 MMS
if self.wpn_fps_ass_sar21 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sar21", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sar21_gadgets_bottomrail", "wpn_fps_upg_fl_ass_spotter", "a_fl_bottomrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sar21_gadgets_leftrail", "wpn_fps_upg_fl_ass_spotter", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sar21", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sar21_gadgets_bottomrail", "wpn_fps_upg_fl_wml", "a_fl_bottomrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sar21_gadgets_leftrail", "wpn_fps_upg_fl_wml", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sar21", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sar21_gadgets_bottomrail", "wpn_fps_upg_fl_anpeq2", "a_fl_bottomrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sar21_gadgets_leftrail", "wpn_fps_upg_fl_anpeq2", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sar21", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sar21_gadgets_bottomrail", "wpn_fps_upg_fl_dbal_d2", "a_fl_bottomrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sar21_gadgets_leftrail", "wpn_fps_upg_fl_dbal_d2", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sar21", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sar21_gadgets_bottomrail", "wpn_fps_upg_fl_m600p", "a_fl_bottomrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sar21_gadgets_leftrail", "wpn_fps_upg_fl_m600p", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_sar21", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sar21_gadgets_bottomrail", "wpn_fps_upg_fl_utg", "a_fl_bottomrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_sar21_gadgets_leftrail", "wpn_fps_upg_fl_utg", "a_fl_leftrail")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_sar21", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_sar21", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_sar21", "wpn_fps_ass_corgi")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_sar21", "wpn_fps_ass_corgi")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_sar21", "wpn_fps_ass_corgi")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_sar21", "wpn_fps_ass_corgi")
end
-- Winchester Model 1912
if self.wpn_fps_shot_m1912 then
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_m1912", "wpn_fps_upg_fl_ass_spotter", "wpn_fps_shot_m1912_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_m1912", "wpn_fps_upg_fl_wml", "wpn_fps_shot_m1912_gadget_rail")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_shot_m1912", "wpn_fps_upg_ns_sho_salvo_small")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_m1912", "wpn_fps_upg_fl_anpeq2", "wpn_fps_shot_m1912_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_m1912", "wpn_fps_upg_fl_dbal_d2", "wpn_fps_shot_m1912_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_m1912", "wpn_fps_upg_fl_m600p", "wpn_fps_shot_m1912_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_m1912", "wpn_fps_upg_fl_utg", "wpn_fps_shot_m1912_gadget_rail")
end
-- K31
if self.wpn_fps_snp_k31 then
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_k31", "wpn_fps_upg_fl_ass_spotter", "wpn_fps_snp_k31_gadget_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_k31_gadget_bottom_rail", "wpn_fps_upg_fl_ass_spotter", "a_fl_bottomrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_k31_gadget_left_rail", "wpn_fps_upg_fl_ass_spotter", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_k31", "wpn_fps_upg_fl_wml", "wpn_fps_snp_k31_gadget_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_k31_gadget_bottom_rail", "wpn_fps_upg_fl_wml", "a_fl_bottomrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_k31_gadget_left_rail", "wpn_fps_upg_fl_wml", "a_fl_leftrail")
	self:cafcw_add_to_parts("forbids", "wpn_fps_snp_k31_irons", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_k31_scope", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_k31", "wpn_fps_upg_fl_anpeq2", "wpn_fps_snp_k31_gadget_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_k31_gadget_bottom_rail", "wpn_fps_upg_fl_anpeq2", "a_fl_bottomrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_k31_gadget_left_rail", "wpn_fps_upg_fl_anpeq2", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_k31", "wpn_fps_upg_fl_dbal_d2", "wpn_fps_snp_k31_gadget_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_k31_gadget_bottom_rail", "wpn_fps_upg_fl_dbal_d2", "a_fl_bottomrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_k31_gadget_left_rail", "wpn_fps_upg_fl_dbal_d2", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_k31", "wpn_fps_upg_fl_m600p", "wpn_fps_snp_k31_gadget_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_k31_gadget_bottom_rail", "wpn_fps_upg_fl_m600p", "a_fl_bottomrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_k31_gadget_left_rail", "wpn_fps_upg_fl_m600p", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_k31", "wpn_fps_upg_fl_utg", "wpn_fps_snp_k31_gadget_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_k31_gadget_bottom_rail", "wpn_fps_upg_fl_utg", "a_fl_bottomrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_k31_gadget_left_rail", "wpn_fps_upg_fl_utg", "a_fl_leftrail")
	self:cafcw_add_custom_sights("specter", "wpn_fps_snp_k31", "wpn_fps_snp_r93", "wpn_fps_snp_k31_sight_rail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_snp_k31", "wpn_fps_snp_r93", "wpn_fps_snp_k31_sight_rail")
	self:cafcw_add_custom_sights("custom", "wpn_fps_snp_k31", "wpn_fps_snp_r93", "wpn_fps_snp_k31_sight_rail")
	self:cafcw_add_custom_sights("custom_sniper", "wpn_fps_snp_k31", "wpn_fps_snp_r93", "wpn_fps_snp_k31_sight_rail")
	self:cafcw_add_custom_sights("shortdot", "wpn_fps_snp_k31", "wpn_fps_snp_r93", "wpn_fps_snp_k31_sight_rail")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_snp_k31", "wpn_fps_snp_k31")
end
-- Akimbo Pancor Jackhammer
if self.wpn_fps_shot_x_jackhammer then
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_jackhammer", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_jackhammer", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_shot_x_jackhammer", "wpn_fps_upg_ns_sho_salvo_small")
	self:cafcw_add_to_parts("forbids", "wpn_fps_shot_jackhammer_barrel", "wpn_fps_upg_ns_sho_salvo_small")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_jackhammer_barrel_supp", "wpn_fps_upg_ns_sho_salvo_small")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_jackhammer", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_jackhammer", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_jackhammer", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_jackhammer", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_jackhammer", "wpn_fps_upg_fl_utg")
end
-- Akimbo Magpul FMG-9
if self.wpn_fps_smg_x_fmg9 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_fmg9", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_fmg9", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_fmg9", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_fmg9", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_fmg9", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_fmg9", "wpn_fps_upg_fl_utg")
	self:cafcw_add_modpack("ammo", "wpn_fps_smg_x_fmg9", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
end
-- Akimbo APS
if self.wpn_fps_x_aps then
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_x_aps", "wpn_fps_ass_ns_g_sup1")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_x_aps", "wpn_fps_ass_ns_g_sup2")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_x_aps", "wpn_fps_ass_ns_g_sup6")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_x_aps", "wpn_fps_upg_fl_unimax", "wpn_fps_pis_aps_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_x_aps", "wpn_fps_upg_fl_utg_pis", "wpn_fps_pis_aps_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_x_aps", "wpn_fps_upg_fl_micro90", "wpn_fps_pis_aps_rail")
end
-- Akimbo HK45C
if self.wpn_fps_x_hk45c then
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_x_hk45c", "wpn_fps_ass_ns_g_sup1")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_x_hk45c", "wpn_fps_ass_ns_g_sup1", "a_ns", "barrel")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_x_hk45c", "wpn_fps_ass_ns_g_sup2")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_x_hk45c", "wpn_fps_ass_ns_g_sup2", "a_ns", "barrel")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_x_hk45c", "wpn_fps_ass_ns_g_sup6")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_x_hk45c", "wpn_fps_ass_ns_g_sup6", "a_ns", "barrel")
	self:cafcw_add_to_parts("gadget", "wpn_fps_x_hk45c", "wpn_fps_upg_fl_unimax")
	self:cafcw_add_to_parts("gadget", "wpn_fps_x_hk45c", "wpn_fps_upg_fl_utg_pis")
	self:cafcw_add_to_parts("gadget", "wpn_fps_x_hk45c", "wpn_fps_upg_fl_micro90")
end
-- ASh-12.7
if self.wpn_fps_ass_ash then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ash", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ash_gadgets_leftrail", "wpn_fps_upg_fl_ass_spotter", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ash", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ash_gadgets_leftrail", "wpn_fps_upg_fl_wml", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ash", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ash_gadgets_leftrail", "wpn_fps_upg_fl_anpeq2", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ash", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ash_gadgets_leftrail", "wpn_fps_upg_fl_dbal_d2", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ash", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ash_gadgets_leftrail", "wpn_fps_upg_fl_m600p", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ash", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_ash_gadgets_leftrail", "wpn_fps_upg_fl_utg", "a_fl_leftrail")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_ash", "wpn_fps_ass_famas")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_ash", "wpn_fps_ass_famas")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_ash", "wpn_fps_ass_famas")
end
-- STK Ultimax 100 Mark 5
if self.wpn_fps_lmg_ultimax then
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_ultimax", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_ultimax", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_ultimax", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_ultimax", "wpn_fps_upg_fl_utg")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_lmg_ultimax", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_modpack("ammo", "wpn_fps_lmg_ultimax", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
end
-- Browning M1919A6
if self.wpn_fps_lmg_m1919a6 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_m1919a6", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_m1919a6_barrel_m1917", "wpn_fps_upg_fl_ass_spotter", "a_fl_m1917")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_m1919a6", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_m1919a6_barrel_m1917", "wpn_fps_upg_fl_wml", "a_fl_m1917")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_m1919a6", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_m1919a6_barrel_m1917", "wpn_fps_upg_fl_anpeq2", "a_fl_m1917")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_m1919a6", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_m1919a6_barrel_m1917", "wpn_fps_upg_fl_dbal_d2", "a_fl_m1917")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_m1919a6", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_m1919a6_barrel_m1917", "wpn_fps_upg_fl_m600p", "a_fl_m1917")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_m1919a6", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_m1919a6_barrel_m1917", "wpn_fps_upg_fl_utg", "a_fl_m1917")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_lmg_m1919a6", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_lmg_m1919a6", "SneakySuppressorPack", "ARSupp")
end
-- Armalite AR-18
if self.wpn_fps_ass_ar18 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ar18", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ar18", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ar18", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ar18", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ar18", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ar18", "wpn_fps_upg_fl_utg")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_ar18", "wpn_fps_ass_ak5", "wpn_fps_ass_ar18_sight_rail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_ar18", "wpn_fps_ass_ak5", "wpn_fps_ass_ar18_sight_rail")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_ar18", "wpn_fps_ass_ak5", "wpn_fps_ass_ar18_sight_rail")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_ar18", "wpn_fps_ass_ak5")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_ar18", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
end
-- TOZ-34
-- Specter stance_mod: 0,0,-3.325
-- Acog stance_mod: 0,-5,-3.32
if self.wpn_fps_shot_toz34 then
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_toz34", "wpn_fps_upg_fl_ass_spotter", "wpn_fps_shot_toz34_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_toz34", "wpn_fps_upg_fl_wml", "wpn_fps_shot_toz34_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_toz34", "wpn_fps_upg_fl_anpeq2", "wpn_fps_shot_toz34_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_toz34", "wpn_fps_upg_fl_dbal_d2", "wpn_fps_shot_toz34_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_toz34", "wpn_fps_upg_fl_m600p", "wpn_fps_shot_toz34_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_toz34", "wpn_fps_upg_fl_utg", "wpn_fps_shot_toz34_gadget_rail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_shot_toz34", "wpn_fps_upg_o_st10", "0,-4,-3.316", "wpn_fps_shot_toz34_sight_rail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_shot_toz34", "wpn_fps_upg_o_visionking", "0,6,-3.292", "wpn_fps_shot_toz34_sight_rail")
	self:cafcw_add_custom_sights("specter", "wpn_fps_shot_toz34", "wpn_fps_shot_toz34", "wpn_fps_shot_toz34_sight_rail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_shot_toz34", "wpn_fps_shot_toz34", "wpn_fps_shot_toz34_sight_rail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_shot_toz34", "wpn_fps_upg_o_eotech552", "0,0,-2.99", "wpn_fps_shot_toz34_sight_rail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_shot_toz34", "wpn_fps_upg_o_susat", "0,-5,-5.08", "wpn_fps_shot_toz34_sight_rail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_shot_toz34", "wpn_fps_upg_o_compm2", "0,0,-2.675", "wpn_fps_shot_toz34_sight_rail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_shot_toz34", "wpn_fps_upg_o_rmr_riser", "0,-3,-1.945", "wpn_fps_shot_toz34_sight_rail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_shot_toz34", "wpn_fps_upg_o_okp7", "0.6,0,-2.395", "wpn_fps_shot_toz34_sight_rail")
end
-- Akimbo TOZ-66
if self.wpn_fps_shot_x_toz66 then
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_x_toz66", "wpn_fps_upg_fl_ass_spotter", "wpn_fps_shot_x_toz66_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_x_toz66", "wpn_fps_upg_fl_wml", "wpn_fps_shot_x_toz66_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_x_toz66", "wpn_fps_upg_fl_anpeq2", "wpn_fps_shot_x_toz66_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_x_toz66", "wpn_fps_upg_fl_dbal_d2", "wpn_fps_shot_x_toz66_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_x_toz66", "wpn_fps_upg_fl_m600p", "wpn_fps_shot_x_toz66_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_x_toz66", "wpn_fps_upg_fl_utg", "wpn_fps_shot_x_toz66_gadget_rail")
end
-- Merkel Drilling 961LS
-- Specter stance_mod: 0,-3,-4.325
-- Acog stance_mod: 0,-6,-4.325
if self.wpn_fps_snp_merkel then
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_merkel", "wpn_fps_upg_fl_ass_spotter", "wpn_fps_snp_merkel_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_merkel", "wpn_fps_upg_fl_wml", "wpn_fps_snp_merkel_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_merkel", "wpn_fps_upg_fl_anpeq2", "wpn_fps_snp_merkel_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_merkel", "wpn_fps_upg_fl_dbal_d2", "wpn_fps_snp_merkel_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_merkel", "wpn_fps_upg_fl_m600p", "wpn_fps_snp_merkel_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_snp_merkel", "wpn_fps_upg_fl_utg", "wpn_fps_snp_merkel_gadget_rail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_merkel", "wpn_fps_upg_o_st10", "0,-8,-4.315", "wpn_fps_snp_merkel_sight_rail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_merkel", "wpn_fps_upg_o_visionking", "0,2,-4.292", "wpn_fps_snp_merkel_sight_rail")
	self:cafcw_add_custom_sights("specter", "wpn_fps_snp_merkel", "wpn_fps_snp_merkel", "wpn_fps_snp_merkel_sight_rail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_snp_merkel", "wpn_fps_snp_merkel", "wpn_fps_snp_merkel_sight_rail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_merkel", "wpn_fps_upg_o_eotech552", "0,-3,-3.99", "wpn_fps_snp_merkel_sight_rail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_merkel", "wpn_fps_upg_o_susat", "0,-6,-6.08", "wpn_fps_snp_merkel_sight_rail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_merkel", "wpn_fps_upg_o_compm2", "0,-3,-3.675", "wpn_fps_snp_merkel_sight_rail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_merkel", "wpn_fps_upg_o_rmr_riser", "0,-3,-2.945", "wpn_fps_snp_merkel_sight_rail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_merkel", "wpn_fps_upg_o_okp7", "0.6,-3,-3.395", "wpn_fps_snp_merkel_sight_rail")
end
-- HK G3A3 M203
if self.wpn_fps_ass_g3m203 then
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_kobra", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_compm4s", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_m145", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_pkas", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_coyote", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_acog_rmr", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_hologram", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_gitsch", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_zeiss", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_okp7", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_hd33", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_prismatic", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_srs", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_st10", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_hcog", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_reflexholo", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_aog", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_rmr_riser", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_elo", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_po4", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_susat", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_kemper", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_mepro", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_rusak", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_horzine", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_eotech552", "a_o_claw")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_g3m203", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_handguard_rail", "wpn_fps_upg_fl_ass_spotter", "a_fl_rail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_g3m203", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_handguard_rail", "wpn_fps_upg_fl_wml", "a_fl_rail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_g3m203", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_handguard_rail", "wpn_fps_upg_fl_anpeq2", "a_fl_rail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_g3m203", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_handguard_rail", "wpn_fps_upg_fl_dbal_d2", "a_fl_rail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_g3m203", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_handguard_rail", "wpn_fps_upg_fl_m600p", "a_fl_rail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_g3m203", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_handguard_rail", "wpn_fps_upg_fl_utg", "a_fl_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_visionking", "a_o_claw")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_pka", "a_o_claw")
	self:cafcw_add_to_parts("part_copy_part_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_delta_rm55", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_45rds")
 	self:cafcw_add_to_parts("forbids", "wpn_fps_ass_g3m203_rear_sight", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_g3m203", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_g3m203", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_g3m203_sight_mount_claw", "wpn_fps_upg_o_anpas13d", "a_o_claw")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_g3m203", "wpn_fps_ass_g3", "wpn_fps_ass_g3m203_sightrail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_g3m203", "wpn_fps_ass_g3", "wpn_fps_ass_g3m203_sightrail")
	self:cafcw_add_custom_sights("custom_g3m203", "wpn_fps_ass_g3m203", "wpn_fps_ass_g3", "wpn_fps_ass_g3m203_sightrail")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_g3m203", "wpn_fps_ass_g3m203")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_g3m203", "_762x51mm", "MoreAmmoTypes")
end
-- HK MG4
if self.wpn_fps_lmg_mg4 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_mg4", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_mg4", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_mg4", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_mg4", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_mg4", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_mg4", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_lmg_mg4", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_lmg_mg4", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_modpack("ammo", "wpn_fps_lmg_mg4", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
end
-- HK PSG-1
-- Shortdot stance_mod: 0.025,-34,-4.19
if self.wpn_fps_snp_psg1 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_psg1", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_snp_psg1_handguard", "wpn_fps_upg_fl_ass_spotter", "a_fl_psg1")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_psg1_handguard_rail", "wpn_fps_upg_fl_ass_spotter", "a_fl_rail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_psg1", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_snp_psg1_handguard", "wpn_fps_upg_fl_wml", "a_fl_psg1")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_psg1_handguard_rail", "wpn_fps_upg_fl_wml", "a_fl_rail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_psg1", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_snp_psg1_handguard", "wpn_fps_upg_fl_anpeq2", "a_fl_psg1")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_psg1_handguard_rail", "wpn_fps_upg_fl_anpeq2", "a_fl_rail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_psg1", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_snp_psg1_handguard", "wpn_fps_upg_fl_dbal_d2", "a_fl_psg1")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_psg1_handguard_rail", "wpn_fps_upg_fl_dbal_d2", "a_fl_rail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_psg1", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_snp_psg1_handguard", "wpn_fps_upg_fl_m600p", "a_fl_psg1")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_psg1_handguard_rail", "wpn_fps_upg_fl_m600p", "a_fl_rail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_psg1", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_snp_psg1_handguard", "wpn_fps_upg_fl_utg", "a_fl_psg1")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_psg1_handguard_rail", "wpn_fps_upg_fl_utg", "a_fl_rail")
	self:cafcw_add_custom_sights("specter", "wpn_fps_snp_psg1", "wpn_fps_ass_g3", "wpn_fps_snp_psg1_sightrail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_snp_psg1", "wpn_fps_ass_g3", "wpn_fps_snp_psg1_sightrail")
	self:cafcw_add_custom_sights("custom", "wpn_fps_snp_psg1", "wpn_fps_ass_g3", "wpn_fps_snp_psg1_sightrail")
	self:cafcw_add_custom_sights("shortdot", "wpn_fps_snp_psg1", "wpn_fps_snp_psg1", "wpn_fps_snp_psg1_sightrail")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_snp_psg1", "wpn_fps_snp_psg1")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_snp_psg1", "wpn_fps_upg_o_1p69", "a_o_scope")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_snp_psg1", "wpn_fps_upg_o_deltatitanium", "a_o_scope")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_snp_psg1", "wpn_fps_upg_o_csgoscope", "a_o_scope")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_snp_psg1", "wpn_fps_upg_o_ta648", "a_o_scope")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_snp_psg1", "wpn_fps_upg_o_ta648rmr", "a_o_scope")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_psg1", "wpn_fps_upg_o_1p69", "0.025,-35,-4.19", "wpn_fps_snp_psg1_sightrail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_psg1", "wpn_fps_upg_o_deltatitanium", "0.025,-35,-4.19", "wpn_fps_snp_psg1_sightrail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_psg1", "wpn_fps_upg_o_csgoscope", "0.025,-37,-4.19", "wpn_fps_snp_psg1_sightrail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_psg1", "wpn_fps_upg_o_dd_a1", "0.02,-10,-3.1", "wpn_fps_snp_psg1_sightrail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_psg1", "wpn_fps_upg_o_m4flipup", "0.02,-10,-3.1", "wpn_fps_snp_psg1_sightrail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_psg1", "wpn_fps_upg_o_mbus", "0.02,-10,-3.1", "wpn_fps_snp_psg1_sightrail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_psg1", "wpn_fps_upg_o_scorpionevo", "0.02,-12,-1.08", "wpn_fps_snp_psg1_sightrail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_psg1", "wpn_fps_upg_o_troy", "0.02,-10,-3.1", "wpn_fps_snp_psg1_sightrail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_psg1", "wpn_fps_upg_o_troy_m4", "0.02,-10,-3.1", "wpn_fps_snp_psg1_sightrail")
	self:cafcw_add_modpack("ammo", "wpn_fps_snp_psg1", "_762x51mm", "MoreAmmoTypes")
end
-- Lewis Gun
if self.wpn_fps_lmg_lewis then
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_lewis", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_lewis", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_lewis", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_lewis", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_lewis", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_lewis", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_lmg_lewis", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_lmg_lewis", "SneakySuppressorPack", "ARSupp")
end
-- Caulk n' Burn
if self.wpn_fps_fla_caulk then
	self:cafcw_add_to_parts("gadget", "wpn_fps_fla_caulk", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_fla_caulk", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_fla_caulk", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_fla_caulk", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_fla_caulk", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_fla_caulk", "wpn_fps_upg_fl_utg")
end
-- AMR-2
if self.wpn_fps_snp_amr2 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_amr2", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_amr2", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_amr2", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_amr2", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_amr2", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_amr2", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_amr2", "wpn_fps_upg_o_dd_a1", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_amr2", "wpn_fps_upg_o_m4flipup", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_amr2", "wpn_fps_upg_o_mbus", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_amr2", "wpn_fps_upg_o_scorpionevo", "wpn_fps_upg_o_scorpionevo", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_amr2", "wpn_fps_upg_o_troy", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_amr2", "wpn_fps_upg_o_troy_m4", "wpn_fps_upg_o_dd_a1", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("specter", "wpn_fps_snp_amr2", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("acog", "wpn_fps_snp_amr2", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("custom_amr2", "wpn_fps_snp_amr2", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("custom_sniper", "wpn_fps_snp_amr2", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("shortdot", "wpn_fps_snp_amr2", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_snp_amr2", "wpn_fps_snp_msr")
end
-- Sjogren Inertia
if self.wpn_fps_shot_sjogren then
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_sjogren", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_sjogren", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_sjogren", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_sjogren", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_sjogren", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_sjogren", "wpn_fps_upg_fl_utg")
	self:cafcw_add_custom_sights("specter", "wpn_fps_shot_sjogren", "wpn_fps_sho_ben", "wpn_fps_shot_sjogren_rail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_shot_sjogren", "wpn_fps_sho_ben", "wpn_fps_shot_sjogren_rail")
	self:cafcw_add_custom_sights("custom", "wpn_fps_shot_sjogren", "wpn_fps_sho_ben", "wpn_fps_shot_sjogren_rail")
end
-- Secondary
--
-- MPX
if self.wpn_fps_smg_mpx then
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_mpx", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_mpx", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_mpx", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_mpx", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_mpx", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_mpx", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_mpx", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_mpx_barrel_sd", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("ammo", "wpn_fps_smg_mpx", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("stock", "wpn_fps_smg_mpx", "AR15_StockPack")
	self:cafcw_add_modpack("stock", "wpn_fps_smg_mpx", "Stock_Attachment_Pack")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_smg_mpx", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_mpx_barrel_sd", "wpn_fps_ass_ns_g_sup3")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_mpx_barrel_sd", "wpn_fps_ass_ns_g_sup4")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_mpx_barrel_sd", "wpn_fps_ass_ns_g_sup5")
	self:cafcw_add_custom_sights("specter", "wpn_fps_smg_mpx", "wpn_fps_smg_olympic")
	self:cafcw_add_custom_sights("acog", "wpn_fps_smg_mpx", "wpn_fps_smg_olympic")
	self:cafcw_add_custom_sights("custom", "wpn_fps_smg_mpx", "wpn_fps_smg_olympic")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_smg_mpx", "wpn_fps_upg_o_var_kac_rear", "0.022,-2,-0.25")
	self:cafcw_add_to_parts("sight", "wpn_fps_smg_mpx", "wpn_fps_upg_o_var_m4flipup_rear", "wpn_fps_smg_mpx_troy", "wpn_fps_smg_mpx")
	self:cafcw_add_to_parts("sight", "wpn_fps_smg_mpx", "wpn_fps_upg_o_var_mbus_rear", "wpn_fps_smg_mpx_troy", "wpn_fps_smg_mpx")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_smg_mpx", "wpn_fps_upg_o_var_scorpionevo_rear", "0.022,-6,2.29")
	self:cafcw_add_to_parts("sight", "wpn_fps_smg_mpx", "wpn_fps_upg_o_var_troym4_rear", "wpn_fps_smg_mpx_troy", "wpn_fps_smg_mpx")
end
-- PPSh-41
if self.wpn_fps_smg_ppsh then
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_ppsh", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_ppsh", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_ppsh", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_ppsh", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_ppsh", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_ppsh", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_ppsh", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_smg_ppsh", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_to_parts("forbids", "wpn_fps_smg_ppsh_barrel", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_to_parts("forbids", "wpn_fps_smg_ppsh_barrel", "wpn_fps_ass_ns_g_sup3")
	self:cafcw_add_to_parts("forbids", "wpn_fps_smg_ppsh_barrel", "wpn_fps_ass_ns_g_sup4")
	self:cafcw_add_to_parts("forbids", "wpn_fps_smg_ppsh_barrel", "wpn_fps_ass_ns_g_sup5")
	self:cafcw_add_custom_sights("specter", "wpn_fps_smg_ppsh", "wpn_fps_smg_m45", "wpn_fps_smg_ppsh_rail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_smg_ppsh", "wpn_fps_smg_m45", "wpn_fps_smg_ppsh_rail")
	self:cafcw_add_custom_sights("custom", "wpn_fps_smg_ppsh", "wpn_fps_smg_m45", "wpn_fps_smg_ppsh_rail")
end
-- CBJ-MS
if self.wpn_fps_smg_cbjms then
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_cbjms", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_cbjms", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_cbjms", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_cbjms", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_cbjms", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_cbjms", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_cbjms", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("ammo", "wpn_fps_smg_cbjms", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_smg_cbjms", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_custom_sights("specter", "wpn_fps_smg_cbjms", "wpn_fps_smg_mp9")
	self:cafcw_add_custom_sights("acog", "wpn_fps_smg_cbjms", "wpn_fps_smg_mp9")
	self:cafcw_add_custom_sights("custom", "wpn_fps_smg_cbjms", "wpn_fps_smg_mp9")
end
-- Marlin Model 1894 Custom
-- Specter stance_mod: -0.005,-5,-3.395
-- Acog stance_mod: -0.01,-2,-3.355
if self.wpn_fps_snp_m1894 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_m1894", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_m1894_gadgets_toprail", "wpn_fps_upg_fl_ass_spotter", "a_fl_toprail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_m1894", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_m1894_gadgets_toprail", "wpn_fps_upg_fl_wml", "a_fl_toprail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_m1894", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_m1894_gadgets_toprail", "wpn_fps_upg_fl_anpeq2", "a_fl_toprail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_m1894", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_m1894_gadgets_toprail", "wpn_fps_upg_fl_dbal_d2", "a_fl_toprail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_m1894", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_m1894_gadgets_toprail", "wpn_fps_upg_fl_m600p", "a_fl_toprail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_m1894", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_m1894_gadgets_toprail", "wpn_fps_upg_fl_utg", "a_fl_toprail")
	self:cafcw_add_modpack("ammo", "wpn_fps_snp_m1894", "_109x33mmR", "MoreAmmoTypes")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_m1894", "wpn_fps_upg_o_susat", "-0.005,-5,-5.15")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_m1894", "wpn_fps_upg_o_eotech552", "-0.005,-5,-3.06")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_m1894", "wpn_fps_upg_o_susat", "-0.005,-2,-5.15")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_m1894", "wpn_fps_upg_o_compm2", "-0.005,-5,-2.745")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_m1894", "wpn_fps_upg_o_st10", "-0.005,-5,-3.395")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_m1894", "wpn_fps_upg_o_visionking", "-0.005,-5,-3.395")
	self:cafcw_add_custom_sights("specter", "wpn_fps_snp_m1894", "wpn_fps_snp_m1894")
	self:cafcw_add_custom_sights("acog", "wpn_fps_snp_m1894", "wpn_fps_snp_m1894")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_m1894", "wpn_fps_upg_o_rmr_riser", "-0.005,-5,-2.015")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_m1894", "wpn_fps_upg_o_okp7", "0.595,-5,-2.465")
end
-- Magpul FMG-9
if self.wpn_fps_smg_fmg9 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_fmg9", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_fmg9", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_fmg9", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_fmg9", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_fmg9", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_fmg9", "wpn_fps_upg_fl_utg")
	self:cafcw_add_modpack("ammo", "wpn_fps_smg_fmg9", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_custom_sights("specter", "wpn_fps_smg_fmg9", "wpn_fps_smg_sr2")
	self:cafcw_add_custom_sights("acog", "wpn_fps_smg_fmg9", "wpn_fps_smg_sr2")
	self:cafcw_add_custom_sights("custom", "wpn_fps_smg_fmg9", "wpn_fps_smg_sr2")
end
-- PP-19-01 Vityaz
if self.wpn_fps_smg_vityaz then
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_vityaz", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vityaz_handguard_redheat", "wpn_fps_upg_fl_ass_spotter", "a_fl_terminator")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vityaz_handguard_zenit", "wpn_fps_upg_fl_ass_spotter", "a_fl_zenit")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_vityaz", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vityaz_handguard_redheat", "wpn_fps_upg_fl_wml", "a_fl_terminator")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vityaz_handguard_zenit", "wpn_fps_upg_fl_wml", "a_fl_zenit")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_vityaz", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vityaz_handguard_redheat", "wpn_fps_upg_fl_anpeq2", "a_fl_terminator")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vityaz_handguard_zenit", "wpn_fps_upg_fl_anpeq2", "a_fl_zenit")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_vityaz", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vityaz_handguard_redheat", "wpn_fps_upg_fl_dbal_d2", "a_fl_terminator")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vityaz_handguard_zenit", "wpn_fps_upg_fl_dbal_d2", "a_fl_zenit")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_vityaz", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vityaz_handguard_redheat", "wpn_fps_upg_fl_m600p", "a_fl_terminator")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vityaz_handguard_zenit", "wpn_fps_upg_fl_m600p", "a_fl_zenit")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_vityaz", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vityaz_handguard_redheat", "wpn_fps_upg_fl_utg", "a_fl_terminator")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_vityaz_handguard_zenit", "wpn_fps_upg_fl_utg", "a_fl_zenit")
	self:cafcw_add_modpack("ammo", "wpn_fps_smg_vityaz", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("ammo", "wpn_fps_smg_vityaz", "_9x19mm_p", "MoreAmmoTypes")
	self:cafcw_add_modpack("stock", "wpn_fps_smg_vityaz", "AR15_StockPack")
	self:cafcw_add_modpack("stock", "wpn_fps_smg_vityaz", "Stock_Attachment_Pack")
	self:cafcw_add_custom_sights("specter", "wpn_fps_smg_vityaz", "wpn_fps_ass_flint")
	self:cafcw_add_custom_sights("acog", "wpn_fps_smg_vityaz", "wpn_fps_ass_flint")
	self:cafcw_add_custom_sights("custom", "wpn_fps_smg_vityaz", "wpn_fps_ass_flint")
	self:cafcw_add_to_parts("sight", "wpn_fps_smg_vityaz", "wpn_fps_upg_o_1p29", "wpn_fps_upg_o_1p29", "wpn_fps_snp_siltstone")
	self:cafcw_add_to_parts("sight", "wpn_fps_smg_vityaz", "wpn_fps_upg_o_1pn93", "wpn_fps_upg_o_1pn93", "wpn_fps_snp_siltstone")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_smg_vityaz", "wpn_fps_ass_flint")
end
-- APS
if self.wpn_fps_pis_aps then
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_aps", "wpn_fps_ass_ns_g_sup1")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_aps", "wpn_fps_ass_ns_g_sup2")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_aps", "wpn_fps_ass_ns_g_sup6")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_aps", "wpn_fps_upg_fl_unimax", "wpn_fps_pis_aps_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_aps", "wpn_fps_upg_fl_utg_pis", "wpn_fps_pis_aps_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_aps", "wpn_fps_upg_fl_micro90", "wpn_fps_pis_aps_rail")
	self:cafcw_add_modpack("ammo", "wpn_fps_pis_aps", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
end
-- S&W M&P40
if self.wpn_fps_pis_swmp40 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_swmp40", "wpn_fps_upg_fl_unimax")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_swmp40_sight_rail", "wpn_fps_upg_fl_unimax", "a_fl_rail")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_swmp40", "wpn_fps_upg_fl_utg_pis")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_swmp40_sight_rail", "wpn_fps_upg_fl_utg_pis", "a_fl_rail")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_swmp40", "wpn_fps_ass_ns_g_sup1")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_swmp40", "wpn_fps_ass_ns_g_sup1", "a_ns", "barrel")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_swmp40_barrel_ported", "wpn_fps_ass_ns_g_sup1")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_swmp40_barrel_perf_forbids", "wpn_fps_ass_ns_g_sup1")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_swmp40", "wpn_fps_ass_ns_g_sup2")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_swmp40", "wpn_fps_ass_ns_g_sup2", "a_ns", "barrel")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_swmp40_barrel_ported", "wpn_fps_ass_ns_g_sup2")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_swmp40_barrel_perf_forbids", "wpn_fps_ass_ns_g_sup2")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_swmp40", "wpn_fps_ass_ns_g_sup6")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_swmp40", "wpn_fps_ass_ns_g_sup6", "a_ns", "barrel")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_swmp40_barrel_ported", "wpn_fps_ass_ns_g_sup6")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_swmp40_barrel_perf_forbids", "wpn_fps_ass_ns_g_sup6")
	self:cafcw_add_to_parts("sight", "wpn_fps_pis_swmp40", "wpn_fps_upg_o_coyote", "specter", "wpn_fps_pis_swmp40")
	self:cafcw_add_to_parts("forbids", "wpn_fps_pis_swmp40_sights_forbids", "wpn_fps_upg_o_coyote")
	self:cafcw_add_to_parts("sight", "wpn_fps_pis_swmp40", "wpn_fps_upg_o_okp7", "specter", "wpn_fps_pis_swmp40")
	self:cafcw_add_to_parts("forbids", "wpn_fps_pis_swmp40_sights_forbids", "wpn_fps_upg_o_okp7")
	self:cafcw_add_to_parts("sight", "wpn_fps_pis_swmp40", "wpn_fps_upg_o_horzine", "specter", "wpn_fps_pis_swmp40")
	self:cafcw_add_to_parts("forbids", "wpn_fps_pis_swmp40_sights_forbids", "wpn_fps_upg_o_horzine")
	self:cafcw_add_custom_sights("custom_pistol", "wpn_fps_pis_swmp40", "wpn_fps_pis_sparrow", "wpn_fps_pis_swmp40_sight_rear_dummy")
	self:cafcw_add_to_parts("wpn_parent_ovr", "wpn_fps_pis_swmp40", "wpn_fps_upg_o_deltapoint", "slide")
end
-- AP Pistol
if self.wpn_fps_pis_appistol then
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_appistol", "wpn_fps_ass_ns_g_sup1")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_appistol", "wpn_fps_ass_ns_g_sup2")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_appistol", "wpn_fps_ass_ns_g_sup6")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_appistol", "wpn_fps_upg_fl_unimax")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_appistol", "wpn_fps_upg_fl_utg_pis")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_appistol", "wpn_fps_upg_fl_micro90")
end
-- Duke 1911
if self.wpn_fps_pis_duke1911 then
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_duke1911", "wpn_fps_ass_ns_g_sup1")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_duke1911", "wpn_fps_ass_ns_g_sup1", "a_ns", "barrel")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_duke1911", "wpn_fps_ass_ns_g_sup2")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_duke1911", "wpn_fps_ass_ns_g_sup2", "a_ns", "barrel")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_duke1911", "wpn_fps_ass_ns_g_sup6")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_duke1911", "wpn_fps_ass_ns_g_sup6", "a_ns", "barrel")
end
-- Beretta 93R
if self.wpn_fps_pis_b93r then
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_b93r", "wpn_fps_ass_ns_g_sup1")
	self:cafcw_add_to_parts("wpn_parent_ovr", "wpn_fps_pis_b93r", "wpn_fps_ass_ns_g_sup1", "barrel")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_b93r", "wpn_fps_ass_ns_g_sup2")
	self:cafcw_add_to_parts("wpn_parent_ovr", "wpn_fps_pis_b93r", "wpn_fps_ass_ns_g_sup2", "barrel")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_b93r", "wpn_fps_ass_ns_g_sup6")
	self:cafcw_add_to_parts("wpn_parent_ovr", "wpn_fps_pis_b93r", "wpn_fps_ass_ns_g_sup6", "barrel")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_b93r", "wpn_fps_upg_fl_unimax")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_b93r", "wpn_fps_upg_fl_utg_pis")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_b93r", "wpn_fps_upg_fl_micro90")
	self:cafcw_add_modpack("ammo", "wpn_fps_pis_b93r", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_custom_sights("custom_pistol", "wpn_fps_pis_b93r", "wpn_fps_pis_beretta", "wpn_fps_pis_b93r_sight_rmr")
	self:cafcw_add_to_parts("wpn_parent_ovr", "wpn_fps_pis_b93r", "wpn_fps_upg_o_deltapoint", "slide")
end
-- Walther P99
if self.wpn_fps_pis_p99 then
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_p99", "wpn_fps_ass_ns_g_sup1")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_p99", "wpn_fps_ass_ns_g_sup1", "a_ns", "barrel")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_p99", "wpn_fps_ass_ns_g_sup2")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_p99", "wpn_fps_ass_ns_g_sup2", "a_ns", "barrel")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_p99", "wpn_fps_ass_ns_g_sup6")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_p99", "wpn_fps_ass_ns_g_sup6", "a_ns", "barrel")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_p99", "wpn_fps_upg_fl_unimax")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_p99", "wpn_fps_upg_fl_utg_pis")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_p99", "wpn_fps_upg_fl_micro90")
	self:cafcw_add_modpack("ammo", "wpn_fps_pis_p99", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
end
-- HK45C
if self.wpn_fps_pis_hk45c then
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_hk45c", "wpn_fps_ass_ns_g_sup1")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_hk45c", "wpn_fps_ass_ns_g_sup1", "a_ns", "barrel")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_hk45c", "wpn_fps_ass_ns_g_sup2")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_hk45c", "wpn_fps_ass_ns_g_sup2", "a_ns", "barrel")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_hk45c", "wpn_fps_ass_ns_g_sup6")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_hk45c", "wpn_fps_ass_ns_g_sup6", "a_ns", "barrel")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_hk45c", "wpn_fps_upg_fl_unimax")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_hk45c", "wpn_fps_upg_fl_utg_pis")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_hk45c", "wpn_fps_upg_fl_micro90")
	self:cafcw_add_custom_sights("custom_pistol", "wpn_fps_pis_hk45c", "wpn_fps_pis_packrat", "wpn_fps_pis_hk45c_sight_nonstance")
	self:cafcw_add_to_parts("wpn_parent_ovr", "wpn_fps_pis_hk45c", "wpn_fps_upg_o_deltapoint", "slide")
end
-- Steyr AUG A3 9mm XS
if self.wpn_fps_smg_aug9mm then
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_smg_aug9mm", "wpn_fps_upg_fl_ass_spotter", "wpn_fps_smg_aug9mm_gadget_rm55")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_aug9mm_gadgets_leftrail", "wpn_fps_upg_fl_ass_spotter", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_smg_aug9mm", "wpn_fps_upg_fl_wml", "wpn_fps_smg_aug9mm_gadget_rm55")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_aug9mm_gadgets_leftrail", "wpn_fps_upg_fl_wml", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_smg_aug9mm", "wpn_fps_upg_fl_anpeq2", "wpn_fps_smg_aug9mm_gadget_rm55")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_aug9mm_gadgets_leftrail", "wpn_fps_upg_fl_anpeq2", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_smg_aug9mm", "wpn_fps_upg_fl_dbal_d2", "wpn_fps_smg_aug9mm_gadget_rm55")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_aug9mm_gadgets_leftrail", "wpn_fps_upg_fl_dbal_d2", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_smg_aug9mm", "wpn_fps_upg_fl_m600p", "wpn_fps_smg_aug9mm_gadget_rm55")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_aug9mm_gadgets_leftrail", "wpn_fps_upg_fl_m600p", "a_fl_leftrail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_smg_aug9mm", "wpn_fps_upg_fl_utg", "wpn_fps_smg_aug9mm_gadget_rm55")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_aug9mm_gadgets_leftrail", "wpn_fps_upg_fl_utg", "a_fl_leftrail")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_aug9mm", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_smg_aug9mm", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_custom_sights("specter", "wpn_fps_smg_aug9mm", "wpn_fps_ass_aug")
	self:cafcw_add_custom_sights("acog", "wpn_fps_smg_aug9mm", "wpn_fps_ass_aug")
	self:cafcw_add_custom_sights("custom", "wpn_fps_smg_aug9mm", "wpn_fps_ass_aug")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_smg_aug9mm", "wpn_fps_ass_aug")
end
-- Colt Model 933 .300 Blackout
if self.wpn_fps_smg_r0933blk then
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_r0933blk", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_r0933blk_handguard_ddm4", "wpn_fps_upg_fl_ass_spotter", "a_fl_ddm4")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_r0933blk_handguard_kac_urx4", "wpn_fps_upg_fl_ass_spotter", "a_fl_kac_urx4")
	self:cafcw_add_to_parts("stock", "wpn_fps_smg_r0933blk", "wpn_fps_upg_m4_s_caastock")
	self:cafcw_add_to_parts("stock", "wpn_fps_smg_r0933blk", "wpn_fps_upg_m4_s_caastock_black")
	self:cafcw_add_to_parts("stock", "wpn_fps_smg_r0933blk", "wpn_fps_upg_m4_s_hke1")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_r0933blk", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_r0933blk_handguard_ddm4", "wpn_fps_upg_fl_wml", "a_fl_ddm4")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_r0933blk_handguard_kac_urx4", "wpn_fps_upg_fl_wml", "a_fl_kac_urx4")
	self:cafcw_add_to_parts("other", "wpn_fps_smg_r0933blk", "wpn_fps_shield_m4")
	self:cafcw_add_to_parts("other", "wpn_fps_smg_r0933blk", "wpn_fps_shield_skin_ftp")
	self:cafcw_add_to_parts("other", "wpn_fps_smg_r0933blk", "wpn_fps_shield_skin_urban")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_r0933blk", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_r0933blk_handguard_ddm4", "wpn_fps_upg_fl_anpeq2", "a_fl_ddm4")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_r0933blk_handguard_kac_urx4", "wpn_fps_upg_fl_anpeq2", "a_fl_kac_urx4")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_r0933blk", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_r0933blk_handguard_ddm4", "wpn_fps_upg_fl_dbal_d2", "a_fl_ddm4")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_r0933blk_handguard_kac_urx4", "wpn_fps_upg_fl_dbal_d2", "a_fl_kac_urx4")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_r0933blk", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_r0933blk_handguard_ddm4", "wpn_fps_upg_fl_m600p", "a_fl_ddm4")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_r0933blk_handguard_kac_urx4", "wpn_fps_upg_fl_m600p", "a_fl_kac_urx4")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_r0933blk", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_r0933blk_handguard_ddm4", "wpn_fps_upg_fl_utg", "a_fl_ddm4")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_r0933blk_handguard_kac_urx4", "wpn_fps_upg_fl_utg", "a_fl_kac_urx4")
	self:cafcw_add_modpack("stock", "wpn_fps_smg_r0933blk", "Stock_Attachment_Pack")
	self:cafcw_add_custom_sights("specter", "wpn_fps_smg_r0933blk", "wpn_fps_smg_olympic")
	self:cafcw_add_custom_sights("acog", "wpn_fps_smg_r0933blk", "wpn_fps_smg_olympic")
	self:cafcw_add_custom_sights("custom", "wpn_fps_smg_r0933blk", "wpn_fps_smg_olympic")
end
-- SVU
-- Shortdot stance_mod: 0,-22,-1.455
if self.wpn_fps_snp_svu then
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_svu", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_svu", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_svu", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_svu", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_svu", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_svu", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("sight_rail", "wpn_fps_snp_svu", "wpn_fps_upg_o_susat", "wpn_fps_upg_o_susat", "wpn_fps_sho_basset", "wpn_fps_snp_svu_molot")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_svu", "wpn_fps_upg_o_1p29", "-0.2,-9,-1.005", "wpn_fps_snp_svu_sights_folded_rear")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_svu", "wpn_fps_upg_o_1pn93", "-0.2,-9,-1.005", "wpn_fps_snp_svu_sights_folded_rear")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_svu", "wpn_fps_upg_o_ekp_1s_03", "0.41,-10,-0.17", "wpn_fps_snp_svu_sights_folded_rear")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_svu", "wpn_fps_upg_o_okp7_dove", "0.875,-14,0.35", "wpn_fps_snp_svu_sights_folded_rear")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_svu", "wpn_fps_upg_o_1p69", "0,-22,-1.455", "wpn_fps_snp_svu_molot")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_svu", "wpn_fps_upg_o_deltatitanium", "0,-23,-1.455", "wpn_fps_snp_svu_molot")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_svu", "wpn_fps_upg_o_csgoscope", "0,-26,-1.455", "wpn_fps_snp_svu_molot")
	self:cafcw_add_custom_sights("specter", "wpn_fps_snp_svu", "wpn_fps_sho_basset", "wpn_fps_snp_svu_molot")
	self:cafcw_add_custom_sights("acog", "wpn_fps_snp_svu", "wpn_fps_sho_basset", "wpn_fps_snp_svu_molot")
	self:cafcw_add_custom_sights("custom", "wpn_fps_snp_svu", "wpn_fps_sho_basset", "wpn_fps_snp_svu_molot")
	self:cafcw_add_custom_sights("shortdot", "wpn_fps_snp_svu", "wpn_fps_snp_svu", "wpn_fps_snp_svu_molot")
	self:cafcw_add_modpack("ammo", "wpn_fps_snp_svu", "_762x54mmr", "MoreAmmoTypes")
end
-- Mauser M712 Schnellfeuer
if self.wpn_fps_pis_m712 then
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_m712", "wpn_fps_ass_ns_g_sup1")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_m712", "wpn_fps_ass_ns_g_sup1", "a_ns", "barrel")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_m712", "wpn_fps_ass_ns_g_sup2")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_m712", "wpn_fps_ass_ns_g_sup2", "a_ns", "barrel")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_m712", "wpn_fps_ass_ns_g_sup6")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_m712", "wpn_fps_ass_ns_g_sup6", "a_ns", "barrel")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_m712", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_m712", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_m712", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_m712", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_m712", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_m712", "wpn_fps_upg_fl_utg")
end
-- Beretta Px4 Storm
if self.wpn_fps_pis_px4 then
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_px4", "wpn_fps_ass_ns_g_sup1")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_px4", "wpn_fps_ass_ns_g_sup1", "a_ns", "barrel")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_px4", "wpn_fps_ass_ns_g_sup2")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_px4", "wpn_fps_ass_ns_g_sup2", "a_ns", "barrel")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_px4", "wpn_fps_ass_ns_g_sup6")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_px4", "wpn_fps_ass_ns_g_sup6", "a_ns", "barrel")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_px4", "wpn_fps_upg_fl_unimax")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_px4", "wpn_fps_upg_fl_utg_pis")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_px4", "wpn_fps_upg_fl_micro90")
	self:cafcw_add_custom_sights("custom_pistol", "wpn_fps_pis_px4", "wpn_fps_pis_sparrow", "wpn_fps_pis_px4_sight_rmr")
	self:cafcw_add_to_parts("wpn_parent_ovr", "wpn_fps_pis_px4", "wpn_fps_upg_o_deltapoint", "slide")
end
-- PPS-43
if self.wpn_fps_smg_pps43 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_pps43", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_pps43", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_pps43", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_pps43", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_pps43", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_pps43", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_smg_pps43", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_custom_sights("specter", "wpn_fps_smg_pps43", "wpn_fps_smg_m45", "wpn_fps_smg_pps43_rail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_smg_pps43", "wpn_fps_smg_m45", "wpn_fps_smg_pps43_rail")
	self:cafcw_add_custom_sights("custom", "wpn_fps_smg_pps43", "wpn_fps_smg_m45", "wpn_fps_smg_pps43_rail")
end
-- Chiappa Rhino 60DS
if self.wpn_fps_pis_rhino then
	self:cafcw_add_to_parts("sight", "wpn_fps_pis_rhino", "wpn_fps_upg_o_compm4s", "specter", "wpn_fps_pis_rhino")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_pis_rhino", "wpn_fps_upg_o_compm4s", "a_o_aimpoint")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_rhino_frame_200ds", "wpn_fps_upg_o_compm4s")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_rhino_frame_200ds_chrome", "wpn_fps_upg_o_compm4s")
	self:cafcw_add_to_parts("sight", "wpn_fps_pis_rhino", "wpn_fps_upg_o_okp7", "specter", "wpn_fps_pis_rhino")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_pis_rhino", "wpn_fps_upg_o_okp7", "a_o_aimpoint")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_rhino_frame_200ds", "wpn_fps_upg_o_okp7")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_rhino_frame_200ds_chrome", "wpn_fps_upg_o_okp7")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_rhino", "wpn_fps_upg_fl_wml", "wpn_fps_pis_rhino_gadget_rail")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_pis_rhino", "wpn_fps_upg_fl_wml", "a_fl_alt")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rhino_frame_200ds", "wpn_fps_upg_fl_wml", "a_fl_alt_200ds")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rhino_frame_200ds_chrome", "wpn_fps_upg_fl_wml", "a_fl_alt_200ds")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_rhino", "wpn_fps_upg_fl_unimax", "wpn_fps_pis_rhino_gadget_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rhino_frame_200ds", "wpn_fps_upg_fl_unimax", "a_fl_200ds")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rhino_frame_200ds_chrome", "wpn_fps_upg_fl_unimax", "a_fl_200ds")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_rhino", "wpn_fps_upg_fl_utg_pis", "wpn_fps_pis_rhino_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_rhino", "wpn_fps_upg_fl_micro90", "wpn_fps_pis_rhino_gadget_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rhino_frame_200ds", "wpn_fps_upg_fl_wml", "a_fl_200ds")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rhino_frame_200ds_chrome", "wpn_fps_upg_fl_wml", "a_fl_200ds")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_rhino", "wpn_fps_upg_fl_anpeq2", "wpn_fps_pis_rhino_gadget_rail")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_pis_rhino", "wpn_fps_upg_fl_anpeq2", "a_fl_alt")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rhino_frame_200ds", "wpn_fps_upg_fl_anpeq2", "a_fl_alt_200ds")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rhino_frame_200ds_chrome", "wpn_fps_upg_fl_anpeq2", "a_fl_alt_200ds")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_rhino", "wpn_fps_upg_fl_dbal_d2", "wpn_fps_pis_rhino_gadget_rail")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_pis_rhino", "wpn_fps_upg_fl_dbal_d2", "a_fl_alt")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rhino_frame_200ds", "wpn_fps_upg_fl_dbal_d2", "a_fl_alt_200ds")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rhino_frame_200ds_chrome", "wpn_fps_upg_fl_dbal_d2", "a_fl_alt_200ds")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_rhino", "wpn_fps_upg_fl_m600p", "wpn_fps_pis_rhino_gadget_rail")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_pis_rhino", "wpn_fps_upg_fl_m600p", "a_fl_alt")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rhino_frame_200ds", "wpn_fps_upg_fl_m600p", "a_fl_alt_200ds")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_rhino_frame_200ds_chrome", "wpn_fps_upg_fl_m600p", "a_fl_alt_200ds")
end
-- Mateba Model 6 Unica
if self.wpn_fps_pis_unica6 then
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_unica6", "wpn_fps_upg_fl_wml", "wpn_fps_pis_unica6_gadget_rail")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_pis_unica6", "wpn_fps_upg_fl_wml", "a_fl_alt")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_unica6", "wpn_fps_upg_fl_unimax", "wpn_fps_pis_unica6_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_unica6", "wpn_fps_upg_fl_utg_pis", "wpn_fps_pis_unica6_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_unica6", "wpn_fps_upg_fl_micro90", "wpn_fps_pis_unica6_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_unica6", "wpn_fps_upg_fl_anpeq2", "wpn_fps_pis_unica6_gadget_rail")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_pis_unica6", "wpn_fps_upg_fl_anpeq2", "a_fl_alt")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_unica6", "wpn_fps_upg_fl_dbal_d2", "wpn_fps_pis_unica6_gadget_rail")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_pis_unica6", "wpn_fps_upg_fl_dbal_d2", "a_fl_alt")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_unica6", "wpn_fps_upg_fl_m600p", "wpn_fps_pis_unica6_gadget_rail")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_pis_unica6", "wpn_fps_upg_fl_m600p", "a_fl_alt")
	self:cafcw_add_custom_sights("specter", "wpn_fps_pis_unica6", "wpn_fps_pis_rage", "wpn_fps_pis_unica6_sight_rail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_pis_unica6", "wpn_fps_pis_rage", "wpn_fps_pis_unica6_sight_rail")
	self:cafcw_add_custom_sights("custom", "wpn_fps_pis_unica6", "wpn_fps_pis_rage", "wpn_fps_pis_unica6_sight_rail")
end
-- HX25 Handheld Grenade Launcher
if self.wpn_fps_gre_hx25 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_gre_hx25", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_gre_hx25", "wpn_fps_upg_fl_wml", "a_fl_alt")
	self:cafcw_add_to_parts("gadget", "wpn_fps_gre_hx25", "wpn_fps_upg_fl_unimax")
	self:cafcw_add_to_parts("gadget", "wpn_fps_gre_hx25", "wpn_fps_upg_fl_utg_pis")
	self:cafcw_add_to_parts("gadget", "wpn_fps_gre_hx25", "wpn_fps_upg_fl_micro90")
	self:cafcw_add_to_parts("gadget", "wpn_fps_gre_hx25", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_gre_hx25", "wpn_fps_upg_fl_anpeq2", "a_fl_alt")
	self:cafcw_add_to_parts("gadget", "wpn_fps_gre_hx25", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_gre_hx25", "wpn_fps_upg_fl_dbal_d2", "a_fl_alt")
	self:cafcw_add_to_parts("gadget", "wpn_fps_gre_hx25", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_gre_hx25", "wpn_fps_upg_fl_m600p", "a_fl_alt")
end
-- Zenith 10mm
if self.wpn_fps_pis_zenith then
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_zenith", "wpn_fps_ass_ns_g_sup1")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_zenith", "wpn_fps_ass_ns_g_sup1", "a_ns", "barrel")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_zenith", "wpn_fps_ass_ns_g_sup2")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_zenith", "wpn_fps_ass_ns_g_sup2", "a_ns", "barrel")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_zenith", "wpn_fps_ass_ns_g_sup6")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_zenith", "wpn_fps_ass_ns_g_sup6", "a_ns", "barrel")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_zenith", "wpn_fps_upg_fl_unimax")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_zenith", "wpn_fps_upg_fl_utg_pis")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_zenith", "wpn_fps_upg_fl_micro90")
end
-- Lahti L-35
if self.wpn_fps_pis_l35 then
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_l35", "wpn_fps_upg_fl_unimax", "wpn_fps_pis_l35_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_l35", "wpn_fps_upg_fl_utg_pis", "wpn_fps_pis_l35_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_l35", "wpn_fps_upg_fl_micro90", "wpn_fps_pis_l35_gadget_rail")
end
-- KS-23
if self.wpn_fps_shot_ks23 then
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_ks23", "wpn_fps_upg_fl_ass_spotter", "wpn_fps_shot_ks23_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_ks23", "wpn_fps_upg_fl_wml", "wpn_fps_shot_ks23_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_ks23", "wpn_fps_upg_fl_anpeq2", "wpn_fps_shot_ks23_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_ks23", "wpn_fps_upg_fl_dbal_d2", "wpn_fps_shot_ks23_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_ks23", "wpn_fps_upg_fl_m600p", "wpn_fps_shot_ks23_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_ks23", "wpn_fps_upg_fl_utg", "wpn_fps_shot_ks23_gadget_rail")
	self:cafcw_add_custom_sights("specter", "wpn_fps_shot_ks23", "wpn_fps_shot_ks23", "wpn_fps_shot_ks23_sight_rail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_shot_ks23", "wpn_fps_shot_ks23", "wpn_fps_shot_ks23_sight_rail")
-- todo custom sights with custom stance_mod
end
-- Widowmaker TX
if self.wpn_fps_shot_wmtx then
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_wmtx", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_wmtx", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_wmtx", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_wmtx", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_wmtx", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_wmtx", "wpn_fps_upg_fl_utg")
	self:cafcw_add_custom_sights("specter", "wpn_fps_shot_wmtx", "wpn_fps_smg_coal")
	self:cafcw_add_custom_sights("acog", "wpn_fps_shot_wmtx", "wpn_fps_smg_coal")
	self:cafcw_add_custom_sights("custom", "wpn_fps_shot_wmtx", "wpn_fps_smg_coal")
end
-- S&W Model 327 R8
if self.wpn_fps_pis_sw327r8 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_sw327r8", "wpn_fps_upg_fl_unimax")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_sw327r8", "wpn_fps_upg_fl_utg_pis")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_sw327r8", "wpn_fps_upg_fl_micro90")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_pis_sw327r8", "wpn_fps_upg_o_susat", "-0.028,4,-5,305")
-- todo custom sights with custom stance_mod
	self:cafcw_add_custom_sights("specter", "wpn_fps_pis_sw327r8", "wpn_fps_pis_sw327r8")
	self:cafcw_add_custom_sights("acog", "wpn_fps_pis_sw327r8", "wpn_fps_pis_sw327r8")
end
-- TOZ-66
if self.wpn_fps_shot_toz66 then
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_toz66", "wpn_fps_upg_fl_ass_spotter", "wpn_fps_shot_toz66_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_toz66", "wpn_fps_upg_fl_wml", "wpn_fps_shot_toz66_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_toz66", "wpn_fps_upg_fl_anpeq2", "wpn_fps_shot_toz66_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_toz66", "wpn_fps_upg_fl_dbal_d2", "wpn_fps_shot_toz66_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_toz66", "wpn_fps_upg_fl_m600p", "wpn_fps_shot_toz66_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_toz66", "wpn_fps_upg_fl_utg", "wpn_fps_shot_toz66_gadget_rail")
	self:cafcw_add_custom_sights("specter", "wpn_fps_shot_toz66", "wpn_fps_shot_toz66", "wpn_fps_shot_toz66_sight_rail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_shot_toz66", "wpn_fps_shot_toz66", "wpn_fps_shot_toz66_sight_rail")
-- todo custom sights with custom stance_mod
end
-- Kel-Tec PLR-16
if self.wpn_fps_pis_plr16 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_plr16", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_pis_plr16_handguard_dummy", "wpn_fps_upg_fl_ass_spotter", "a_fl_alt")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_plr16", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_pis_plr16_handguard_dummy", "wpn_fps_upg_fl_wml", "a_fl_alt")
	self:cafcw_add_to_parts("other", "wpn_fps_pis_plr16", "wpn_fps_shield_m4")
	self:cafcw_add_to_parts("other", "wpn_fps_pis_plr16", "wpn_fps_shield_skin_ftp")
	self:cafcw_add_to_parts("other", "wpn_fps_pis_plr16", "wpn_fps_shield_skin_urban")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_plr16", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_pis_plr16_handguard_dummy", "wpn_fps_upg_fl_anpeq2", "a_fl_alt")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_plr16", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_pis_plr16_handguard_dummy", "wpn_fps_upg_fl_dbal_d2", "a_fl_alt")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_plr16", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_pis_plr16_handguard_dummy", "wpn_fps_upg_fl_m600p", "a_fl_alt")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pis_plr16", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_pis_plr16_handguard_dummy", "wpn_fps_upg_fl_utg", "a_fl_alt")
	self:cafcw_add_to_parts("stock", "wpn_fps_pis_plr16", "wpn_fps_upg_m4_s_caastock")
	self:cafcw_add_to_parts("stock", "wpn_fps_pis_plr16", "wpn_fps_upg_m4_s_caastock_black")
	self:cafcw_add_to_parts("stock", "wpn_fps_pis_plr16", "wpn_fps_upg_m4_s_hke1")
	self:cafcw_add_modpack("stock", "wpn_fps_pis_plr16", "Stock_Attachment_Pack")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_pis_plr16", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_custom_sights("specter", "wpn_fps_pis_plr16", "wpn_fps_smg_olympic")
	self:cafcw_add_custom_sights("acog", "wpn_fps_pis_plr16", "wpn_fps_smg_olympic")
	self:cafcw_add_custom_sights("custom", "wpn_fps_pis_plr16", "wpn_fps_smg_olympic")
end
-- Colt 9mm Submachine Gun (Secondary)
if self.wpn_fps_smg_coltsmg then
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_coltsmg", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_coltsmg", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_smg_coltsmg", "wpn_fps_upg_o_delta_rm55", "a_o_45")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_coltsmg", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_coltsmg", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_coltsmg", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_coltsmg", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_coltsmg", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_r0991_barrel_supp", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("ammo", "wpn_fps_smg_coltsmg", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("stock", "wpn_fps_smg_coltsmg", "AR15_StockPack")
	self:cafcw_add_modpack("stock", "wpn_fps_smg_coltsmg", "Stock_Attachment_Pack")
	self:cafcw_add_custom_sights("specter", "wpn_fps_smg_coltsmg", "wpn_fps_ass_m4")
	self:cafcw_add_custom_sights("acog", "wpn_fps_smg_coltsmg", "wpn_fps_ass_m4")
	self:cafcw_add_custom_sights("custom", "wpn_fps_smg_coltsmg", "wpn_fps_ass_m4")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_smg_coltsmg", "wpn_fps_smg_coltsmg")
end
-- Mosin Nagant M9130 Obrez
if self.wpn_fps_snp_obrez then
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_obrez", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_snp_obrez_rearsight", "wpn_fps_upg_fl_wml", "a_fl_b")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_obrez", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_snp_obrez_rearsight", "wpn_fps_upg_fl_anpeq2", "a_fl_b")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_obrez", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_snp_obrez_rearsight", "wpn_fps_upg_fl_dbal_d2", "a_fl_b")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_obrez", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_snp_obrez_rearsight", "wpn_fps_upg_fl_m600p", "a_fl_b")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_obrez", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_snp_obrez_rearsight", "wpn_fps_upg_fl_utg", "a_fl_b")
	self:cafcw_add_custom_sights("specter", "wpn_fps_snp_obrez", "wpn_fps_snp_mosin", "wpn_fps_snp_obrez_sightrail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_snp_obrez", "wpn_fps_snp_mosin", "wpn_fps_snp_obrez_sightrail")
	self:cafcw_add_custom_sights("custom_obrez", "wpn_fps_snp_obrez", "wpn_fps_snp_mosin", "wpn_fps_snp_obrez_sightrail")
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_snp_obrez", "wpn_fps_snp_mosin_pu_scope", "-0.001,-14,-4.61", "wpn_fps_snp_obrez_rearsight_dummy")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_snp_obrez", "wpn_fps_snp_mosin_pu_scope", "a_o_pu")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_snp_obrez", "wpn_fps_snp_mosin_iron_sight_switch", "0,-25,-0.2")
	self:cafcw_add_modpack("ammo", "wpn_fps_snp_obrez", "_762x54mmr", "MoreAmmoTypes")
end
-- CBRPS SKS Pug
if self.wpn_fps_ass_skspug then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_skspug", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_skspug", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_skspug", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_skspug", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_skspug", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_skspug", "wpn_fps_upg_fl_utg")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_skspug", "_762x39mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_skspug", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_skspug", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_skspug", "wpn_fps_sho_basset")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_skspug", "wpn_fps_sho_basset")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_skspug", "wpn_fps_sho_basset")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_skspug", "wpn_fps_upg_o_var_kac_rear", "wpn_fps_upg_o_var_kac_rear", "wpn_fps_sho_basset")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_skspug", "wpn_fps_upg_o_var_m4flipup_rear", "wpn_fps_upg_o_var_m4flipup_rear", "wpn_fps_sho_basset")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_skspug", "wpn_fps_upg_o_var_mbus_rear", "wpn_fps_upg_o_var_mbus_rear", "wpn_fps_sho_basset")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_skspug", "wpn_fps_upg_o_var_scorpionevo_rear", "wpn_fps_upg_o_var_scorpionevo_rear", "wpn_fps_sho_basset")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_skspug", "wpn_fps_upg_o_var_troy_rear", "wpn_fps_upg_o_var_troy_rear", "wpn_fps_sho_basset")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_skspug", "wpn_fps_upg_o_var_troym4_rear", "wpn_fps_upg_o_var_troym4_rear", "wpn_fps_sho_basset")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_skspug_handguard_short", "wpn_fps_upg_o_var_kac_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_skspug_handguard_short", "wpn_fps_upg_o_var_m4flipup_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_skspug_handguard_short", "wpn_fps_upg_o_var_mbus_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_skspug_handguard_short", "wpn_fps_upg_o_var_scorpionevo_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_skspug_handguard_short", "wpn_fps_upg_o_var_troy_front", "a_of_short")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_skspug_handguard_short", "wpn_fps_upg_o_var_troym4_front", "a_of_short")
end
-- Attachments
--
-- Trijicon ACOG TA31F-RMR Scope
if self.parts.wpn_fps_upg_o_acog_rmr and self.parts.wpn_fps_upg_o_acog_rmr_switch then
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_ak12", "wpn_fps_ass_flint")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_snp_m40a5", "wpn_fps_snp_model70")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_snp_l115", "wpn_fps_snp_msr")
	self:cafcw_acogrmr_stance("ta31f_vector", "wpn_fps_ass_sr3m", "0,10,-10.58")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_fd338", "wpn_fps_ass_fal")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_g36k", "wpn_fps_ass_g36")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_sks", "wpn_fps_snp_siltstone")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_f2000", "wpn_fps_ass_vhs")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_shot_ak12_76", "wpn_fps_ass_flint")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_snp_sv98", "wpn_fps_snp_msr")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_aku94", "wpn_fps_ass_l85a2")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_rk62", "wpn_fps_ass_akm")
	self:cafcw_acogrmr_stance("ta31f_vector", "wpn_fps_snp_vss", "0,10,-10.58")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_r0991", "wpn_fps_ass_m4")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_vz58", "wpn_fps_ass_akm")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_snp_sr25", "wpn_fps_ass_m16")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_sho_usas12", "wpn_fps_sho_aa12")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_ots_14_4a", "wpn_fps_ass_l85a2")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_snp_tac50", "wpn_fps_snp_msr")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_snp_fyjs", "wpn_fps_snp_msr")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_ar160", "wpn_fps_ass_amcar")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_scar_m203", "wpn_fps_ass_contraband")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_xm8", "wpn_fps_ass_g36")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_howa", "wpn_fps_ass_galil")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_galilace", "wpn_fps_smg_hajk")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_galilace_762", "wpn_fps_smg_hajk")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_shot_mp153", "wpn_fps_sho_ben")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_shot_toz194", "wpn_fps_shot_r870")
if self.wpn_fps_ass_aek971 then
	self.parts.wpn_fps_upg_o_acog_rmr_switch.stance_mod.wpn_fps_ass_aek971 = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_acog_rmr_switch.stance_mod.wpn_fps_ass_74)
end
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_a545", "wpn_fps_ass_galil")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_smg_pdr", "wpn_fps_ass_aug")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_hcar", "wpn_fps_ass_fal")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_hk416", "wpn_fps_ass_m4")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_snp_svd", "wpn_fps_snp_siltstone")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_snp_m200", "wpn_fps_snp_msr")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_obr7", "wpn_fps_snp_tti")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_scarl", "wpn_fps_ass_m4")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_snp_hecate", "wpn_fps_snp_msr")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_snp_qbu88", "wpn_fps_snp_wa2000")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_qbz95", "wpn_fps_ass_famas")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_shot_m590", "wpn_fps_shot_m37")
if self.wpn_fps_snp_xm21 then
	self.parts.wpn_fps_upg_o_acog_rmr_switch.stance_mod.wpn_fps_snp_xm21 = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_acog_rmr_switch.stance_mod.wpn_fps_ass_m14)
end
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_snp_type38", "wpn_fps_snp_mosin")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_x95", "wpn_fps_ass_aug")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_k2", "wpn_fps_ass_aug")
if self.wpn_fps_ass_mini14 then
	self.parts.wpn_fps_upg_o_acog_rmr_switch.stance_mod.wpn_fps_ass_mini14 = deep_clone(self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_acog_rmr_switch.stance_mod.wpn_fps_ass_m14)
end
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_m27gear", "wpn_fps_ass_m4")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_shot_vepr12", "wpn_fps_ass_flint")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_svt40", "wpn_fps_snp_siltstone")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_smg_mpx", "wpn_fps_smg_olympic")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_smg_ppsh", "wpn_fps_smg_m45")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_smg_ump", "wpn_fps_smg_mp5")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_smg_cbjms", "wpn_fps_smg_mp9")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_smg_vityaz", "wpn_fps_ass_flint")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_smg_msmc", "wpn_fps_smg_mp7")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_smg_storm", "wpn_fps_smg_mp7")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_smg_pdr", "wpn_fps_ass_aug")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_smg_spectre_m4", "wpn_fps_smg_tec9")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_smg_k1a7", "wpn_fps_snp_model70")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_smg_mp40", "wpn_fps_smg_m45")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_shot_prison", "wpn_fps_sho_spas12")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_stg44", "wpn_fps_ass_fal")
if self.wpn_fps_ass_qbz3 then
	self.parts.wpn_fps_upg_o_acog_rmr_switch.stance_mod.wpn_fps_ass_qbz3 = deep_clone(self.parts.wpn_fps_upg_o_ak_scopemount.override.wpn_fps_upg_o_acog_rmr_switch.stance_mod.wpn_fps_ass_74)
end
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_shot_f500", "wpn_fps_shot_r870")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_shot_qbs", "wpn_fps_sho_ben")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_smg_js2", "wpn_fps_ass_aug")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_snp_cs5", "wpn_fps_snp_msr")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_snp_lynx", "wpn_fps_snp_m95")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_snp_svu", "wpn_fps_sho_basset")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_mdr", "wpn_fps_ass_aug")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_shot_pa8", "wpn_fps_shot_r870")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_snp_kar98k", "wpn_fps_snp_mosin")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_smg_tm1a1", "wpn_fps_smg_tec9")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_smg_aug9mm", "wpn_fps_ass_aug")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_smg_r0933blk", "wpn_fps_smg_olympic")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_bow_auto", "wpn_fps_smg_coal")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_sg510", "wpn_fps_ass_galil")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_fnar", "wpn_fps_snp_siltstone")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_snp_mk12", "wpn_fps_ass_m4")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_smg_m3", "wpn_fps_smg_m45")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_sar21", "wpn_fps_ass_corgi")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_snp_k31", "wpn_fps_snp_r93")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_smg_pps43", "wpn_fps_smg_m45")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_shot_spas15", "wpn_fps_ass_g36")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_snp_spring", "wpn_fps_snp_model70")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_snp_classic", "wpn_fps_snp_msr")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_snp_g43", "wpn_fps_ass_fal")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_shot_m1216", "wpn_fps_smg_coal")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_smg_calico", "wpn_fps_smg_p90")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_fusil", "wpn_fps_ass_corgi")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_pis_unica6", "wpn_fps_pis_rage")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_ash", "wpn_fps_ass_famas")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_o_acog_rmr", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_shot_wmtx", "wpn_fps_smg_coal")
if self.wpn_fps_shot_ks23 then
	self.parts.wpn_fps_upg_o_acog_rmr_switch.stance_mod.wpn_fps_shot_ks23 = {translation = Vector3(-0.006, -1, -3.31),rotation = Rotation(0, -2, 0)}
end
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_ar18", "wpn_fps_ass_ak5")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_m4_beowulf", "wpn_fps_ass_m4")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_ar60mrks", "wpn_fps_ass_fal")
	self:cafcw_acogrmr_stance("ta31f_vector", "wpn_fps_pis_sw327r8", "-0.028,13,-3.55")
	self:cafcw_acogrmr_stance("ta31f_vector", "wpn_fps_shot_toz34", "0,-6,-7.425")
	self:cafcw_acogrmr_stance("ta31f_vector", "wpn_fps_shot_toz66", "0,0,0")
	self:cafcw_acogrmr_stance("ta31f_vector", "wpn_fps_snp_merkel", "0,-8,-8.425")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_pis_plr16", "wpn_fps_smg_olympic")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_smg_coltsmg", "wpn_fps_ass_m4")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_g3m203", "wpn_fps_ass_g3")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_heffy_762", "wpn_fps_ass_flint")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_heffy_545", "wpn_fps_ass_flint")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_heffy_556", "wpn_fps_ass_flint")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_snp_psg1", "wpn_fps_ass_g3")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_snp_obrez", "wpn_fps_snp_mosin")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_snp_amr2", "wpn_fps_snp_msr")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_ass_skspug", "wpn_fps_sho_basset")
	self:cafcw_acogrmr_stance("ta31f", "wpn_fps_shot_sjogren", "wpn_fps_sho_ben")
end
-- Trijicon ACOG TA648RMR Scope
if self.parts.wpn_fps_upg_o_ta648rmr and self.parts.wpn_fps_upg_o_ta648rmr_switch then
	self:cafcw_acogrmr_stance("ta648", "wpn_fps_snp_m40a5", "wpn_fps_snp_model70")
	self:cafcw_acogrmr_stance("ta648", "wpn_fps_snp_l115", "wpn_fps_snp_msr")
	self:cafcw_acogrmr_stance("ta648", "wpn_fps_snp_sv98", "wpn_fps_snp_msr")
	self:cafcw_acogrmr_stance("ta648_vector", "wpn_fps_snp_sr25", "0.079,2,-7.645")
	self:cafcw_acogrmr_stance("ta648", "wpn_fps_snp_tac50", "wpn_fps_snp_msr")
	self:cafcw_acogrmr_stance("ta648", "wpn_fps_snp_fyjs", "wpn_fps_snp_msr")
	self:cafcw_acogrmr_stance("ta648", "wpn_fps_snp_svd", "wpn_fps_snp_siltstone")
	self:cafcw_acogrmr_stance("ta648", "wpn_fps_snp_m200", "wpn_fps_snp_msr")
	self:cafcw_acogrmr_stance("ta648", "wpn_fps_ass_obr7", "wpn_fps_snp_tti")
	self:cafcw_acogrmr_stance("ta648", "wpn_fps_snp_hecate", "wpn_fps_snp_msr")
	self:cafcw_acogrmr_stance("ta648", "wpn_fps_snp_qbu88", "wpn_fps_snp_wa2000")
	self:cafcw_acogrmr_stance("ta648_vector", "wpn_fps_snp_xm21", "0.059,-2,-12.755")
	self:cafcw_acogrmr_stance("ta648", "wpn_fps_snp_type38", "wpn_fps_snp_mosin")
	self:cafcw_acogrmr_stance("ta648", "wpn_fps_snp_cs5", "wpn_fps_snp_msr")
	self:cafcw_acogrmr_stance("ta648", "wpn_fps_snp_lynx", "wpn_fps_snp_m95")
	self:cafcw_acogrmr_stance("ta648_vector", "wpn_fps_snp_svu", "0.08,1,-8.245")
	self:cafcw_acogrmr_stance("ta648", "wpn_fps_ass_fnar", "wpn_fps_snp_siltstone")
	self:cafcw_acogrmr_stance("ta648_vector", "wpn_fps_snp_mk12", "0.079,4,-8.095")
	self:cafcw_acogrmr_stance("ta648", "wpn_fps_snp_k31", "wpn_fps_snp_r93")
	self:cafcw_acogrmr_stance("ta648", "wpn_fps_snp_spring", "wpn_fps_snp_model70")
	self:cafcw_acogrmr_stance("ta648", "wpn_fps_snp_classic", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_o_ta648rmr", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_acogrmr_stance("ta648_vector", "wpn_fps_snp_vss", "0.078,10,-14.03")
	self:cafcw_acogrmr_stance("ta648_vector", "wpn_fps_ass_fd338", "0.078,2,-11.07")
	self:cafcw_acogrmr_stance("ta648", "wpn_fps_snp_obrez", "wpn_fps_snp_mosin")
	self:cafcw_acogrmr_stance("ta648", "wpn_fps_snp_amr2", "wpn_fps_snp_msr")
end
-- AK Rail Cover
if self.parts.wpn_fps_upg_o_ak_coverrail then
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_kobra", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_compm4s", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_m145", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_pkas", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_coyote", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_acog_rmr", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_hologram", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_gitsch", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_zeiss", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_okp7", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_hd33", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_prismatic", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_srs", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_st10", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_hcog", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_reflexholo", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_aog", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_rmr_riser", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_elo", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_po4", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_susat", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_kemper", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_mepro", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_rusak", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_horzine", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_eotech552", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_visionking", "a_o_coverrail")
	self:cafcw_add_to_parts("part_copy_part_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_delta_rm55", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_45rds")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_pka", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_anpas13d", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_ak_coverrail", "wpn_fps_upg_o_compm2", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_kobra", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_compm4s", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_m145", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_pkas", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_coyote", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_acog_rmr", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_hologram", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_gitsch", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_zeiss", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_okp7", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_hd33", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_prismatic", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_srs", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_st10", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_hcog", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_reflexholo", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_aog", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_rmr_riser", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_elo", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_po4", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_susat", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_kemper", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_mepro", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_rusak", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_horzine", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_eotech552", "a_o_coverrail")
	self:cafcw_add_to_parts("part_copy_part_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_delta_rm55", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_45rds")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_visionking", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_pka", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_anpas13d", "a_o_coverrail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_asval_coverrail", "wpn_fps_upg_o_compm2", "a_o_coverrail")
end
-- Luger P08 Gadgets
if self.parts.wpn_fps_pis_breech_gadget_rail then
    self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_breech", "wpn_fps_upg_fl_unimax", "wpn_fps_pis_breech_gadget_rail")
    self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_breech", "wpn_fps_upg_fl_utg_pis", "wpn_fps_pis_breech_gadget_rail")
    self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_breech", "wpn_fps_upg_fl_micro90", "wpn_fps_pis_breech_gadget_rail")
    self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_x_breech", "wpn_fps_upg_fl_unimax", "wpn_fps_pis_breech_gadget_rail")
    self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_x_breech", "wpn_fps_upg_fl_utg_pis", "wpn_fps_pis_breech_gadget_rail")
    self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_x_breech", "wpn_fps_upg_fl_micro90", "wpn_fps_pis_breech_gadget_rail")
end
-- PU Scope
if self.parts.wpn_fps_snp_mosin_iron_sight_switch then
	self:cafcw_add_to_parts("forbids", "wpn_fps_snp_mosin_iron_sight_switch", "wpn_fps_upg_o_delta_rm55")
	self:cafcw_add_to_parts("forbids", "wpn_fps_snp_mosin_iron_sight_switch", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("forbids", "wpn_fps_snp_mosin_iron_sight_switch", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("forbids", "wpn_fps_snp_mosin_iron_sight_switch", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("forbids", "wpn_fps_snp_mosin_iron_sight_switch", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("forbids", "wpn_fps_snp_mosin_iron_sight_switch", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("forbids", "wpn_fps_snp_mosin_iron_sight_switch", "wpn_fps_upg_fl_utg")
end
end)