Hooks:PostHook(WeaponFactoryTweakData, "create_bonuses", "CAFCWMod_Alcat_Init", function(self)

--Custom Weapon

--HOWA
if self.wpn_fps_ass_howa then
--gadget
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_howa", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_howa", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_howa", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_howa", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_howa", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_howa", "wpn_fps_upg_fl_utg")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t89_body", "wpn_fps_upg_fl_ass_spotter", "a_fl_t89")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t89_body", "wpn_fps_upg_fl_wml", "a_fl_t89")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t89_body", "wpn_fps_upg_fl_anpeq2", "a_fl_t89")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t89_body", "wpn_fps_upg_fl_dbal_d2", "a_fl_t89")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t89_body", "wpn_fps_upg_fl_m600p", "a_fl_t89")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t89_body", "wpn_fps_upg_fl_utg", "a_fl_t89")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_fl_ass_spotter", "a_fl_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_fl_wml", "a_fl_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_fl_anpeq2", "a_fl_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_fl_dbal_d2", "a_fl_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_fl_m600p", "a_fl_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_fl_utg", "a_fl_t64")
--modpack
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_howa", "wpn_fps_upg_ns_ass_smg_tromix")
self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_howa", "SneakySuppressorPack", "ARSupp")
self:cafcw_add_modpack("ammo", "wpn_fps_ass_howa", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
--shield
self:cafcw_add_to_parts("other", "wpn_fps_ass_howa", "wpn_fps_shield_aug")
self:cafcw_add_to_parts("other", "wpn_fps_ass_howa", "wpn_fps_shield_skin_ftp")
self:cafcw_add_to_parts("other", "wpn_fps_ass_howa", "wpn_fps_shield_skin_urban")

--optic sight
self:cafcw_add_custom_sights("specter", "wpn_fps_ass_howa", "wpn_fps_ass_ak5", "wpn_fps_ass_howa_body_rail")
self:cafcw_add_custom_sights("acog", "wpn_fps_ass_howa", "wpn_fps_ass_ak5", "wpn_fps_ass_howa_body_rail")
self:cafcw_add_custom_sights("custom", "wpn_fps_ass_howa", "wpn_fps_ass_ak5", "wpn_fps_ass_howa_body_rail")
self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_howa", "wpn_fps_ass_ak5")
--t64 part kit changes a_o point
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_acog_rmr", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_gitsch", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_aog", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_eotech552", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_po4", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_st10", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_susat", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_visionking", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_compm2", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_delta_rm55", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_kobra", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_compm4s", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_m145", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_pkas", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_coyote", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_hologram", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_zeiss", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_okp7", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_hd33", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_prismatic", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_srs", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_hcog", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_reflexholo", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_rmr_riser", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_elo", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_kemper", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_mepro", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_rusak", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_horzine", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_pka", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_anpas13d", "a_o_t64")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_compm2", "a_o_t64")
--experimental scope xd
self:cafcw_add_to_parts("sight_vector", "wpn_fps_ass_howa", "wpn_fps_upg_o_pso1_rifle", "0,18,-4")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_howa_t64_body", "wpn_fps_upg_o_pso1_rifle", "a_o_t64_pso1")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_ass_howa_body_rail", "wpn_fps_upg_o_pso1_rifle")
self:cafcw_add_to_parts("forbids", "wpn_fps_ass_howa_t89_body", "wpn_fps_upg_o_pso1_rifle")
end

--Browning LMG
if self.wpn_fps_ass_bar then
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_bar", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_bar", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_bar", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_bar", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_bar", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_bar", "wpn_fps_upg_fl_utg")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_bar", "wpn_fps_upg_ns_ass_smg_tromix")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_bar", "wpn_fps_upg_ns_ass_smg_tromix", "a_ns_bar")
end

--PKP Pecheneg LMG
if self.wpn_fps_lmg_pecheneg then
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_pecheneg", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_pecheneg", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_pecheneg", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_pecheneg", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_pecheneg", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_pecheneg", "wpn_fps_upg_fl_utg")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_lmg_pecheneg", "wpn_fps_upg_ns_ass_smg_tromix")
self:cafcw_add_modpack("barrel_ext", "wpn_fps_lmg_pecheneg", "SneakySuppressorPack", "ARSupp")
self:cafcw_add_modpack("ammo", "wpn_fps_lmg_pecheneg", "_762x54mmr", "MoreAmmoTypes")
end

--Trench Gun
if self.wpn_fps_shot_trench then
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_trench", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_trench", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_shot_trench", "wpn_fps_upg_ns_sho_salvo_small")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_trench", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_trench", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_trench", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_trench", "wpn_fps_upg_fl_utg")
self:cafcw_add_modpack("ammo", "wpn_fps_shot_trench", "_12ga", "TaserAmmo_MoreAmmoTypes")
end

--Browning A5
if self.wpn_fps_shot_auto5 then
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_auto5", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_auto5", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_shot_auto5", "wpn_fps_upg_ns_sho_salvo_small")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_auto5", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_auto5", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_auto5", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_auto5", "wpn_fps_upg_fl_utg")
self:cafcw_add_modpack("ammo", "wpn_fps_shot_auto5", "_12ga_auto", "TaserAmmo")
end

--Hecate AMP
if self.wpn_fps_snp_hecate then
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_hecate", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_hecate", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_hecate", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_hecate", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_hecate", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_hecate", "wpn_fps_upg_fl_utg")
self:cafcw_add_modpack("ammo", "wpn_fps_snp_hecate", "_127x99mm", "IncendiaryAmmo")
self:cafcw_add_custom_sights("specter", "wpn_fps_snp_hecate", "wpn_fps_snp_msr")
self:cafcw_add_custom_sights("acog", "wpn_fps_snp_hecate", "wpn_fps_snp_msr")
self:cafcw_add_custom_sights("custom", "wpn_fps_snp_hecate", "wpn_fps_snp_msr")
self:cafcw_add_custom_sights("custom_sniper", "wpn_fps_snp_hecate", "wpn_fps_snp_msr")
self:cafcw_add_custom_sights("shortdot", "wpn_fps_snp_hecate", "wpn_fps_snp_msr")
self:cafcw_add_custom_sights("rds45", "wpn_fps_snp_hecate", "wpn_fps_snp_msr")
end


--QBU88
if self.wpn_fps_snp_qbu88 then
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_qbu88", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_qbu88", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("other", "wpn_fps_snp_qbu88", "wpn_fps_shield_lmg")
self:cafcw_add_to_parts("other", "wpn_fps_snp_qbu88", "wpn_fps_shield_skin_ftp")
self:cafcw_add_to_parts("other", "wpn_fps_snp_qbu88", "wpn_fps_shield_skin_urban")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_qbu88", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_qbu88", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_qbu88", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_qbu88", "wpn_fps_upg_fl_utg")
self:cafcw_add_custom_sights("specter", "wpn_fps_snp_qbu88", "wpn_fps_snp_wa2000")
self:cafcw_add_custom_sights("acog", "wpn_fps_snp_qbu88", "wpn_fps_snp_wa2000")
self:cafcw_add_custom_sights("custom", "wpn_fps_snp_qbu88", "wpn_fps_snp_wa2000")
self:cafcw_add_custom_sights("custom_sniper", "wpn_fps_snp_qbu88", "wpn_fps_snp_wa2000")
self:cafcw_add_custom_sights("shortdot", "wpn_fps_snp_qbu88", "wpn_fps_snp_wa2000")
self:cafcw_add_custom_sights("rds45", "wpn_fps_snp_qbu88", "wpn_fps_snp_wa2000")
end


--MSMC
if self.wpn_fps_smg_msmc then
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_msmc", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_msmc", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_msmc", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_msmc", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_msmc", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_msmc", "wpn_fps_upg_fl_utg")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_msmc", "wpn_fps_upg_ns_ass_smg_tromix")
self:cafcw_add_modpack("barrel_ext", "wpn_fps_smg_msmc", "SneakySuppressorPack", "ARSupp")
self:cafcw_add_custom_sights("specter", "wpn_fps_smg_msmc", "wpn_fps_smg_mp7")
self:cafcw_add_custom_sights("acog", "wpn_fps_smg_msmc", "wpn_fps_smg_mp7")
self:cafcw_add_custom_sights("custom", "wpn_fps_smg_msmc", "wpn_fps_smg_mp7")
end


