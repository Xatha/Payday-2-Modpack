Hooks:PostHook(WeaponFactoryTweakData, "init", "LostGadgetPackInit", function(self)
local gadgetid = {"wpn_fps_upg_fl_anpeq2","wpn_fps_upg_fl_dbal_d2","wpn_fps_upg_fl_m600p","wpn_fps_upg_fl_utg"}

for _, gadget_id in ipairs(gadgetid) do
	self.wpn_fps_ass_aug.adds[ gadget_id ] = {
		"wpn_fps_aug_ris_special"
	}
	self.wpn_fps_shot_r870.adds[ gadget_id ] = {
		"wpn_fps_shot_r870_gadget_rail"
	}
	self.wpn_fps_shot_serbu.adds[ gadget_id ] = {
		"wpn_fps_shot_r870_gadget_rail"
	}
	self.wpn_fps_pis_judge.adds[ gadget_id ] = {
		"wpn_fps_pis_judge_fl_adapter"
	}
	self.wpn_fps_smg_m45.adds[ gadget_id ] = {
		"wpn_fps_shot_r870_gadget_rail"
	}
	self.wpn_fps_ass_s552.adds[ gadget_id ] = {
		"wpn_fps_addon_ris"
	}
	self.wpn_fps_smg_uzi.adds[ gadget_id ] = {
		"wpn_fps_shot_r870_gadget_rail"
	}
	self.wpn_fps_smg_thompson.adds[ gadget_id ] = {
		"wpn_fps_smg_thompson_fl_adapter"
	}
	self.wpn_fps_snp_model70.adds[ gadget_id ] = {
		"wpn_fps_snp_model70_fl_rail"
	}
	self.wpn_fps_smg_x_m45.adds[ gadget_id ] = {
		"wpn_fps_shot_r870_gadget_rail"
	}
	self.wpn_fps_smg_x_m1928.adds[ gadget_id ] = {
		"wpn_fps_smg_thompson_fl_adapter"
	}
	self.wpn_fps_smg_x_uzi.adds[ gadget_id ] = {
		"wpn_fps_shot_r870_gadget_rail"
	}
	self.wpn_fps_pis_x_judge.adds[ gadget_id ] = {
		"wpn_fps_pis_judge_fl_adapter"
	}
	self.wpn_fps_ass_sub2000.override[ gadget_id ] = {
		parent = "foregrip"
	}
	self.wpn_fps_shot_m37.override[ gadget_id ] = {
		parent = "foregrip", a_obj = "a_fl"
	}
	self.parts.wpn_fps_smg_mp5_fg_flash.override[ gadget_id ] = {
		parent = "foregrip"
	}
end
local gadgetidpis = {"wpn_fps_upg_fl_unimax","wpn_fps_upg_fl_utg_pis"}

for _, gadgetid_pis in ipairs(gadgetidpis) do
	self.wpn_fps_pis_deagle.adds[ gadgetid_pis ] = {
		"wpn_fps_pis_deagle_fg_rail"
	}
	self.wpn_fps_pis_beretta.adds[ gadgetid_pis ] = {
		"wpn_fps_pis_beretta_body_rail"
	}
	self.wpn_fps_pis_usp.adds[ gadgetid_pis ] = {
		"wpn_fps_pis_usp_fl_adapter"
	}
	self.wpn_fps_pis_ppk.adds[ gadgetid_pis ] = {
		"wpn_fps_pis_ppk_fl_mount"
	}
	self.wpn_fps_smg_scorpion.adds[ gadgetid_pis ] = {
		"wpn_fps_smg_scorpion_extra_rail_gadget"
	}
	self.wpn_fps_pis_g26.adds[ gadgetid_pis ] = {
		"wpn_fps_pis_g26_fl_adapter"
	}
	self.wpn_fps_jowi.adds[ gadgetid_pis ] = {
		"wpn_fps_pis_g26_fl_adapter"
	}
	self.wpn_fps_x_b92fs.adds[ gadgetid_pis ] = {
		"wpn_fps_pis_beretta_body_rail"
	}
	self.wpn_fps_x_deagle.adds[ gadgetid_pis ] = {
		"wpn_fps_pis_deagle_fg_rail"
	}
	self.wpn_fps_pis_c96.adds[ gadgetid_pis ] = {
		"wpn_fps_pis_c96_rail"
	}
	self.wpn_fps_pis_x_usp.adds[ gadgetid_pis ] = {
		"wpn_fps_pis_usp_fl_adapter"
	}
	self.wpn_fps_pis_2006m.adds[ gadgetid_pis ] = {
		"wpn_fps_pis_2006m_fl_adapter"
	}
	self.wpn_fps_smg_baka.adds[ gadgetid_pis ] = {
		"wpn_fps_smg_baka_fl_adapter"
	}
	self.wpn_fps_pis_sparrow.adds[ gadgetid_pis ] = {
		"wpn_fps_pis_sparrow_fl_dummy"
	}
	self.wpn_fps_pis_shrew.adds[ gadgetid_pis ] = {
		"wpn_fps_pis_shrew_fl_adapter"
	}
	self.wpn_fps_pis_x_shrew.adds[ gadgetid_pis ] = {
		"wpn_fps_pis_shrew_fl_adapter"
	}
	self.wpn_fps_smg_x_baka.adds[ gadgetid_pis ] = {
		"wpn_fps_smg_baka_fl_adapter"
	}
	self.wpn_fps_smg_x_scorpion.adds[ gadgetid_pis ] = {
		"wpn_fps_smg_scorpion_extra_rail_gadget"
	}
	self.wpn_fps_pis_x_2006m.adds[ gadgetid_pis ] = {
		"wpn_fps_pis_2006m_fl_adapter"
	}
	self.wpn_fps_pis_x_c96.adds[ gadgetid_pis ] = {
		"wpn_fps_pis_c96_rail"
	}
	self.wpn_fps_pis_x_ppk.adds[ gadgetid_pis ] = {
		"wpn_fps_pis_ppk_fl_mount"
	}
	self.wpn_fps_pis_x_sparrow.adds[ gadgetid_pis ] = {
		"wpn_fps_pis_sparrow_fl_dummy"
	}
	self.wpn_fps_pis_legacy.adds[ gadgetid_pis ] = {
		"wpn_fps_pis_legacy_fl_mount"
	}
	self.wpn_fps_pis_x_legacy.adds[ gadgetid_pis ] = {
		"wpn_fps_pis_legacy_fl_mount"
	}
end
end)