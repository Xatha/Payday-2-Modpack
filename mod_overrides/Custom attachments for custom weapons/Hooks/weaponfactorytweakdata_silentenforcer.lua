Hooks:PostHook(WeaponFactoryTweakData, "create_bonuses", "CAFCWMod_SilentEnforcer_Init", function(self)
--Spectre M4
if self.wpn_fps_smg_spectre_m4 then
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_smg_spectre_m4", "wpn_fps_upg_fl_ass_spotter", "wpn_fps_smg_spectre_m4_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_smg_spectre_m4", "wpn_fps_upg_fl_wml", "wpn_fps_smg_spectre_m4_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_smg_spectre_m4", "wpn_fps_upg_fl_anpeq2", "wpn_fps_smg_spectre_m4_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_smg_spectre_m4", "wpn_fps_upg_fl_dbal_d2", "wpn_fps_smg_spectre_m4_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_smg_spectre_m4", "wpn_fps_upg_fl_m600p", "wpn_fps_smg_spectre_m4_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_smg_spectre_m4", "wpn_fps_upg_fl_utg", "wpn_fps_smg_spectre_m4_gadget_rail")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_spectre_m4", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("ammo", "wpn_fps_smg_spectre_m4", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_smg_spectre_m4", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_custom_sights("specter", "wpn_fps_smg_spectre_m4", "wpn_fps_smg_tec9", "wpn_fps_smg_spectre_m4_o_adapter")
	self:cafcw_add_custom_sights("acog", "wpn_fps_smg_spectre_m4", "wpn_fps_smg_tec9", "wpn_fps_smg_spectre_m4_o_adapter")
	self:cafcw_add_custom_sights("custom", "wpn_fps_smg_spectre_m4", "wpn_fps_smg_tec9", "wpn_fps_smg_spectre_m4_o_adapter")
end
if self.wpn_fps_smg_x_spectre_m4 then
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_smg_x_spectre_m4", "wpn_fps_upg_fl_ass_spotter", "wpn_fps_smg_spectre_m4_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_smg_x_spectre_m4", "wpn_fps_upg_fl_wml", "wpn_fps_smg_spectre_m4_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_smg_x_spectre_m4", "wpn_fps_upg_fl_anpeq2", "wpn_fps_smg_spectre_m4_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_smg_x_spectre_m4", "wpn_fps_upg_fl_dbal_d2", "wpn_fps_smg_spectre_m4_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_smg_x_spectre_m4", "wpn_fps_upg_fl_m600p", "wpn_fps_smg_spectre_m4_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_smg_x_spectre_m4", "wpn_fps_upg_fl_utg", "wpn_fps_smg_spectre_m4_gadget_rail")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_x_spectre_m4", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("ammo", "wpn_fps_smg_x_spectre_m4", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_smg_x_spectre_m4", "SneakySuppressorPack", "ARSupp")
end

--TOZ-194
if self.wpn_fps_shot_toz194 then
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_toz194", "wpn_fps_upg_fl_ass_spotter", "wpn_fps_shot_toz194_gadget_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_toz194_fb_short", "wpn_fps_upg_fl_ass_spotter", "a_sfl")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_toz194", "wpn_fps_upg_fl_wml", "wpn_fps_shot_toz194_gadget_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_toz194_fb_short", "wpn_fps_upg_fl_wml", "a_sfl")
	self:cafcw_add_to_parts("other", "wpn_fps_shot_toz194", "wpn_fps_upg_ns_sho_salvo_small")
	self:cafcw_add_to_parts("other", "wpn_fps_shot_toz194", "wpn_fps_upg_ns_shot_cat")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_toz194", "wpn_fps_upg_fl_anpeq2", "wpn_fps_shot_toz194_gadget_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_toz194_fb_short", "wpn_fps_upg_fl_anpeq2", "a_sfl")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_toz194", "wpn_fps_upg_fl_dbal_d2", "wpn_fps_shot_toz194_gadget_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_toz194_fb_short", "wpn_fps_upg_fl_dbal_d2", "a_sfl")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_toz194", "wpn_fps_upg_fl_m600p", "wpn_fps_shot_toz194_gadget_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_toz194_fb_short", "wpn_fps_upg_fl_m600p", "a_sfl")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_toz194", "wpn_fps_upg_fl_utg", "wpn_fps_shot_toz194_gadget_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_toz194_fb_short", "wpn_fps_upg_fl_utg", "a_sfl")
	self:cafcw_add_modpack("ammo", "wpn_fps_shot_toz194", "_12ga", "TaserAmmo_MoreAmmoTypes")
	self:cafcw_add_custom_sights("specter", "wpn_fps_shot_toz194", "wpn_fps_shot_r870", "wpn_fps_shot_toz194_ris_special")
	self:cafcw_add_custom_sights("acog", "wpn_fps_shot_toz194", "wpn_fps_shot_r870", "wpn_fps_shot_toz194_ris_special")
	self:cafcw_add_custom_sights("custom", "wpn_fps_shot_toz194", "wpn_fps_shot_r870", "wpn_fps_shot_toz194_ris_special")