-- KRISS KARD
if self.wpn_fps_pis_kard and self.wpn_fps_pis_x_kard then
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_kard", "wpn_fps_ass_ns_g_sup1")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_kard", "wpn_fps_ass_ns_g_sup2")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_kard", "wpn_fps_ass_ns_g_sup6")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_x_kard", "wpn_fps_ass_ns_g_sup1")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_x_kard", "wpn_fps_ass_ns_g_sup2")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_x_kard", "wpn_fps_ass_ns_g_sup6")
end


--Negev LMG
if self.wpn_fps_lmg_negev then
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_negev", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_negev", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_negev", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_negev", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_negev", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_negev", "wpn_fps_upg_fl_utg")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_lmg_negev", "wpn_fps_upg_ns_ass_smg_tromix")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_lmg_negev", "wpn_fps_upg_ns_ass_smg_tromix")
self:cafcw_add_modpack("ammo", "wpn_fps_lmg_negev", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_lmg_negev", "SneakySuppressorPack", "ARSupp")
end


--Mx4 Storm || After U170ish new MP5 anim, Mx4 cant use deep clone of aiming angle stance. The value is now derived from each optic stance mod of MP5 + )
if self.wpn_fps_smg_storm then
if self.parts.wpn_fps_upg_o_kobra then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_kobra")
	self.parts.wpn_fps_upg_o_kobra.stance_mod.wpn_fps_smg_storm = {translation = Vector3(0, 0, -3) + Vector3(0, 2, 2.75)}
end
if self.parts.wpn_fps_upg_o_compm4s then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_compm4s")
	self.parts.wpn_fps_upg_o_compm4s.stance_mod.wpn_fps_smg_storm = {translation = Vector3(0, 0, -3) + Vector3(0, 2, 2.75)}
end
if self.parts.wpn_fps_upg_o_m145 then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_m145")
	self.parts.wpn_fps_upg_o_m145.stance_mod.wpn_fps_smg_storm = {translation = Vector3(0, 0, -3) + Vector3(0, 2, 2.75)}
end
if self.parts.wpn_fps_upg_o_pkas then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_pkas")
	self.parts.wpn_fps_upg_o_pkas.stance_mod.wpn_fps_smg_storm = {translation = Vector3(0, 0, -3) + Vector3(0, 2, 2.75)}
end
if self.parts.wpn_fps_upg_o_coyote then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_coyote")
	self.parts.wpn_fps_upg_o_coyote.stance_mod.wpn_fps_smg_storm = {translation = Vector3(0, 0, -3) + Vector3(0, 2, 2.75)}
end
if self.parts.wpn_fps_upg_o_acog_rmr then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_acog_rmr")
	self.parts.wpn_fps_upg_o_acog_rmr.stance_mod.wpn_fps_smg_storm = {translation = Vector3(0, 0, -3) + Vector3(0, 2, 2.75)}
end
if self.parts.wpn_fps_upg_o_hologram then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_hologram")
	self.parts.wpn_fps_upg_o_hologram.stance_mod.wpn_fps_smg_storm = {translation = Vector3(0, 0, -3) + Vector3(0, 2, 2.75)}
end
if self.parts.wpn_fps_upg_o_zeiss then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_zeiss")
	self.parts.wpn_fps_upg_o_zeiss.stance_mod.wpn_fps_smg_storm = {translation = Vector3(0, 0, -3) + Vector3(0, 2, 2.75)}
end
if self.parts.wpn_fps_upg_o_okp7 then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_okp7")
	self.parts.wpn_fps_upg_o_okp7.stance_mod.wpn_fps_smg_storm = {translation = Vector3(0, 0, -3) + Vector3(0, 2, 2.75)}
end
if self.parts.wpn_fps_upg_o_hd33 then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_hd33")
	self.parts.wpn_fps_upg_o_hd33.stance_mod.wpn_fps_smg_storm = {translation = Vector3(0, 0, -3) + Vector3(0, 2, 2.75)}
end
if self.parts.wpn_fps_upg_o_prismatic then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_prismatic")
	self.parts.wpn_fps_upg_o_prismatic.stance_mod.wpn_fps_smg_storm = {translation = Vector3(0, 0, -3) + Vector3(0, 2, 2.75)}
end
if self.parts.wpn_fps_upg_fl_ass_spotter then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_fl_ass_spotter")
end
if self.parts.wpn_fps_upg_o_srs then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_srs")
	self.parts.wpn_fps_upg_o_srs.stance_mod.wpn_fps_smg_storm = {translation = Vector3(0, 0, -3) + Vector3(0, 2, 2.75)}
end
if self.parts.wpn_fps_upg_o_hcog then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_hcog")
	self.parts.wpn_fps_upg_o_hcog.stance_mod.wpn_fps_smg_storm = {translation = Vector3(0, 0, -3) + Vector3(0, 2, 2.75)}
end
if self.parts.wpn_fps_upg_o_reflexholo then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_reflexholo")
	self.parts.wpn_fps_upg_o_reflexholo.stance_mod.wpn_fps_smg_storm = {translation = Vector3(0, 0, -3) + Vector3(0, 2, 2.75)}
end
if self.parts.wpn_fps_upg_o_aog then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_aog")
	self.parts.wpn_fps_upg_o_aog.stance_mod.wpn_fps_smg_storm = {translation = Vector3(0, 0, -3) + Vector3(0, 2, 2.75)}
end
if self.parts.wpn_fps_upg_o_rmr_riser then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_rmr_riser")
	self.parts.wpn_fps_upg_o_rmr_riser.stance_mod.wpn_fps_smg_storm = {translation = Vector3(0, 0, -3) + Vector3(0, 2, 2.75)}
end
if self.parts.wpn_fps_upg_o_st10 then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_st10")
	self.parts.wpn_fps_upg_o_st10.stance_mod.wpn_fps_smg_storm = deep_clone(self.parts.wpn_fps_upg_o_st10.stance_mod.wpn_fps_smg_mp7)
end
if self.parts.wpn_fps_upg_o_elo then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_elo")
	self.parts.wpn_fps_upg_o_elo.stance_mod.wpn_fps_smg_storm = {translation = Vector3(0, 0, -3) + Vector3(0, 2, 2.75)}
end
if self.parts.wpn_fps_upg_o_po4 then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_po4")
	self.parts.wpn_fps_upg_o_po4.stance_mod.wpn_fps_smg_storm = deep_clone(self.parts.wpn_fps_upg_o_po4.stance_mod.wpn_fps_smg_mp7)
end
if self.parts.wpn_fps_ass_ns_g_sup3 and self.parts.wpn_fps_ass_ns_g_sup4 then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_ass_ns_g_sup3")
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_ass_ns_g_sup4")
end
if self.parts.wpn_fps_upg_o_susat then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_susat")
	self.parts.wpn_fps_upg_o_susat.stance_mod.wpn_fps_smg_storm = deep_clone(self.parts.wpn_fps_upg_o_susat.stance_mod.wpn_fps_smg_mp7)
end
if self.parts.wpn_fps_upg_fl_wml then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_fl_wml")
end
if self.parts.wpn_fps_upg_o_kemper then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_kemper")
	self.parts.wpn_fps_upg_o_kemper.stance_mod.wpn_fps_smg_storm = {translation = Vector3(0, 0, -3) + Vector3(0, 2, 2.75)}
end
if self.parts.wpn_fps_upg_o_mepro then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_mepro")
	self.parts.wpn_fps_upg_o_mepro.stance_mod.wpn_fps_smg_storm = {translation = Vector3(0, 0, -3) + Vector3(0, 2, 2.75)}
end
if self.parts.wpn_fps_upg_o_rusak then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_rusak")
	self.parts.wpn_fps_upg_o_rusak.stance_mod.wpn_fps_smg_storm = {translation = Vector3(0, 0, -3) + Vector3(0, 2, 2.75)}
end
if self.parts.wpn_fps_upg_o_horzine then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_horzine")
	self.parts.wpn_fps_upg_o_horzine.stance_mod.wpn_fps_smg_storm = {translation = Vector3(0, 0, -3) + Vector3(0, 2, 2.75)}
end
if self.parts.wpn_fps_upg_o_eotech552 then
table.insert(self.wpn_fps_smg_storm.uses_parts, "wpn_fps_upg_o_eotech552")
	self.parts.wpn_fps_upg_o_eotech552.stance_mod.wpn_fps_smg_storm = deep_clone(self.parts.wpn_fps_upg_o_eotech552.stance_mod.wpn_fps_smg_mp7)
