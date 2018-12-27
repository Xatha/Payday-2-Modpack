Hooks:PostHook(WeaponFactoryTweakData, "create_bonuses", "CAFCWMod_Ellie_Init", function(self)
--FY-JS
if self.wpn_fps_snp_fyjs then
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_fyjs", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_fyjs", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_fyjs", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_fyjs", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_fyjs", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_fyjs", "wpn_fps_upg_fl_utg")
	self:cafcw_add_custom_sights("specter", "wpn_fps_snp_fyjs", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("acog", "wpn_fps_snp_fyjs", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("custom", "wpn_fps_snp_fyjs", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("custom_sniper", "wpn_fps_snp_fyjs", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("shortdot", "wpn_fps_snp_fyjs", "wpn_fps_snp_msr")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_snp_fyjs", "wpn_fps_snp_msr")
-- Update v1.68.199
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_fyjs", "wpn_fps_upg_o_xpsg33_magnifier", "wpn_fps_upg_o_xpsg33_magnifier", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("sight", "wpn_fps_snp_fyjs", "wpn_fps_upg_o_45rds_v2", "wpn_fps_upg_o_45rds_v2", "wpn_fps_snp_msr")
	self:cafcw_add_modpack("ammo", "wpn_fps_snp_fyjs", "_762x54mmr", "MoreAmmoTypes")
end
--ARX-160
if self.wpn_fps_ass_ar160 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ar160", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ar160", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ar160", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ar160", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ar160", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ar160", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_ar160", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_ar160", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_ar160", "wpn_fps_ass_amcar")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_ar160", "wpn_fps_ass_amcar")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_ar160", "wpn_fps_ass_amcar")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_ar160", "wpn_fps_ass_amcar")
	-- Update v1.68.199
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_ar160", "wpn_fps_upg_o_xpsg33_magnifier", "wpn_fps_upg_o_xpsg33_magnifier", "wpn_fps_ass_amcar")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_ar160", "wpn_fps_upg_o_45rds_v2", "wpn_fps_upg_o_45rds_v2", "wpn_fps_ass_amcar")
end
end)