end

--QBZ-95
if self.wpn_fps_ass_qbz95 and self.parts.wpn_fps_ass_qbz95_fg_rails then
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_kobra", "a_fgo")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_compm4s", "a_fgo")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_m145", "a_fgo")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_pkas", "a_fgo")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_coyote", "a_fgo")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_acog_rmr", "a_fgo")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_hologram", "a_fgo")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_gitsch", "a_fgo")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_zeiss", "a_fgo")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_okp7", "a_fgo")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_hd33", "a_fgo")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_prismatic", "a_fgo")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_qbz95", "wpn_fps_upg_fl_ass_spotter")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_fl_ass_spotter", "a_fgfl")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_srs", "a_fgo")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_hcog", "a_fgo")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_reflexholo", "a_fgo")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_aog", "a_fgo")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_rmr_riser", "a_fgo")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_elo", "a_fgo")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_qbz95", "wpn_fps_upg_fl_wml")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_fl_wml", "a_fgfl")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_mepro", "a_fgo")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_rusak", "a_fgo")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_qbz95", "wpn_fps_shield_bullpup")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_qbz95", "wpn_fps_shield_skin_ftp")
	self:cafcw_add_to_parts("other", "wpn_fps_ass_qbz95", "wpn_fps_shield_skin_urban")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_horzine", "a_fgo")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_qbz95", "wpn_fps_upg_fl_anpeq2")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_fl_anpeq2", "a_fgfl")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_qbz95", "wpn_fps_upg_fl_dbal_d2")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_fl_dbal_d2", "a_fgfl")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_qbz95", "wpn_fps_upg_fl_m600p")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_fl_m600p", "a_fgfl")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_qbz95", "wpn_fps_upg_fl_utg")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_fl_utg", "a_fgfl")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_qbz95", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_qbz95", "SneakySuppressorPack", "ARSupp")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_pka", "a_fgo")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_anpas13d", "a_fgo")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_qbz95", "wpn_fps_ass_qbz95", "wpn_fps_ass_qbz95_rail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_qbz95", "wpn_fps_ass_qbz95", "wpn_fps_ass_qbz95_rail")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_ass_qbz95_fg_rails", "wpn_fps_upg_o_compm2", "a_fgo")
    end

--STG 44
if self.wpn_fps_ass_stg44 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_stg44", "wpn_fps_upg_fl_ass_spotter")
    self:cafcw_add_to_parts("gadget", "wpn_fps_ass_stg44", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_stg44", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_stg44", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_stg44", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_stg44", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_stg44", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_stg44", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_stg44", "wpn_fps_ass_g3", "wpn_fps_ass_stg44_ris_special")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_stg44", "wpn_fps_ass_g3", "wpn_fps_ass_stg44_ris_special")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_stg44", "wpn_fps_ass_g3", "wpn_fps_ass_stg44_ris_special")
    end
	

--Mossberg 590
if self.wpn_fps_shot_m590 then
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_m590", "wpn_fps_upg_fl_ass_spotter", "wpn_fps_shot_m590_gadget_rail")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_m590_gadget_rail", "wpn_fps_upg_fl_ass_spotter", "a_fl_under2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_m590", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_m590_gadget_rail", "wpn_fps_upg_fl_wml", "a_fl_under")
	self:cafcw_add_to_parts("other", "wpn_fps_shot_m590", "wpn_fps_upg_ns_sho_salvo_small")
	self:cafcw_add_to_parts("other", "wpn_fps_shot_m590", "wpn_fps_upg_ns_shot_cat")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_m590", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_m590_gadget_rail", "wpn_fps_upg_fl_anpeq2", "a_fl_under")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_m590", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_m590_gadget_rail", "wpn_fps_upg_fl_dbal_d2", "a_fl_under")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_m590", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_m590_gadget_rail", "wpn_fps_upg_fl_m600p", "a_fl_under2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_m590", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_m590_gadget_rail", "wpn_fps_upg_fl_utg", "a_fl_under")
	self:cafcw_add_modpack("ammo", "wpn_fps_shot_m590", "_12ga", "TaserAmmo_MoreAmmoTypes")