end
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_storm", "wpn_fps_upg_ns_ass_smg_tromix")
self:cafcw_add_modpack("ammo", "wpn_fps_smg_storm", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
end


--Mini14 
if self.wpn_fps_ass_mini14 then
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_kobra", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_kobra", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_compm4s", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_compm4s", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_m145", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_m145", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_pkas", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_pkas", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_coyote", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_coyote", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_hologram", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_hologram", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_zeiss", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_zeiss", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_okp7", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_okp7", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_hd33", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_hd33", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_prismatic", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_prismatic", "a_o_sm")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_mini14", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_srs", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_srs", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_hcog", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_hcog", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_reflexholo", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_reflexholo", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_aog", "wpn_fps_upg_o_m14_scopemount", "acog", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_aog", "a_o_sm")
self:cafcw_add_to_parts("sight_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_st10", "specter", "wpn_fps_ass_mini14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_st10", "a_o_sm")
if self.parts.wpn_fps_upg_o_st10 then
	self.parts.wpn_fps_upg_o_st10.stance_mod.wpn_fps_ass_mini14 = {translation = Vector3(-0.02, -30, -5.97)}
end
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_elo", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_elo", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_po4", "wpn_fps_upg_o_m14_scopemount", "wpn_fps_upg_o_po4", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_po4", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_susat", "wpn_fps_upg_o_m14_scopemount", "wpn_fps_upg_o_susat", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_susat", "a_o_sm")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_mini14", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_kemper", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_kemper", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_mepro", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_mepro", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_rusak", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_rusak", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_horzine", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_horzine", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_eotech552", "wpn_fps_upg_o_m14_scopemount", "wpn_fps_upg_o_eotech552", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_eotech552", "a_o_sm")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_mini14", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_mini14", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_mini14", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_mini14", "wpn_fps_upg_fl_utg")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_mini14", "wpn_fps_upg_ns_ass_smg_tromix")
self:cafcw_add_modpack("ammo", "wpn_fps_ass_mini14", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_visionking", "wpn_fps_upg_o_m14_scopemount", "wpn_fps_upg_o_visionking", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_visionking", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_pka", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_pka", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_mini14", "wpn_fps_upg_o_anpas13d", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_mini14_opticrail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_mini14", "wpn_fps_upg_o_anpas13d", "a_o_sm")
self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_mini14", "wpn_fps_ass_m14")
end



--Korean Arms Pack Weapon

