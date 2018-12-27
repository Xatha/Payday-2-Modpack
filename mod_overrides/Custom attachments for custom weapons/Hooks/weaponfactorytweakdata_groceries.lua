Hooks:PostHook(WeaponFactoryTweakData, "create_bonuses", "CAFCWMod_Groceries_Init", function(self)
--Primary

-- AN-92
if self.wpn_fps_ass_tilt then
	self:cafcw_add_to_parts("attach_adds", "wpn_fps_ass_tilt", "wpn_fps_upg_o_kobra", "wpn_fps_upg_o_tilt_scopemount")
	self:cafcw_add_to_parts("attach_adds", "wpn_fps_ass_tilt", "wpn_fps_upg_o_compm4s", "wpn_fps_upg_o_tilt_scopemount")
	self:cafcw_add_to_parts("attach_adds", "wpn_fps_ass_tilt", "wpn_fps_upg_o_m145", "wpn_fps_upg_o_tilt_scopemount")
	self:cafcw_add_to_parts("attach_adds", "wpn_fps_ass_tilt", "wpn_fps_upg_o_pkas", "wpn_fps_upg_o_tilt_scopemount")
	self:cafcw_add_to_parts("attach_adds", "wpn_fps_ass_tilt", "wpn_fps_upg_o_coyote", "wpn_fps_upg_o_tilt_scopemount")
	self:cafcw_add_to_parts("attach_adds", "wpn_fps_ass_tilt", "wpn_fps_upg_o_hologram", "wpn_fps_upg_o_tilt_scopemount")
	self:cafcw_add_to_parts("attach_adds", "wpn_fps_ass_tilt", "wpn_fps_upg_o_zeiss", "wpn_fps_upg_o_tilt_scopemount")
	self:cafcw_add_to_parts("attach_adds", "wpn_fps_ass_tilt", "wpn_fps_upg_o_okp7", "wpn_fps_upg_o_tilt_scopemount")
	self:cafcw_add_to_parts("attach_adds", "wpn_fps_ass_tilt", "wpn_fps_upg_o_hd33", "wpn_fps_upg_o_tilt_scopemount")
	self:cafcw_add_to_parts("attach_adds", "wpn_fps_ass_tilt", "wpn_fps_upg_o_prismatic", "wpn_fps_upg_o_tilt_scopemount")
	self:cafcw_add_to_parts("attach_adds", "wpn_fps_ass_tilt", "wpn_fps_upg_o_srs", "wpn_fps_upg_o_tilt_scopemount")
	self:cafcw_add_to_parts("attach_adds", "wpn_fps_ass_tilt", "wpn_fps_upg_o_hcog", "wpn_fps_upg_o_tilt_scopemount")
	self:cafcw_add_to_parts("attach_adds", "wpn_fps_ass_tilt", "wpn_fps_upg_o_reflexholo", "wpn_fps_upg_o_tilt_scopemount")
	self:cafcw_add_to_parts("attach_adds", "wpn_fps_ass_tilt", "wpn_fps_upg_o_aog", "wpn_fps_upg_o_tilt_scopemount")
	self:cafcw_add_to_parts("attach_adds", "wpn_fps_ass_tilt", "wpn_fps_upg_o_rmr_riser", "wpn_fps_upg_o_tilt_scopemount")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_tilt", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("attach_adds", "wpn_fps_ass_tilt", "wpn_fps_upg_o_elo", "wpn_fps_upg_o_tilt_scopemount")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_tilt", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("attach_adds", "wpn_fps_ass_tilt", "wpn_fps_upg_o_kemper", "wpn_fps_upg_o_tilt_scopemount")
	self:cafcw_add_to_parts("attach_adds", "wpn_fps_ass_tilt", "wpn_fps_upg_o_mepro", "wpn_fps_upg_o_tilt_scopemount")
	self:cafcw_add_to_parts("attach_adds", "wpn_fps_ass_tilt", "wpn_fps_upg_o_rusak", "wpn_fps_upg_o_tilt_scopemount")
	self:cafcw_add_to_parts("attach_adds", "wpn_fps_ass_tilt", "wpn_fps_upg_o_horzine", "wpn_fps_upg_o_tilt_scopemount")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_tilt", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_tilt", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_tilt", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_tilt", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_tilt", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_tilt", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_to_parts("attach_adds", "wpn_fps_ass_tilt", "wpn_fps_upg_o_pka", "wpn_fps_upg_o_tilt_scopemount")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_tilt", "_545x39mm", "MoreAmmoTypes")
	self:cafcw_add_to_parts("attach_adds", "wpn_fps_ass_tilt", "wpn_fps_upg_o_anpas13d", "wpn_fps_upg_o_tilt_scopemount")
end
--Secondary

-- Magpul PDR
if self.wpn_fps_smg_pdr then
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_pdr", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_pdr", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_pdr", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_pdr", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_pdr", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_pdr", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_pdr", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("ammo", "wpn_fps_smg_pdr", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_custom_sights("specter", "wpn_fps_smg_pdr", "wpn_fps_ass_aug")
	self:cafcw_add_custom_sights("acog", "wpn_fps_smg_pdr", "wpn_fps_ass_aug")
	self:cafcw_add_custom_sights("custom", "wpn_fps_smg_pdr", "wpn_fps_ass_aug")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_smg_pdr", "wpn_fps_ass_aug")
-- Update v1.68.199
	self:cafcw_add_to_parts("sight", "wpn_fps_smg_pdr", "wpn_fps_upg_o_xpsg33_magnifier", "wpn_fps_upg_o_xpsg33_magnifier", "wpn_fps_ass_aug")
	self:cafcw_add_to_parts("sight", "wpn_fps_smg_pdr", "wpn_fps_upg_o_45rds_v2", "wpn_fps_upg_o_45rds_v2", "wpn_fps_ass_aug")
end
end)