if self.parts.wpn_fps_upg_o_po4 then
table.insert(self.wpn_fps_shot_m590.uses_parts, "wpn_fps_upg_o_po4")
	self.wpn_fps_shot_m590.adds.wpn_fps_upg_o_po4 = {"wpn_fps_shot_m590_ris_special"}
	self.wpn_fps_shot_m590.override.wpn_fps_upg_o_po4 = {stance_mod = {wpn_fps_shot_m590 = {translation = Vector3(0.2, 4, -2.5)}}}
end
if self.parts.wpn_fps_upg_o_susat then
table.insert(self.wpn_fps_shot_m590.uses_parts, "wpn_fps_upg_o_susat")
	self.wpn_fps_shot_m590.adds.wpn_fps_upg_o_susat = {"wpn_fps_shot_m590_ris_special"}
	self.parts.wpn_fps_upg_o_susat.stance_mod.wpn_fps_shot_m590 = {stance_mod = {wpn_fps_shot_m590 = {translation = Vector3(-0, 2, -3.7) + Vector3(0, 4, -1.335)}}}
end

if self.parts.wpn_fps_upg_o_eotech552 then
table.insert(self.wpn_fps_shot_m590.uses_parts, "wpn_fps_upg_o_eotech552")
	self.wpn_fps_shot_m590.adds.wpn_fps_upg_o_eotech552 = {"wpn_fps_shot_m590_ris_special"}
	self.wpn_fps_shot_m590.override.wpn_fps_upg_o_eotech552 = {stance_mod = {wpn_fps_shot_m590 = {translation = Vector3(-0, 4, -3.7) + Vector3(0, 0, 0.335)}}}
end
	self:cafcw_add_custom_sights("specter", "wpn_fps_shot_m590", "wpn_fps_shot_m590", "wpn_fps_shot_m590_ris_special")
	self:cafcw_add_custom_sights("acog", "wpn_fps_shot_m590", "wpn_fps_shot_m590", "wpn_fps_shot_m590_ris_special")
end

--QBZ-03
if self.wpn_fps_ass_qbz3 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_qbz3", "wpn_fps_upg_fl_ass_spotter")
    self:cafcw_add_to_parts("gadget", "wpn_fps_ass_qbz3", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_qbz3", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_qbz3", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_qbz3", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_qbz3", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_qbz3", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_qbz3", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_qbz3", "wpn_fps_ass_74", "wpn_fps_ass_qbz3_mount")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_qbz3", "wpn_fps_ass_74", "wpn_fps_ass_qbz3_mount")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_qbz3", "wpn_fps_ass_74", "wpn_fps_ass_qbz3_mount")
    end
  
--Fort-500
if self.wpn_fps_shot_f500 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_f500", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_f500", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("other", "wpn_fps_shot_f500", "wpn_fps_upg_ns_sho_salvo_small")
	self:cafcw_add_to_parts("other", "wpn_fps_shot_f500", "wpn_fps_upg_ns_shot_cat")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_f500", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_f500", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_f500", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_f500", "wpn_fps_upg_fl_utg")
	self:cafcw_add_modpack("ammo", "wpn_fps_shot_f500", "_12ga", "TaserAmmo_MoreAmmoTypes")
	self:cafcw_add_custom_sights("specter", "wpn_fps_shot_f500", "wpn_fps_shot_r870", "wpn_fps_shot_f500_ris_special")
	self:cafcw_add_custom_sights("acog", "wpn_fps_shot_f500", "wpn_fps_shot_r870", "wpn_fps_shot_f500_ris_special")
	self:cafcw_add_custom_sights("custom", "wpn_fps_shot_f500", "wpn_fps_shot_r870", "wpn_fps_shot_f500_ris_special")
end