--Korean Arms - K5
if self.wpn_fps_pis_k5 then
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_k5", "wpn_fps_ass_ns_g_sup1")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_k5", "wpn_fps_ass_ns_g_sup2")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_k5", "wpn_fps_ass_ns_g_sup6")
self:cafcw_add_modpack("ammo", "wpn_fps_pis_k5", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
end

--Korean Arms - K2
if self.wpn_fps_ass_k2 then
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_k2", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_k2", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_k2", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_k2", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_k2", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_k2", "wpn_fps_upg_fl_utg")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_k2", "wpn_fps_upg_ns_ass_smg_tromix")
self:cafcw_add_modpack("ammo", "wpn_fps_ass_k2", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_k2", "SneakySuppressorPack", "ARSupp")
self:cafcw_add_custom_sights("specter", "wpn_fps_ass_k2", "wpn_fps_ass_ak5")
self:cafcw_add_custom_sights("acog", "wpn_fps_ass_k2", "wpn_fps_ass_ak5")
self:cafcw_add_custom_sights("custom", "wpn_fps_ass_k2", "wpn_fps_ass_ak5")
self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_k2", "wpn_fps_ass_ak5")
end

--Korean Arms - K3
if self.wpn_fps_lmg_k3 then
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_k3", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_k3", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_k3", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_k3", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_k3", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_k3", "wpn_fps_upg_fl_utg")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_lmg_k3", "wpn_fps_upg_ns_ass_smg_tromix")
self:cafcw_add_modpack("ammo", "wpn_fps_lmg_k3", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
self:cafcw_add_modpack("barrel_ext", "wpn_fps_lmg_k3", "SneakySuppressorPack", "ARSupp")
end

--Korean Arms - K1A7
if self.wpn_fps_smg_k1a7 then
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_k1a7", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_k1a7", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("other", "wpn_fps_smg_k1a7", "wpn_fps_shield_m4")
self:cafcw_add_to_parts("other", "wpn_fps_smg_k1a7", "wpn_fps_shield_skin_ftp")
self:cafcw_add_to_parts("other", "wpn_fps_smg_k1a7", "wpn_fps_shield_skin_urban")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_k1a7", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_k1a7", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_k1a7", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_k1a7", "wpn_fps_upg_fl_utg")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_k1a7", "wpn_fps_upg_ns_ass_smg_tromix")
self:cafcw_add_modpack("ammo", "wpn_fps_smg_k1a7", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
self:cafcw_add_modpack("ammo", "wpn_fps_smg_k1a7", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
self:cafcw_add_modpack("forbids_add", "wpn_fps_smg_k1a7_m_9mm", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
self:cafcw_add_modpack("forbids_add", "wpn_fps_smg_k1a7_mag", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
self:cafcw_add_modpack("barrel_ext", "wpn_fps_smg_k1a7", "SneakySuppressorPack", "ARSupp")
self:cafcw_add_custom_sights("specter", "wpn_fps_smg_k1a7", "wpn_fps_ass_m4")
self:cafcw_add_custom_sights("acog", "wpn_fps_smg_k1a7", "wpn_fps_ass_m4")
self:cafcw_add_custom_sights("custom", "wpn_fps_smg_k1a7", "wpn_fps_ass_m4")
self:cafcw_add_custom_sights("rds45", "wpn_fps_smg_k1a7", "wpn_fps_ass_m4")
end



--PLA Arms Weaponry

--Hawk12 Shottie || using a_o_sm, no shortening function cafcw yet
if self.wpn_fps_shot_hawk12 then
if self.parts.wpn_fps_upg_o_hd33 then
table.insert(self.wpn_fps_shot_hawk12.uses_parts, "wpn_fps_upg_o_hd33")
	self.parts.wpn_fps_upg_o_hd33.stance_mod.wpn_fps_shot_hawk12 = {translation = Vector3(-3.25, 1.5, -1.5)}
	self.wpn_fps_shot_hawk12.adds = {wpn_fps_upg_o_hd33 = {"wpn_fps_upg_o_ak_scopemount"} }
	self.wpn_fps_shot_hawk12.override = {wpn_fps_upg_o_hd33 = {a_obj = "a_o_sm"} }
end
if self.parts.wpn_fps_upg_o_kemper then
table.insert(self.wpn_fps_shot_hawk12.uses_parts, "wpn_fps_upg_o_kemper")
	self.parts.wpn_fps_upg_o_kemper.stance_mod.wpn_fps_shot_hawk12 = {translation = Vector3(-3.25, 4, -1.5)}
	self.wpn_fps_shot_hawk12.adds = {wpn_fps_upg_o_kemper = {"wpn_fps_upg_o_ak_scopemount"} }
	self.wpn_fps_shot_hawk12.override = {wpn_fps_upg_o_kemper = {a_obj = "a_o_sm"} }
end
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_hawk12", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_hawk12", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_shot_hawk12", "wpn_fps_upg_ns_sho_salvo_small")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_hawk12", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_hawk12", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_hawk12", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_hawk12", "wpn_fps_upg_fl_utg")
self:cafcw_add_modpack("ammo", "wpn_fps_shot_hawk12", "_12ga_mag", "TaserAmmo_MoreAmmoTypes")
end


--JS2 SMG
if self.wpn_fps_smg_js2 then
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_js2", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_js2", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_js2", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_js2", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_js2", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_js2", "wpn_fps_upg_fl_utg")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_js2", "wpn_fps_upg_ns_ass_smg_tromix")
self:cafcw_add_modpack("ammo", "wpn_fps_smg_js2", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
self:cafcw_add_modpack("barrel_ext", "wpn_fps_smg_js2", "SneakySuppressorPack", "ARSupp")
self:cafcw_add_custom_sights("specter", "wpn_fps_smg_js2", "wpn_fps_ass_aug")
self:cafcw_add_custom_sights("acog", "wpn_fps_smg_js2", "wpn_fps_ass_aug")
self:cafcw_add_custom_sights("custom", "wpn_fps_smg_js2", "wpn_fps_ass_aug")
self:cafcw_add_custom_sights("rds45", "wpn_fps_smg_js2", "wpn_fps_ass_aug")
end


--Minebee9
if self.wpn_fps_smg_minebea and self.wpn_fps_smg_x_minebea then
self:cafcw_add_to_parts("attach_adds", "wpn_fps_smg_minebea", "wpn_fps_upg_o_kobra", "wpn_fps_smg_minebea_o_adapter")
self:cafcw_add_to_parts("attach_adds", "wpn_fps_smg_minebea", "wpn_fps_upg_o_compm4s", "wpn_fps_smg_minebea_o_adapter")
self:cafcw_add_to_parts("attach_adds", "wpn_fps_smg_minebea", "wpn_fps_upg_o_m145", "wpn_fps_smg_minebea_o_adapter")
self:cafcw_add_to_parts("attach_adds", "wpn_fps_smg_minebea", "wpn_fps_upg_o_pkas", "wpn_fps_smg_minebea_o_adapter")
self:cafcw_add_to_parts("attach_adds", "wpn_fps_smg_minebea", "wpn_fps_upg_o_coyote", "wpn_fps_smg_minebea_o_adapter")
--[[if self.parts.wpn_fps_upg_o_acog_rmr then
table.insert(self.wpn_fps_smg_minebea.uses_parts, "wpn_fps_upg_o_acog_rmr")
	self.wpn_fps_smg_minebea.adds.wpn_fps_upg_o_rmr = {
		"wpn_fps_smg_minebea_o_adapter"
	}
end]]--
self:cafcw_add_to_parts("attach_adds", "wpn_fps_smg_minebea", "wpn_fps_upg_o_zeiss", "wpn_fps_smg_minebea_o_adapter")
self:cafcw_add_to_parts("attach_adds", "wpn_fps_smg_minebea", "wpn_fps_upg_o_okp7", "wpn_fps_smg_minebea_o_adapter")
self:cafcw_add_to_parts("attach_adds", "wpn_fps_smg_minebea", "wpn_fps_upg_o_hd33", "wpn_fps_smg_minebea_o_adapter")
self:cafcw_add_to_parts("attach_adds", "wpn_fps_smg_minebea", "wpn_fps_upg_o_prismatic", "wpn_fps_smg_minebea_o_adapter")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_minebea", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_minebea", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("attach_adds", "wpn_fps_smg_minebea", "wpn_fps_upg_o_hcog", "wpn_fps_smg_minebea_o_adapter")
self:cafcw_add_to_parts("attach_adds", "wpn_fps_smg_minebea", "wpn_fps_upg_o_reflexholo", "wpn_fps_smg_minebea_o_adapter")
--[[if self.parts.wpn_fps_upg_o_aog then
table.insert(self.wpn_fps_smg_minebea.uses_parts, "wpn_fps_upg_o_aog")
	self.wpn_fps_smg_minebea.adds.wpn_fps_upg_o_aog = {
		"wpn_fps_smg_minebea_o_adapter"
	}
end]]--
self:cafcw_add_to_parts("attach_adds", "wpn_fps_smg_minebea", "wpn_fps_smg_minebea", "wpn_fps_smg_minebea_o_adapter")
--[[ if self.parts.wpn_fps_upg_o_st10 then
table.insert(self.wpn_fps_smg_minebea.uses_parts, "wpn_fps_upg_o_st10")
	self.wpn_fps_smg_minebea.adds.wpn_fps_upg_o_st10 = {
		"wpn_fps_smg_minebea_o_adapter"
	}
end]]--
self:cafcw_add_to_parts("attach_adds", "wpn_fps_smg_minebea", "wpn_fps_upg_o_elo", "wpn_fps_smg_minebea_o_adapter")
--[[if self.parts.wpn_fps_upg_o_po4 then
table.insert(self.wpn_fps_smg_minebea.uses_parts, "wpn_fps_upg_o_po4")
	self.wpn_fps_smg_minebea.adds.wpn_fps_upg_o_po4 = {
		"wpn_fps_smg_minebea_o_adapter"
	}
end]]--
--[[if self.parts.wpn_fps_upg_o_susat then
table.insert(self.wpn_fps_smg_minebea.uses_parts, "wpn_fps_upg_o_susat")
	self.wpn_fps_smg_minebea.adds.wpn_fps_upg_o_susat = {
		"wpn_fps_smg_minebea_o_adapter"
	}
end]]--
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_minebea", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_minebea", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("attach_adds", "wpn_fps_smg_minebea", "wpn_fps_upg_o_kemper", "wpn_fps_smg_minebea_o_adapter")
self:cafcw_add_to_parts("attach_adds", "wpn_fps_smg_minebea", "wpn_fps_upg_o_mepro", "wpn_fps_smg_minebea_o_adapter")
self:cafcw_add_to_parts("attach_adds", "wpn_fps_smg_minebea", "wpn_fps_upg_o_rusak", "wpn_fps_smg_minebea_o_adapter")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_minebea", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_minebea", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_minebea", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_minebea", "wpn_fps_upg_fl_utg")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_minebea", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_minebea", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_minebea", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_minebea", "wpn_fps_upg_fl_utg")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_minebea", "wpn_fps_upg_ns_ass_smg_tromix")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_x_minebea", "wpn_fps_upg_ns_ass_smg_tromix")
self:cafcw_add_modpack("ammo", "wpn_fps_smg_minebea", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
self:cafcw_add_modpack("ammo", "wpn_fps_smg_x_minebea", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
self:cafcw_add_modpack("barrel_ext", "wpn_fps_smg_minebea", "SneakySuppressorPack", "ARSupp")
self:cafcw_add_modpack("barrel_ext", "wpn_fps_smg_x_minebea", "SneakySuppressorPack", "ARSupp")
end



--Volmer LMG
if self.wpn_fps_lmg_volmer then
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_volmer", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_volmer", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_volmer", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_volmer", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_volmer", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_volmer", "wpn_fps_upg_fl_utg")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_lmg_volmer", "wpn_fps_upg_ns_ass_smg_tromix")
self:cafcw_add_modpack("barrel_ext", "wpn_fps_lmg_volmer", "SneakySuppressorPack", "ARSupp")
self:cafcw_add_modpack("ammo", "wpn_fps_lmg_volmer", "_762x51mm", "MoreAmmoTypes")
end



--chang6 SMG
if self.wpn_fps_smg_chang6 then
-- self.wpn_fps_smg_chang6.override = {
		-- wpn_fps_upg_fl_ass_spotter = {a_obj = "a_b"},
		-- wpn_fps_upg_fl_wml = {a_obj = "a_b"},
		-- wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_b"},
		-- wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_b"},
		-- wpn_fps_upg_fl_ass_smg_sho_surefire = {a_obj = "a_b"},
		-- wpn_fps_upg_fl_ass_laser = {a_obj = "a_b"},
		-- wpn_fps_upg_fl_ass_utg = {a_obj = "a_b"},
		-- wpn_fps_addon_ris = {a_obj = "a_b"}
	-- }
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_chang6", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_chang6", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_chang6", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_chang6", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_chang6", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_chang6", "wpn_fps_upg_fl_utg")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_chang6", "wpn_fps_upg_ns_ass_smg_tromix")

self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_smg_chang6", "wpn_fps_upg_fl_ass_spotter", "a_b")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_smg_chang6", "wpn_fps_upg_fl_wml", "a_b")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_smg_chang6", "wpn_fps_upg_fl_anpeq2", "a_b")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_smg_chang6", "wpn_fps_upg_fl_dbal_d2", "a_b")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_smg_chang6", "wpn_fps_upg_fl_m600p", "a_b")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_smg_chang6", "wpn_fps_upg_fl_utg", "a_b")
self:cafcw_add_modpack("ammo", "wpn_fps_smg_chang6", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
self:cafcw_add_modpack("barrel_ext", "wpn_fps_smg_chang6", "SneakySuppressorPack", "ARSupp")
end


--Gepard Lynx
if self.wpn_fps_snp_lynx then
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_lynx", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_lynx", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_lynx", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_lynx", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_lynx", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_lynx", "wpn_fps_upg_fl_utg")
self:cafcw_add_custom_sights("specter", "wpn_fps_snp_lynx", "wpn_fps_snp_m95")
self:cafcw_add_custom_sights("acog", "wpn_fps_snp_lynx", "wpn_fps_snp_m95")
self:cafcw_add_custom_sights("custom", "wpn_fps_snp_lynx", "wpn_fps_snp_m95")
self:cafcw_add_custom_sights("custom_sniper", "wpn_fps_snp_lynx", "wpn_fps_snp_m95")
self:cafcw_add_custom_sights("shortdot", "wpn_fps_snp_lynx", "wpn_fps_snp_m95")
self:cafcw_add_custom_sights("rds45", "wpn_fps_snp_lynx", "wpn_fps_snp_m95")
end

-- SPAS15
if self.wpn_fps_shot_spas15 then
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_spas15", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_spas15", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_shot_spas15", "wpn_fps_upg_ns_sho_salvo_small")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_spas15", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_spas15", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_spas15", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_spas15", "wpn_fps_upg_fl_utg")
self:cafcw_add_custom_sights("specter", "wpn_fps_shot_spas15", "wpn_fps_ass_g36")
self:cafcw_add_custom_sights("acog", "wpn_fps_shot_spas15", "wpn_fps_ass_g36")
self:cafcw_add_custom_sights("custom", "wpn_fps_shot_spas15", "wpn_fps_ass_g36")
self:cafcw_add_custom_sights("rds45", "wpn_fps_shot_spas15", "wpn_fps_ass_g36")
end


--MAG7
if self.wpn_fps_shot_techno and self.wpn_fps_shot_x_techno then
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_techno", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_techno", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_shot_techno", "wpn_fps_upg_ns_sho_salvo_small")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_techno", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_techno", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_techno", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_techno", "wpn_fps_upg_fl_utg")
self:cafcw_add_modpack("ammo", "wpn_fps_shot_techno", "_12ga_mag", "TaserAmmo_MoreAmmoTypes")

self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_techno", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_techno", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_shot_x_techno", "wpn_fps_upg_ns_sho_salvo_small")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_techno", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_techno", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_techno", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_techno", "wpn_fps_upg_fl_utg")
self:cafcw_add_modpack("ammo", "wpn_fps_shot_x_techno", "_12ga_mag", "TaserAmmo_MoreAmmoTypes")
end



-- 1903 AEX
if self.wpn_fps_snp_spring then
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_spring", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_spring", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_spring", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_spring", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_spring", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_spring", "wpn_fps_upg_fl_utg")
self:cafcw_add_custom_sights("specter", "wpn_fps_snp_spring", "wpn_fps_snp_model70", "wpn_fps_snp_model70_o_rail")
self:cafcw_add_custom_sights("acog", "wpn_fps_snp_spring", "wpn_fps_snp_model70", "wpn_fps_snp_model70_o_rail")
self:cafcw_add_custom_sights("custom", "wpn_fps_snp_spring", "wpn_fps_snp_model70", "wpn_fps_snp_model70_o_rail")
self:cafcw_add_custom_sights("custom_sniper", "wpn_fps_snp_spring", "wpn_fps_snp_model70", "wpn_fps_snp_model70_o_rail")
self:cafcw_add_custom_sights("shortdot", "wpn_fps_snp_spring", "wpn_fps_snp_model70", "wpn_fps_snp_model70_o_rail")
self:cafcw_add_custom_sights("rds45", "wpn_fps_snp_spring", "wpn_fps_snp_model70")
end
		

--MG5 LMG
if self.wpn_fps_lmg_mg5 then
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_mg5", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_mg5", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_mg5", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_mg5", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_mg5", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_mg5", "wpn_fps_upg_fl_utg")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_lmg_mg5", "wpn_fps_upg_ns_ass_smg_tromix")
self:cafcw_add_modpack("ammo", "wpn_fps_lmg_mg5", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
self:cafcw_add_modpack("barrel_ext", "wpn_fps_lmg_mg5", "SneakySuppressorPack", "ARSupp")
self:cafcw_add_modpack("ammo", "wpn_fps_lmg_mg5", "_762x51mm", "MoreAmmoTypes")
end


-- CZ75 auto
if self.wpn_fps_pis_czauto then
if self.parts.wpn_fps_upg_o_deltapoint then
	self.wpn_fps_pis_czauto.override.wpn_fps_upg_o_deltapoint = {parent = "upper_reciever"}
	self.parts.wpn_fps_upg_o_deltapoint.stance_mod.wpn_fps_pis_czauto = {translation = Vector3(0, 0, -1),rotation = Rotation(0, -0.5 ,0)}
	self.wpn_fps_pis_czauto.adds.wpn_fps_upg_o_deltapoint = {"wpn_fps_pis_czauto_irons"}
	self.parts.wpn_fps_pis_czauto_vg_mag.override.wpn_fps_upg_o_deltapoint = {
		stance_mod = {
			wpn_fps_pis_czauto = {translation = Vector3(0, 10, -1),rotation = Rotation(0, -0.5 ,0)}
		}
	}
table.insert(self.wpn_fps_pis_czauto.uses_parts, "wpn_fps_upg_o_deltapoint")
end
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_czauto", "wpn_fps_ass_ns_g_sup1")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_czauto", "wpn_fps_ass_ns_g_sup2")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_czauto", "wpn_fps_ass_ns_g_sup6")
self:cafcw_add_modpack("ammo", "wpn_fps_pis_czauto", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
end 

-- PP2000
if self.wpn_fps_mp_peepee then
self:cafcw_add_to_parts("gadget", "wpn_fps_mp_peepee", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_mp_peepee", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_mp_peepee", "wpn_fps_ass_ns_g_sup3")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_mp_peepee", "wpn_fps_ass_ns_g_sup4")
self:cafcw_add_to_parts("forbids", "wpn_fps_mp_peepee_b_conceal", "wpn_fps_ass_ns_g_sup3")
self:cafcw_add_to_parts("forbids", "wpn_fps_mp_peepee_b_conceal", "wpn_fps_ass_ns_g_sup4")
self:cafcw_add_to_parts("gadget", "wpn_fps_mp_peepee", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_mp_peepee", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_mp_peepee", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_mp_peepee", "wpn_fps_upg_fl_utg")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_mp_peepee", "wpn_fps_upg_ns_ass_smg_tromix")
self:cafcw_add_modpack("ammo", "wpn_fps_mp_peepee", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
end



-- AN-94
if self.wpn_fps_ass_akrocket then
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_kobra", "wpn_fps_upg_o_ak_scopemount", "specter", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_kobra", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_compm4s", "wpn_fps_upg_o_ak_scopemount", "specter", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_compm4s", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_m145", "wpn_fps_upg_o_ak_scopemount", "specter", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_m145", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_pkas", "wpn_fps_upg_o_ak_scopemount", "specter", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_pkas", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_coyote", "wpn_fps_upg_o_ak_scopemount", "specter", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_coyote", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_hologram", "wpn_fps_upg_o_ak_scopemount", "specter", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_hologram", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_zeiss", "wpn_fps_upg_o_ak_scopemount", "specter", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_zeiss", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_okp7", "wpn_fps_upg_o_ak_scopemount", "specter", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_okp7", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_hd33", "wpn_fps_upg_o_ak_scopemount", "specter", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_hd33", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_prismatic", "wpn_fps_upg_o_ak_scopemount", "specter", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_prismatic", "a_o_sm")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_akrocket", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_srs", "wpn_fps_upg_o_ak_scopemount", "specter", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_srs", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_hcog", "wpn_fps_upg_o_ak_scopemount", "specter", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_hcog", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_reflexholo", "wpn_fps_upg_o_ak_scopemount", "specter", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_reflexholo", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_aog", "wpn_fps_upg_o_ak_scopemount", "acog", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_aog", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_rmr_riser", "wpn_fps_upg_o_ak_scopemount", "specter", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_rmr_riser", "a_o_sm")
-- self:cafcw_add_to_parts("sight_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_st10", "specter", "wpn_fps_ass_akrocket", "wpn_fps_ass_akrocket_o_rail")
-- self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_st10", "a_o_sm")
-- if self.parts.wpn_fps_upg_o_st10 then
	-- self.parts.wpn_fps_upg_o_st10.stance_mod.wpn_fps_ass_akrocket = {translation = Vector3(-0.02, -30, -5.97)}
-- end
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_elo", "wpn_fps_upg_o_ak_scopemount", "specter", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_elo", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_po4", "wpn_fps_upg_o_ak_scopemount", "wpn_fps_upg_o_po4", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_po4", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_susat", "wpn_fps_upg_o_ak_scopemount", "wpn_fps_upg_o_susat", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_susat", "a_o_sm")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_akrocket", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_kemper", "wpn_fps_upg_o_ak_scopemount", "specter", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_kemper", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_mepro", "wpn_fps_upg_o_ak_scopemount", "specter", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_mepro", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_rusak", "wpn_fps_upg_o_ak_scopemount", "specter", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_rusak", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_horzine", "wpn_fps_upg_o_ak_scopemount", "specter", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_horzine", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_eotech552", "wpn_fps_upg_o_ak_scopemount", "wpn_fps_upg_o_eotech552", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_eotech552", "a_o_sm")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_akrocket", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_akrocket", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_akrocket", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_akrocket", "wpn_fps_upg_fl_utg")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_visionking", "wpn_fps_upg_o_ak_scopemount", "wpn_fps_upg_o_visionking", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_visionking", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_pka", "wpn_fps_upg_o_ak_scopemount", "specter", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_pka", "a_o_sm")
self:cafcw_add_modpack("ammo", "wpn_fps_ass_akrocket", "_545x39mm", "MoreAmmoTypes")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_anpas13d", "wpn_fps_upg_o_ak_scopemount", "specter", "wpn_fps_smg_akmsu", "wpn_fps_ass_akrocket_o_rail")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_akrocket", "wpn_fps_upg_o_anpas13d", "a_o_sm")
end