-- Makarov
if self.wpn_fps_pis_pm then
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_pm", "wpn_fps_ass_ns_g_sup1")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_pm", "wpn_fps_ass_ns_g_sup2")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_pm", "wpn_fps_ass_ns_g_sup6")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_pm", "wpn_fps_upg_fl_unimax", "wpn_fps_pis_pm_fl_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_pm", "wpn_fps_upg_fl_utg_pis", "wpn_fps_pis_pm_fl_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_pm", "wpn_fps_upg_fl_micro90", "wpn_fps_pis_pm_fl_rail")
	self:cafcw_add_modpack("ammo", "wpn_fps_pis_pm", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
end
if self.wpn_fps_pis_x_pm then
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_x_pm", "wpn_fps_ass_ns_g_sup1")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_x_pm", "wpn_fps_ass_ns_g_sup2")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_x_pm", "wpn_fps_ass_ns_g_sup6")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_x_pm", "wpn_fps_upg_fl_unimax", "wpn_fps_pis_pm_fl_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_x_pm", "wpn_fps_upg_fl_utg_pis", "wpn_fps_pis_pm_fl_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_x_pm", "wpn_fps_upg_fl_micro90", "wpn_fps_pis_pm_fl_rail")
	self:cafcw_add_modpack("ammo", "wpn_fps_pis_x_pm", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
end
if self.wpn_fps_pis_xs_pm then
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_xs_pm", "wpn_fps_ass_ns_g_sup1")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_xs_pm", "wpn_fps_ass_ns_g_sup2")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_pis_xs_pm", "wpn_fps_ass_ns_g_sup6")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_xs_pm", "wpn_fps_upg_fl_unimax", "wpn_fps_pis_pm_fl_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_xs_pm", "wpn_fps_upg_fl_utg_pis", "wpn_fps_pis_pm_fl_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_xs_pm", "wpn_fps_upg_fl_micro90", "wpn_fps_pis_pm_fl_rail")
	self:cafcw_add_modpack("ammo", "wpn_fps_pis_xs_pm", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
end

-- QBS-09
if self.wpn_fps_shot_qbs then
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_qbs", "wpn_fps_upg_fl_ass_spotter", "wpn_fps_shot_qbs_gadget_rail")
	self:cafcw_add_to_parts("sight", "wpn_fps_shot_qbs", "wpn_fps_upg_o_po4", "wpn_fps_upg_o_po4", "wpn_fps_sho_ben")
	self:cafcw_add_to_parts("sight", "wpn_fps_shot_qbs", "wpn_fps_upg_o_susat", "wpn_fps_upg_o_susat", "wpn_fps_sho_ben")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_qbs", "wpn_fps_upg_fl_wml", "wpn_fps_shot_qbs_gadget_rail")
	self:cafcw_add_to_parts("sight", "wpn_fps_shot_qbs", "wpn_fps_upg_o_eotech552", "wpn_fps_upg_o_eotech552", "wpn_fps_sho_ben")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_qbs", "wpn_fps_upg_fl_anpeq2", "wpn_fps_shot_qbs_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_qbs", "wpn_fps_upg_fl_dbal_d2", "wpn_fps_shot_qbs_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_qbs", "wpn_fps_upg_fl_m600p", "wpn_fps_shot_qbs_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_shot_qbs", "wpn_fps_upg_fl_utg", "wpn_fps_shot_qbs_gadget_rail")
	self:cafcw_add_modpack("ammo", "wpn_fps_shot_qbs", "_12ga_auto", "TaserAmmo")
	self:cafcw_add_custom_sights("specter", "wpn_fps_shot_qbs", "wpn_fps_sho_ben")
	self:cafcw_add_custom_sights("acog", "wpn_fps_shot_qbs", "wpn_fps_sho_ben")
end

--Auto-Crossbow
if self.wpn_fps_bow_auto then
	self:cafcw_add_to_parts("gadget", "wpn_fps_bow_auto", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_bow_auto", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("other", "wpn_fps_bow_auto", "wpn_fps_taserslug")
	self:cafcw_add_to_parts("gadget", "wpn_fps_bow_auto", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_bow_auto", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_bow_auto", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_bow_auto", "wpn_fps_upg_fl_utg")
	self:cafcw_add_custom_sights("specter", "wpn_fps_bow_auto", "wpn_fps_smg_coal")
	self:cafcw_add_custom_sights("acog", "wpn_fps_bow_auto", "wpn_fps_smg_coal")
	self:cafcw_add_custom_sights("custom", "wpn_fps_bow_auto", "wpn_fps_smg_coal")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_bow_auto", "wpn_fps_upg_o_ekp_1s_03", "0.49,5,-3.9")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_bow_auto", "wpn_fps_upg_o_pso1_rifle", "1.4,22,-4.2")
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_bow_auto", "wpn_fps_upg_o_1pn93", "0.2,14,-4.71")
    self:cafcw_add_to_parts("sight_vector", "wpn_fps_bow_auto", "wpn_fps_upg_o_1p29", "0.2,14,-4.71")
end

--M3 Grease Gun
if self.wpn_fps_smg_m3 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_m3", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_m3", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_m3", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_m3", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_m3", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_m3", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_m3", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_smg_m3", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_custom_sights("specter", "wpn_fps_smg_m3", "wpn_fps_smg_m45", "wpn_fps_smg_m3_o_adapter")
	self:cafcw_add_custom_sights("acog", "wpn_fps_smg_m3", "wpn_fps_smg_m45", "wpn_fps_smg_m3_o_adapter")
	self:cafcw_add_custom_sights("custom", "wpn_fps_smg_m3", "wpn_fps_smg_m45", "wpn_fps_smg_m3_o_adapter")
    end
if self.wpn_fps_smg_x_m3 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_m3", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_m3", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_m3", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_m3", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_m3", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_m3", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_x_m3", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_smg_x_m3", "SneakySuppressorPack", "ARSupp")
end
	
--Gewehr 43
if self.wpn_fps_snp_g43 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_g43", "wpn_fps_upg_fl_ass_spotter")
    self:cafcw_add_to_parts("gadget", "wpn_fps_snp_g43", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_g43", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_g43", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_g43", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_snp_g43", "wpn_fps_upg_fl_utg")
	self:cafcw_add_modpack("ammo", "wpn_fps_snp_g43", "_792x57mm", "MoreAmmoTypes")
	self:cafcw_add_custom_sights("specter", "wpn_fps_snp_g43", "wpn_fps_ass_fal", "wpn_fps_snp_g43_rail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_snp_g43", "wpn_fps_ass_fal", "wpn_fps_snp_g43_rail")
	self:cafcw_add_custom_sights("custom", "wpn_fps_snp_g43", "wpn_fps_ass_fal", "wpn_fps_snp_g43_rail")
	self:cafcw_add_custom_sights("shortdot", "wpn_fps_snp_g43", "wpn_fps_ass_fal", "wpn_fps_snp_g43_rail")
end

--Akimbo AA-12
if self.wpn_fps_shot_x_aa12 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_aa12", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_aa12", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("other", "wpn_fps_shot_x_aa12", "wpn_fps_upg_ns_sho_salvo_small")
	self:cafcw_add_to_parts("other", "wpn_fps_shot_x_aa12", "wpn_fps_upg_ns_shot_cat")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_aa12", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_aa12", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_aa12", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_aa12", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_aa12", "wpn_fps_upg_fl_utg")
	self:cafcw_add_modpack("ammo", "wpn_fps_shot_x_aa12", "_12ga_auto", "TaserAmmo")
end

--Akimbo Street Sweepers
if self.wpn_fps_shot_x_striker then
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_striker", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_striker", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("other", "wpn_fps_shot_x_striker", "wpn_fps_taserslug")
	self:cafcw_add_to_parts("other", "wpn_fps_shot_x_striker", "wpn_fps_upg_ns_sho_salvo_small")
	self:cafcw_add_to_parts("other", "wpn_fps_shot_x_striker", "wpn_fps_upg_ns_shot_cat")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_striker", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_striker", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_striker", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_x_striker", "wpn_fps_upg_fl_utg")
	self:cafcw_add_modpack("ammo", "wpn_fps_shot_x_striker", "_12ga_auto", "TaserAmmo")