--Mosin Custom
if self.wpn_fps_snp_classic then
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_classic", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_classic", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_classic", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_classic", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_classic", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_snp_classic", "wpn_fps_upg_fl_utg")
self:cafcw_add_modpack("ammo", "wpn_fps_snp_classic", "_127x99mm", "IncendiaryAmmo")
self:cafcw_add_custom_sights("specter", "wpn_fps_snp_classic", "wpn_fps_snp_msr")
self:cafcw_add_custom_sights("acog", "wpn_fps_snp_classic", "wpn_fps_snp_msr")
self:cafcw_add_custom_sights("custom", "wpn_fps_snp_classic", "wpn_fps_snp_msr")
self:cafcw_add_custom_sights("custom_sniper", "wpn_fps_snp_classic", "wpn_fps_snp_msr")
self:cafcw_add_custom_sights("shortdot", "wpn_fps_snp_classic", "wpn_fps_snp_msr")
self:cafcw_add_custom_sights("rds45", "wpn_fps_snp_classic", "wpn_fps_snp_msr")
self:cafcw_add_modpack("ammo", "wpn_fps_snp_classic", "_762x54mmr", "MoreAmmoTypes")
end


-- SRM 1216
if self.wpn_fps_shot_m1216 then
if self.parts.wpn_fps_upg_o_kobra then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_kobra")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_kobra = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_kobra.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_o_compm4s then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_compm4s")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_compm4s = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_compm4s.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_o_m145 then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_m145")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_m145 = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_m145.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_o_pkas then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_pkas")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_pkas = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_pkas.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_o_coyote then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_coyote")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_coyote = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_coyote.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_o_acog_rmr then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_acog_rmr")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_acog_rmr = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_acog_rmr.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_o_hologram then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_hologram")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_hologram = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_hologram.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_o_gitsch then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_gitsch")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_gitsch = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_gitsch.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_o_zeiss then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_zeiss")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_zeiss = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_zeiss.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_o_okp7 then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_okp7")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_okp7 = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_okp7.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_o_hd33 then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_hd33")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_hd33 = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_hd33.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_o_prismatic then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_prismatic")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_prismatic = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_prismatic.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_fl_ass_spotter then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_fl_ass_spotter")
end
if self.parts.wpn_fps_upg_o_srs then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_srs")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_srs = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_srs.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_o_st10 then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_st10")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_st10 = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_st10.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_st10.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_o_hcog then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_hcog")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_hcog = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_hcog.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_o_reflexholo then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_reflexholo")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_reflexholo = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_reflexholo.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_o_aog then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_aog")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_aog = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_aog.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_o_rmr_riser then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_rmr_riser")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_rmr_riser = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_rmr_riser.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_o_elo then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_elo")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_elo = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_elo.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_o_po4 then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_po4")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_po4 = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_po4.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_po4.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_o_susat then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_susat")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_susat = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_susat.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_susat.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_fl_wml then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_fl_wml")
end
if self.parts.wpn_fps_upg_o_kemper then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_kemper")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_kemper = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_kemper.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_o_mepro then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_mepro")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_mepro = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_mepro.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_o_rusak then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_rusak")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_rusak = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_rusak.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_o_horzine then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_horzine")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_horzine = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_horzine.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_coal)
end
if self.parts.wpn_fps_upg_o_eotech552 then
table.insert(self.wpn_fps_shot_m1216.uses_parts, "wpn_fps_upg_o_eotech552")
	self.wpn_fps_shot_m1216.adds.wpn_fps_upg_o_eotech552 = {
		"wpn_fps_shot_m1216_irons_front_folded",
		"wpn_fps_shot_m1216_o_adjust"
	}
	self.parts.wpn_fps_upg_o_eotech552.stance_mod.wpn_fps_shot_m1216 = deep_clone(self.parts.wpn_fps_upg_o_eotech552.stance_mod.wpn_fps_smg_coal)
end
end


-- Calico SMG
if self.wpn_fps_smg_calico then
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_calico", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_calico", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_calico", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_calico", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_calico", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_calico", "wpn_fps_upg_fl_utg")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_calico", "wpn_fps_upg_ns_ass_smg_tromix")
self:cafcw_add_modpack("barrel_ext", "wpn_fps_smg_calico", "SneakySuppressorPack", "ARSupp")
self:cafcw_add_custom_sights("specter", "wpn_fps_smg_calico", "wpn_fps_smg_p90", "wpn_fps_smg_calico_o_adjust")
self:cafcw_add_custom_sights("acog", "wpn_fps_smg_calico", "wpn_fps_smg_p90", "wpn_fps_smg_calico_o_adjust")
self:cafcw_add_custom_sights("custom", "wpn_fps_smg_calico", "wpn_fps_smg_p90", "wpn_fps_smg_calico_o_adjust")
end


-- Fusil Automatico Doble (FAD)
if self.wpn_fps_ass_fusil then
self:cafcw_add_to_parts("magazine", "wpn_fps_ass_fusil", "wpn_fps_upg_m4_m_20rnd")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_fusil", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_fusil", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_fusil", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_fusil", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_fusil", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_fusil", "wpn_fps_upg_fl_utg")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_fusil", "wpn_fps_upg_ns_ass_smg_tromix")
self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_fusil", "SneakySuppressorPack", "ARSupp")
self:cafcw_add_custom_sights("specter", "wpn_fps_ass_fusil", "wpn_fps_ass_corgi", "wpn_fps_ass_fusil_o_adjust")
self:cafcw_add_custom_sights("acog", "wpn_fps_ass_fusil", "wpn_fps_ass_corgi", "wpn_fps_ass_fusil_o_adjust")
self:cafcw_add_custom_sights("custom", "wpn_fps_ass_fusil", "wpn_fps_ass_corgi", "wpn_fps_ass_fusil_o_adjust")
self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_fusil", "wpn_fps_ass_corgi")
self:cafcw_add_modpack("ammo", "wpn_fps_ass_fusil", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
end


-- M14E2
if self.wpn_fps_ass_m14e2 then
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_m14e2", "wpn_fps_upg_ns_ass_smg_tromix")

self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_m14e2", "wpn_fps_ass_m14", "wpn_fps_ass_m14e2_offset_sight_rail")

self:cafcw_add_to_parts("gadget", "wpn_fps_ass_m14e2", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_m14e2", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_m14e2", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_m14e2", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_m14e2", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_ass_m14e2", "wpn_fps_upg_fl_utg")

self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_m14e2_gl_m203", "wpn_fps_upg_fl_ass_spotter", "a_fl_m203")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_m14e2_gl_m203", "wpn_fps_upg_fl_wml", "a_fl_m203")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_m14e2_gl_m203", "wpn_fps_upg_fl_anpeq2", "a_fl_m203")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_m14e2_gl_m203", "wpn_fps_upg_fl_dbal_d2", "a_fl_m203")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_m14e2_gl_m203", "wpn_fps_upg_fl_m600p", "a_fl_m203")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_m14e2_gl_m203", "wpn_fps_upg_fl_utg", "a_fl_m203")
self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_m14e2", "SneakySuppressorPack", "ARSupp")
self:cafcw_add_modpack("ammo", "wpn_fps_ass_m14e2", "_762x51mm", "MoreAmmoTypes")
--Not yet tested
-- self:cafcw_add_to_parts("other", "wpn_fps_ass_m14e2", "wpn_fps_shield_dmr")
-- self:cafcw_add_to_parts("other", "wpn_fps_ass_m14e2", "wpn_fps_shield_skin_ftp")
-- self:cafcw_add_to_parts("other", "wpn_fps_ass_m14e2", "wpn_fps_shield_skin_urban")

--M14E2 tried to replicate what Black Ops 1 M14 optic have, so most of the custom optic is disabled. This is placed for backup, or if I change my mind later.
--[[
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_kobra", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_m14e2_scope_mount")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_kobra", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_compm4s", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_m14e2_scope_mount")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_compm4s", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_m145", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_m14e2_scope_mount")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_m145", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_pkas", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_m14e2_scope_mount")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_pkas", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_coyote", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_m14e2_scope_mount")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_coyote", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_hologram", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_m14e2_scope_mount")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_hologram", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_zeiss", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_m14e2_scope_mount")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_zeiss", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_okp7", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_m14e2_scope_mount")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_okp7", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_hd33", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_m14e2_scope_mount")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_hd33", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_prismatic", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_m14e2_scope_mount")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_prismatic", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_srs", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_m14e2_scope_mount")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_srs", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_hcog", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_m14e2_scope_mount")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_hcog", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_reflexholo", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_m14e2_scope_mount")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_reflexholo", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_aog", "wpn_fps_upg_o_m14_scopemount", "acog", "wpn_fps_ass_m14", "wpn_fps_ass_m14e2_scope_mount")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_aog", "a_o_sm")
-- self:cafcw_add_to_parts("sight_rail", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_st10", "specter", "wpn_fps_ass_m14e2", "wpn_fps_ass_rk62_rail")
-- self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_st10", "a_o_sm")
-- if self.parts.wpn_fps_upg_o_st10 then
	-- self.parts.wpn_fps_upg_o_st10.stance_mod.wpn_fps_ass_m14e2 = {translation = Vector3(-0.02, -30, -5.97)}
-- end
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_elo", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_m14e2_scope_mount")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_elo", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_po4", "wpn_fps_upg_o_m14_scopemount", "wpn_fps_upg_o_po4", "wpn_fps_ass_m14", "wpn_fps_ass_m14e2_scope_mount")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_po4", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_susat", "wpn_fps_upg_o_m14_scopemount", "wpn_fps_upg_o_susat", "wpn_fps_ass_m14", "wpn_fps_ass_m14e2_scope_mount")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_susat", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_kemper", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_m14e2_scope_mount")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_kemper", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_mepro", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_m14e2_scope_mount")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_mepro", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_rusak", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_m14e2_scope_mount")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_rusak", "a_o_sm")
-- self:cafcw_add_to_parts("sight", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_delta_rm55", "wpn_fps_upg_o_45rds", "wpn_fps_ass_m14")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_horzine", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_ass_m14e2_scope_mount")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_horzine", "a_o_sm")
self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_eotech552", "wpn_fps_upg_o_m14_scopemount", "wpn_fps_upg_o_eotech552", "wpn_fps_ass_m14", "wpn_fps_ass_m14e2_scope_mount")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_ass_m14e2", "wpn_fps_upg_o_eotech552", "a_o_sm")
]]--

end


-- Stinger Launcher
if self.wpn_fps_stinger then
self:cafcw_add_to_parts("gadget_rail", "wpn_fps_stinger", "wpn_fps_upg_fl_ass_spotter", "wpn_fps_addon_ris")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_stinger", "wpn_fps_upg_fl_ass_spotter", "a_fl_stinger")
self:cafcw_add_to_parts("gadget_rail", "wpn_fps_stinger", "wpn_fps_upg_fl_anpeq2", "wpn_fps_addon_ris")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_stinger", "wpn_fps_upg_fl_anpeq2", "a_fl_stinger")
self:cafcw_add_to_parts("gadget_rail", "wpn_fps_stinger", "wpn_fps_upg_fl_dbal_d2", "wpn_fps_addon_ris")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_stinger", "wpn_fps_upg_fl_dbal_d2", "a_fl_stinger")
self:cafcw_add_to_parts("gadget_rail", "wpn_fps_stinger", "wpn_fps_upg_fl_m600p", "wpn_fps_addon_ris")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_stinger", "wpn_fps_upg_fl_m600p", "a_fl_stinger")
self:cafcw_add_to_parts("gadget_rail", "wpn_fps_stinger", "wpn_fps_upg_fl_utg", "wpn_fps_addon_ris")
self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_stinger", "wpn_fps_upg_fl_utg", "a_fl_stinger")
end


--PM-98 Glau
if self.wpn_fps_smg_glau then
self:cafcw_add_modpack("barrel_ext", "wpn_fps_smg_glau", "SneakySuppressorPack", "ARSupp")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_glau", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_glau", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_glau", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_glau", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_glau", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_smg_glau", "wpn_fps_upg_fl_utg")
self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_glau", "wpn_fps_upg_ns_ass_smg_tromix")
self:cafcw_add_modpack("ammo", "wpn_fps_smg_glau", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
self:cafcw_add_custom_sights("specter", "wpn_fps_smg_glau", "wpn_fps_smg_uzi", "wpn_fps_smg_glau_o_adjust")
self:cafcw_add_custom_sights("acog", "wpn_fps_smg_glau", "wpn_fps_smg_uzi", "wpn_fps_smg_glau_o_adjust")
self:cafcw_add_custom_sights("custom", "wpn_fps_smg_glau", "wpn_fps_smg_uzi", "wpn_fps_smg_glau_o_adjust")
self:cafcw_add_custom_sights("rds45", "wpn_fps_smg_glau", "wpn_fps_smg_uzi")
end


--Inkunzi PAW
if self.wpn_fps_special_inkunzi then
self:cafcw_add_to_parts("gadget", "wpn_fps_special_inkunzi", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_special_inkunzi", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("gadget", "wpn_fps_special_inkunzi", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_special_inkunzi", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_special_inkunzi", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_special_inkunzi", "wpn_fps_upg_fl_utg")
self:cafcw_add_custom_sights("specter", "wpn_fps_special_inkunzi", "wpn_fps_ass_g3", nil, "0.025,-8,-0.42")
self:cafcw_add_custom_sights("acog", "wpn_fps_special_inkunzi", "wpn_fps_ass_g3", nil, "0.025,-5,-0.42")
self:cafcw_add_custom_sights("custom", "wpn_fps_special_inkunzi", "wpn_fps_ass_g3", nil, "0,0,3")
self:cafcw_add_custom_sights("rds45", "wpn_fps_special_inkunzi", "wpn_fps_ass_g3", nil, "3.48,-10,-8.46")
end


--SMG12
if self.wpn_fps_mp_master then
self:cafcw_add_to_parts("gadget", "wpn_fps_mp_master", "wpn_fps_upg_fl_ass_spotter")
self:cafcw_add_to_parts("gadget", "wpn_fps_mp_master", "wpn_fps_upg_fl_wml")
self:cafcw_add_to_parts("gadget", "wpn_fps_mp_master", "wpn_fps_upg_fl_anpeq2")
self:cafcw_add_to_parts("gadget", "wpn_fps_mp_master", "wpn_fps_upg_fl_dbal_d2")
self:cafcw_add_to_parts("gadget", "wpn_fps_mp_master", "wpn_fps_upg_fl_m600p")
self:cafcw_add_to_parts("gadget", "wpn_fps_mp_master", "wpn_fps_upg_fl_utg")
self:cafcw_add_custom_sights("specter", "wpn_fps_mp_master", "wpn_fps_smg_mac10", nil, "0,-4.25,-0.75")
self:cafcw_add_custom_sights("acog", "wpn_fps_mp_master", "wpn_fps_smg_mac10", nil, "0,-4.25,-0.75")
self:cafcw_add_custom_sights("custom", "wpn_fps_mp_master", "wpn_fps_smg_mac10", nil, "0,5.75,2.35")
end





--Custom Attachment

-- FAMAS Feline
if self.parts.wpn_fps_ass_famas_body_feline then
	if self.parts.wpn_fps_ass_famas_o_adapter_long then
	self.parts.wpn_fps_ass_famas_body_feline.override.wpn_fps_ass_famas_o_adapter_long = {stance_mod = { wpn_fps_ass_famas = {translation = Vector3(0, 10, 2)} },a_obj = "a_o_feline"}
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_ass_famas_o_m4flipup", "a_o_feline")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_ass_famas_o_scorpionevo", "a_o_feline")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_ass_famas_o_troy", "a_o_feline")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_ass_famas_o_troy_dot", "a_o_feline")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_ass_famas_o_troym4", "a_o_feline")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_ass_famas_o_bf4flipup", "a_o_feline")
	if self.parts.wpn_fps_ass_famas_o_mbus then
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_ass_famas_o_mbus", "a_o_feline")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_ass_famas_o_dd_a1", "a_o_feline")
	end
	end
	if self.parts.wpn_fps_upg_45rail then
	self.parts.wpn_fps_ass_famas_body_feline.override.wpn_fps_upg_o_45dd = {stance_mod = { wpn_fps_ass_famas = {translation = Vector3(-0.353, 0, -18.85),rotation = Rotation(0, 0, -45)} },a_obj = "a_o_feline"}
	self.parts.wpn_fps_ass_famas_body_feline.override.wpn_fps_upg_o_45mbus = {stance_mod = { wpn_fps_ass_famas = {translation = Vector3(-0.353, 0, -18.85),rotation = Rotation(0, 0, -45)} },a_obj = "a_o_feline"}
	self.parts.wpn_fps_ass_famas_body_feline.override.wpn_fps_upg_o_45troy = {stance_mod = { wpn_fps_ass_famas = {translation = Vector3(-0.353, 0, -18.85),rotation = Rotation(0, 0, -45)} },a_obj = "a_o_feline"}
	self.parts.wpn_fps_ass_famas_body_feline.override.wpn_fps_upg_o_45flipup = {stance_mod = { wpn_fps_ass_famas = {translation = Vector3(-0.353, 0, -18.85),rotation = Rotation(0, 0, -45)} },a_obj = "a_o_feline"}
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_45rail", "a_o_feline")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_45mbus_il", "a_o_feline")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_45troy_il", "a_o_feline")
	end
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_kobra", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_compm4s", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_m145", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_pkas", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_coyote", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_acog_rmr", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_hologram", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_zeiss", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_okp7", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_hd33", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_prismatic", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_srs", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_st10", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_hcog", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_reflexholo", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_aog", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_rmr_riser", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_elo", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_po4", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_susat", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_kemper", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_mepro", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_rusak", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_horzine", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_eotech552", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_fl_ass_spotter", "a_fl_feline2")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_fl_wml", "a_fl_feline2")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_fl_anpeq2", "a_fl_feline2")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_fl_utg", "a_fl_feline2")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_fl_dbal_d2", "a_fl_feline2")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_fl_m600p", "a_fl_feline2")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_visionking", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_pka", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_anpas13d", "a_o_feline")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_famas_body_feline", "wpn_fps_upg_o_compm2", "a_o_feline")
end