end

-- Welrod
if self.wpn_fps_pis_welrod then
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_welrod", "wpn_fps_upg_fl_unimax", "wpn_fps_pis_welrod_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_welrod", "wpn_fps_upg_fl_utg_pis", "wpn_fps_pis_welrod_gadget_rail")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_pis_welrod", "wpn_fps_upg_fl_micro90", "wpn_fps_pis_welrod_gadget_rail")
	self:cafcw_add_modpack("ammo", "wpn_fps_pis_welrod", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
end

-- Vickers
if self.wpn_fps_lmg_vick then
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_vick", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_vick", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_vick", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_vick", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_vick", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_vick", "wpn_fps_upg_fl_utg")
end
-- Panzerschreck
if self.wpn_fps_pschreck then
	self:cafcw_add_to_parts("gadget", "wpn_fps_pschreck", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pschreck", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pschreck", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pschreck", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pschreck", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_pschreck", "wpn_fps_upg_fl_utg")
end
--R870 Attachments
if self.parts.wpn_fps_shot_870_fg_surefire then
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_fg_surefire", "wpn_fps_upg_fl_ass_spotter", "a_fl_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_fg_surefire", "wpn_fps_upg_fl_wml", "a_fl_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_fg_surefire", "wpn_fps_upg_fl_anpeq2", "a_fl_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_fg_surefire", "wpn_fps_upg_fl_dbal_d2", "a_fl_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_fg_surefire", "wpn_fps_upg_fl_m600p", "a_fl_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_fg_surefire", "wpn_fps_upg_fl_utg", "a_fl_mcs")
end
if self.parts.wpn_fps_shot_870_fg_rail then
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_fg_rail", "wpn_fps_upg_fl_ass_spotter", "a_fl_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_fg_rail", "wpn_fps_upg_fl_wml", "a_fl_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_fg_rail", "wpn_fps_upg_fl_anpeq2", "a_fl_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_fg_rail", "wpn_fps_upg_fl_dbal_d2", "a_fl_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_fg_rail", "wpn_fps_upg_fl_m600p", "a_fl_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_fg_rail", "wpn_fps_upg_fl_utg", "a_fl_mcs")
end
if self.parts.wpn_fps_shot_mossberg_fg_short then
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_mossberg_fg_short", "wpn_fps_upg_fl_ass_spotter", "a_fl_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_mossberg_fg_short", "wpn_fps_upg_fl_wml", "a_fl_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_mossberg_fg_short", "wpn_fps_upg_fl_anpeq2", "a_fl_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_mossberg_fg_short", "wpn_fps_upg_fl_dbal_d2", "a_fl_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_mossberg_fg_short", "wpn_fps_upg_fl_m600p", "a_fl_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_mossberg_fg_short", "wpn_fps_upg_fl_utg", "a_fl_mcs")
end
if self.parts.wpn_fps_shot_870_rail_mcs then
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_kobra", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_compm4s", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_m145", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_pkas", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_coyote", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_acog_rmr", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_hologram", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_zeiss", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_okp7", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_hd33", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_prismatic", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_srs", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_st10", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_hcog", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_reflexholo", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_aog", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_rmr_riser", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_elo", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_po4", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_susat", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_kemper", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_mepro", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_rusak", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_horzine", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_eotech552", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_visionking", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_pka", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_anpas13d", "a_o_mcs")
self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_870_rail_mcs", "wpn_fps_upg_o_compm2", "a_o_mcs")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_kobra")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_compm4s")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_m145")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_pkas")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_coyote")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_acog_rmr")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_hologram")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_zeiss")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_okp7")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_hd33")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_srs")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_hcog")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_reflexholo")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_aog")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_rmr_riser")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_elo")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_po4")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_susat")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_kemper")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_mepro")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_rusak")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_horzine")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_eotech552")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_visionking")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_pka")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_anpas13d")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_mcs", "wpn_fps_upg_o_compm2")
end
if self.parts.wpn_fps_shot_870_iron_aftermarket then
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_kobra")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_compm4s")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_m145")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_pkas")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_coyote")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_acog_rmr")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_hologram")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_zeiss")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_okp7")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_hd33")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_srs")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_hcog")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_reflexholo")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_aog")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_rmr_riser")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_elo")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_po4")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_susat")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_kemper")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_mepro")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_rusak")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_horzine")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_eotech552")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_visionking")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_pka")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_anpas13d")
self:cafcw_add_to_parts("forbids_add", "wpn_fps_shot_870_iron_aftermarket", "wpn_fps_upg_o_compm2")
end

--AR Marksman
if self.wpn_fps_ass_ar60mrks then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ar60mrks", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_ar60mrks", "wpn_fps_upg_o_po4", "wpn_fps_upg_o_po4", "wpn_fps_ass_fal")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_ar60mrks", "wpn_fps_upg_o_susat", "wpn_fps_upg_o_susat", "wpn_fps_ass_fal")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ar60mrks", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_ar60mrks", "wpn_fps_upg_o_eotech552", "wpn_fps_upg_o_eotech552", "wpn_fps_ass_fal")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ar60mrks", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ar60mrks", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ar60mrks", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_ar60mrks", "wpn_fps_upg_fl_utg")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_ar60mrks", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_to_parts("sight", "wpn_fps_ass_ar60mrks", "wpn_fps_upg_o_visionking", "wpn_fps_upg_o_visionking", "wpn_fps_ass_fal")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_ar60mrks", "wpn_fps_ass_fal")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_ar60mrks", "wpn_fps_ass_fal")
end
if self.wpn_fps_ass_x_ar60mrks then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_x_ar60mrks", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_x_ar60mrks", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_x_ar60mrks", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_x_ar60mrks", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_x_ar60mrks", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_x_ar60mrks", "wpn_fps_upg_fl_utg")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_x_ar60mrks", "SneakySuppressorPack", "ARSupp")
end
--MG 34
if self.wpn_fps_lmg_mg34 then
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_mg34", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_mg34", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_mg34", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_mg34", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_mg34", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_lmg_mg34", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_lmg_mg34", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("ammo", "wpn_fps_lmg_mg34", "_792x57mm", "MoreAmmoTypes")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_lmg_mg34", "SneakySuppressorPack", "ARSupp")
end
--Owen Gun
if self.wpn_fps_smg_owen then
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_owen", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_owen", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_owen", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_owen", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_owen", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_owen", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_owen", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("ammo", "wpn_fps_smg_owen", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_smg_owen", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_custom_sights("specter", "wpn_fps_smg_owen", "wpn_fps_bow_ecp", "wpn_fps_smg_owen_rail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_smg_owen", "wpn_fps_bow_ecp", "wpn_fps_smg_owen_rail")
	self:cafcw_add_custom_sights("custom", "wpn_fps_smg_owen", "wpn_fps_bow_ecp", "wpn_fps_smg_owen_rail")