-- VHS Future
if self.parts.wpn_fps_ass_vhs_body_future then
	if self.parts.wpn_fps_upg_45rail then
	self.parts.wpn_fps_ass_vhs_body_future.override.wpn_fps_upg_o_45dd = {stance_mod = { wpn_fps_ass_famas = {translation = Vector3(-0.353, 0, -18.85),rotation = Rotation(0, 0, -45)} },a_obj = "a_o_future"}
	self.parts.wpn_fps_ass_vhs_body_future.override.wpn_fps_upg_o_45mbus = {stance_mod = { wpn_fps_ass_famas = {translation = Vector3(-0.353, 0, -18.85),rotation = Rotation(0, 0, -45)} },a_obj = "a_o_future"}
	self.parts.wpn_fps_ass_vhs_body_future.override.wpn_fps_upg_o_45troy = {stance_mod = { wpn_fps_ass_famas = {translation = Vector3(-0.353, 0, -18.85),rotation = Rotation(0, 0, -45)} },a_obj = "a_o_future"}
	self.parts.wpn_fps_ass_vhs_body_future.override.wpn_fps_upg_o_45flipup = {stance_mod = { wpn_fps_ass_famas = {translation = Vector3(-0.353, 0, -18.85),rotation = Rotation(0, 0, -45)} },a_obj = "a_o_future"}
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_45rail", "a_o_future")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_45mbus_il", "a_o_future")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_45troy_il", "a_o_future")
	end
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_kobra", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_compm4s", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_m145", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_pkas", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_coyote", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_acog_rmr", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_hologram", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_zeiss", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_okp7", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_hd33", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_prismatic", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_srs", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_st10", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_hcog", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_reflexholo", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_aog", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_rmr_riser", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_elo", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_po4", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_susat", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_kemper", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_mepro", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_rusak", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_horzine", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_eotech552", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_visionking", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_pka", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_anpas13d", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
self:cafcw_add_to_parts("part_a_obj_adds_ovr", "wpn_fps_ass_vhs_body_future", "wpn_fps_upg_o_compm2", "a_o_future", "wpn_fps_ass_vhs_o_adjust_future")
end

-- Mk20 SSR
if self.parts.wpn_fps_ass_scar_body_ssr then

local scar20_o_custom = {
	"wpn_fps_upg_o_kobra",
	"wpn_fps_upg_o_compm4s",
	"wpn_fps_upg_o_m145",
	"wpn_fps_upg_o_pkas",
	"wpn_fps_upg_o_coyote",
	"wpn_fps_upg_o_acog_rmr",
	"wpn_fps_upg_o_hologram",
	"wpn_fps_upg_o_gitsch",
	"wpn_fps_upg_o_zeiss",
	"wpn_fps_upg_o_okp7",
	"wpn_fps_upg_o_hd33",
	"wpn_fps_upg_o_prismatic",
	"wpn_fps_upg_o_srs",
	"wpn_fps_upg_o_st10",
	"wpn_fps_upg_o_hcog",
	"wpn_fps_upg_o_reflexholo",
	"wpn_fps_upg_o_aog",
	"wpn_fps_upg_o_rmr_riser",
	"wpn_fps_upg_o_elo",
	"wpn_fps_upg_o_po4",
	"wpn_fps_upg_o_susat",
	"wpn_fps_upg_o_kemper",
	"wpn_fps_upg_o_mepro",
	"wpn_fps_upg_o_rusak",
	"wpn_fps_upg_o_horzine",
	"wpn_fps_upg_o_eotech552",
	"wpn_fps_upg_o_visionking",
	"wpn_fps_upg_o_pka",
	"wpn_fps_upg_o_anpas13d",
	"wpn_fps_upg_o_delta_rm55"
}
for i, sight_id in ipairs(scar20_o_custom) do
	if self.parts[sight_id] then
		self.parts[sight_id].override = self.parts[sight_id].override or {}
		self.parts.wpn_fps_ass_scar_body_ssr.override[sight_id] = self.parts.wpn_fps_ass_scar_body_ssr.override[sight_id] or {}
		self.parts.wpn_fps_ass_scar_body_ssr.override[sight_id].override = self.parts.wpn_fps_ass_scar_body_ssr.override[sight_id].override or {}
		self.parts.wpn_fps_ass_scar_body_ssr.override[sight_id].override.wpn_fps_ass_scar_irons_ssr = {
			stance_mod = {
				wpn_fps_ass_scar = {
					translation = Vector3(0, 0, 0)
				}
			}
		}
	end
end

end


-- M240 Various Attch
if self.parts.wpn_fps_lmg_par_fg_heat then
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_lmg_par_fg_heat", "wpn_fps_upg_fl_ass_spotter", "a_fl_heat")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_lmg_par_fg_heat", "wpn_fps_upg_fl_wml", "a_fl_heat")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_lmg_par_fg_heat", "wpn_fps_upg_fl_anpeq2", "a_fl_heat")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_lmg_par_fg_heat", "wpn_fps_upg_fl_dbal_d2", "a_fl_heat")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_lmg_par_fg_heat", "wpn_fps_upg_fl_m600p", "a_fl_heat")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_lmg_par_fg_heat", "wpn_fps_upg_fl_utg", "a_fl_heat")
end


-- M16 Carry Handle Rail
if self.parts.wpn_fps_upg_o_carrymount then
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_kobra", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_compm4s", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_m145", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_pkas", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_coyote", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_acog_rmr", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_hologram", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_gitsch", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_zeiss", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_okp7", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_hd33", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_prismatic", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_srs", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_st10", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_hcog", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_reflexholo", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_aog", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_rmr_riser", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_elo", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_po4", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_susat", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_kemper", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_mepro", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_rusak", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_horzine", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_eotech552", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_visionking", "a_o_sm")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_upg_o_carrymount", "wpn_fps_upg_o_pka", "a_o_sm")
end


end)