end

--TOZ-106
if self.wpn_fps_shot_toz106 then
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_toz106_stock_full", "wpn_fps_upg_fl_ass_spotter", "a_fl_mc20")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_toz106_stock_full", "wpn_fps_upg_fl_wml", "a_fl_mc20")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_toz106_stock_full", "wpn_fps_upg_fl_anpeq2", "a_fl_mc20")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_toz106_stock_full", "wpn_fps_upg_fl_dbal_d2", "a_fl_mc20")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_toz106_stock_full", "wpn_fps_upg_fl_m600p", "a_fl_mc20")
    self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_shot_toz106_stock_full", "wpn_fps_upg_fl_utg", "a_fl_mc20")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_toz106", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_toz106", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_toz106", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_toz106", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_toz106", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_toz106", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("other", "wpn_fps_shot_toz106", "wpn_fps_upg_ns_sho_salvo_small")
	self:cafcw_add_to_parts("other", "wpn_fps_shot_toz106", "wpn_fps_upg_ns_shot_cat")
	self:cafcw_add_modpack("ammo", "wpn_fps_shot_toz106", "_12ga_auto", "TaserAmmo")
	self:cafcw_add_custom_sights("specter", "wpn_fps_shot_toz106", "wpn_fps_snp_model70", "wpn_fps_shot_toz106_o_rail")
	self:cafcw_add_custom_sights("acog", "wpn_fps_shot_toz106", "wpn_fps_snp_model70", "wpn_fps_shot_toz106_o_rail")
	self:cafcw_add_custom_sights("custom", "wpn_fps_shot_toz106", "wpn_fps_snp_model70", "wpn_fps_shot_toz106_o_rail")
end
--Candy Shotgun
if self.wpn_fps_shot_candy then
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_candy", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_candy", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_candy", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_candy", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_candy", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_shot_candy", "wpn_fps_upg_fl_utg")
	self:cafcw_add_modpack("ammo", "wpn_fps_shot_candy", "_12ga", "TaserAmmo_MoreAmmoTypes")
end
end)