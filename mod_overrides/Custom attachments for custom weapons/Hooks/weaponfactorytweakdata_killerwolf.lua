Hooks:PostHook(WeaponFactoryTweakData, "create_bonuses", "CAFCWMod_Killerwolf_Init", function(self)

-----------! > Primary < !-----------

	---- Assault Rifles ---
	
	---- Akimbos ---

	-- Akimbo HK416C --
if self.wpn_fps_ass_x_hk416c then
if self.parts.wpn_fps_upg_fl_wml then
table.insert(self.wpn_fps_ass_x_hk416c.uses_parts, "wpn_fps_upg_fl_wml")
end
if self.parts.wpn_fps_riflein556 then
table.insert(self.wpn_fps_ass_x_hk416c.uses_parts, "wpn_fps_riflein556")
end
self:cafcw_add_modpack("ammo", "wpn_fps_ass_x_hk416c", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
self:cafcw_add_modpack("stock", "wpn_fps_ass_x_hk416c", "AR15_StockPack")
	self:cafcw_add_modpack("stock", "wpn_fps_ass_x_hk416c", "Stock_Attachment_Pack")
end
-- Akimbo Mauser C96 --
if self.wpn_fps_pis_x_c96 then
if self.parts.wpn_fps_upg_fl_wml then
table.insert(self.wpn_fps_pis_x_c96.uses_parts, "wpn_fps_upg_fl_wml")
end
--if self.parts.wpn_fps_pistolin9mm then
--table.insert(self.wpn_fps_pis_x_c96.uses_parts, "wpn_fps_pistolin9mm")
--table.map_append(self.parts.wpn_fps_pis_x_c96_not9mmconversion,{
--		forbids = {"wpn_fps_pistolin9mm"}
--	}
--)
--end
--if self.parts.wpn_fps_upg_a_taser9mm then
--table.insert(self.wpn_fps_pis_x_c96.uses_parts, "wpn_fps_upg_a_taser9mm")
--table.map_append(self.parts.wpn_fps_pis_x_c96_not9mmconversion,{
--		forbids = {"wpn_fps_upg_a_taser9mm"}
--	}
--)
--end
--if self.parts.wpn_fps_upg_a_lap9mm then
--table.insert(self.wpn_fps_pis_x_c96.uses_parts, "wpn_fps_upg_a_lap9mm")
--table.map_append(self.parts.wpn_fps_pis_x_c96_not9mmconversion,{
--		forbids = {"wpn_fps_upg_a_lap9mm"}
--	}
--)
--end
--if self.parts.wpn_fps_upg_a_ap9mm then
--table.insert(self.wpn_fps_pis_x_c96.uses_parts, "wpn_fps_upg_a_ap9mm")
--table.map_append(self.parts.wpn_fps_pis_x_c96_not9mmconversion,{
--		forbids = {"wpn_fps_upg_a_ap9mm"}
--	}
--)
--end
end
	
	
	-- Akimbo Luger P08 --
if self.wpn_fps_pis_x_luger then
self:cafcw_add_modpack("ammo", "wpn_fps_pis_x_luger", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
end

	---- Machine Guns ---
if self.wpn_fps_lmg_dp28 then
	self:cafcw_add_modpack("stock", "wpn_fps_lmg_dp28", "AR15_StockPack")
	self:cafcw_add_modpack("stock", "wpn_fps_lmg_dp28", "Stock_Attachment_Pack")
	self:cafcw_add_modpack("ammo", "wpn_fps_lmg_dp28", "_762x54mmr", "MoreAmmoTypes")
	self:cafcw_add_custom_sights("specter", "wpn_fps_lmg_dp28", "wpn_fps_lmg_mg42", "wpn_fps_lmg_dp28_rail_sight,wpn_fps_lmg_dp28_ro_rail", "0, 10, -4")
	self:cafcw_add_custom_sights("acog", "wpn_fps_lmg_dp28", "wpn_fps_lmg_mg42", "wpn_fps_lmg_dp28_rail_sight,wpn_fps_lmg_dp28_ro_rail", "0, 10, -4")	
--	self:cafcw_add_custom_sights("custom", "wpn_fps_lmg_dp28", "wpn_fps_lmg_mg42", "wpn_fps_lmg_dp28_rail_sight,wpn_fps_lmg_dp28_ro_rail", "0,0,0.92")
--	self:cafcw_add_custom_sights("rds45", "wpn_fps_lmg_dp28", "wpn_fps_lmg_mg42", "wpn_fps_lmg_dp28_rail_sight,wpn_fps_lmg_dp28_ro_rail", "-3.1, -2, -8.24")

	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_lmg_dp28", "wpn_fps_upg_m4_s_caastock", "wpn_fps_lmg_dp28_stock_adapter")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_lmg_dp28", "wpn_fps_upg_m4_s_caastock_black", "wpn_fps_lmg_dp28_stock_adapter")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_lmg_dp28", "wpn_fps_upg_m4_s_hke1", "wpn_fps_lmg_dp28_stock_adapter")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_lmg_dp28", "wpn_fps_upg_m4_s_viper", "wpn_fps_lmg_dp28_stock_adapter")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_lmg_dp28", "wpn_fps_upg_m4_s_collapsed", "wpn_fps_lmg_dp28_stock_adapter")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_lmg_dp28", "wpn_fps_upg_m4_s_pts_col", "wpn_fps_lmg_dp28_stock_adapter")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_lmg_dp28", "wpn_fps_upg_m4_s_crane_col", "wpn_fps_lmg_dp28_stock_adapter")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_lmg_dp28", "wpn_fps_upg_m4_s_mk46_col", "wpn_fps_lmg_dp28_stock_adapter")
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_lmg_dp28", "wpn_fps_upg_m4_s_ubr_col", "wpn_fps_lmg_dp28_stock_adapter")
end	

	---- Pistols / Revolvers ----
	---- Shotuns ---

	-- DP12 --
if self.wpn_fps_sho_dp12 then
	self:cafcw_add_modpack("ammo", "wpn_fps_sho_dp12", "_12ga", "TaserAmmo_MoreAmmoTypes")
	self:cafcw_add_to_parts("gadget", "wpn_fps_sho_dp12", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_sho_dp12", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("forbids", "wpn_fps_shot_dp12_norail", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("forbids", "wpn_fps_shot_dp12_norail", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("forbids", "wpn_fps_sho_dp12_o_standard", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("forbids", "wpn_fps_sho_dp12_o_standard", "wpn_fps_upg_fl_wml")
	self:cafcw_add_custom_sights("specter", "wpn_fps_sho_dp12", "wpn_fps_sho_ksg", nil, "0, 0, -0.38")
	self:cafcw_add_custom_sights("acog", "wpn_fps_sho_dp12", "wpn_fps_sho_ksg", nil, "0, 3, -0.38")
	self:cafcw_add_custom_sights("custom", "wpn_fps_sho_dp12", "wpn_fps_sho_ksg", nil, "0,0,0.92")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_sho_dp12", "wpn_fps_sho_ksg", nil, "-3.1, -2, -8.24")
	self:cafcw_category_forbid("wpn_fps_sho_dp12", "sight", "wpn_fps_shot_dp12_norail", "wpn_fps_sho_dp12_o_standard")
end

	-- Remington 870 Sawed-off --
if self.wpn_fps_shot_r870sawed then
self:cafcw_add_modpack("ammo", "wpn_fps_shot_r870sawed", "_12ga", "TaserAmmo_MoreAmmoTypes")
end
	-- Franchi PA8 --
if self.wpn_fps_shot_pa8 then
self:cafcw_add_modpack("ammo", "wpn_fps_shot_pa8", "_12ga", "TaserAmmo_MoreAmmoTypes")
if self.parts.wpn_fps_upg_o_kobra then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_kobra")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_kobra")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_kobra = {
		"wpn_fps_shot_pa8_ris_special"
	}	
	self.parts.wpn_fps_upg_o_kobra.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870)
end
if self.parts.wpn_fps_upg_o_compm4s then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_compm4s")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_compm4s")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_compm4s = {
		"wpn_fps_shot_pa8_ris_special"
	}	
	self.parts.wpn_fps_upg_o_compm4s.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870)
end
if self.parts.wpn_fps_upg_o_m145 then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_m145")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_m145")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_m145 = {
		"wpn_fps_shot_pa8_ris_special"
	}
	self.parts.wpn_fps_upg_o_m145.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870)
end
if self.parts.wpn_fps_upg_o_pkas then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_pkas")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_pkas")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_pkas = {
		"wpn_fps_shot_pa8_ris_special"
	}
	self.parts.wpn_fps_upg_o_pkas.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870)
end
if self.parts.wpn_fps_upg_o_coyote then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_coyote")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_coyote")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_coyote = {
		"wpn_fps_shot_pa8_ris_special"
	}
	self.parts.wpn_fps_upg_o_coyote.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870)
end
if self.parts.wpn_fps_upg_o_acog_rmr then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_acog_rmr")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_acog_rmr")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_acog_rmr = {
		"wpn_fps_shot_pa8_ris_special"
	}
	self.parts.wpn_fps_upg_o_acog_rmr.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_shot_r870)
end
if self.parts.wpn_fps_upg_o_hologram then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_hologram")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_hologram")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_hologram = {
		"wpn_fps_shot_pa8_ris_special"
	}
	self.parts.wpn_fps_upg_o_hologram.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870)
end
if self.parts.wpn_fps_upg_o_zeiss then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_zeiss")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_zeiss")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_zeiss = {
		"wpn_fps_shot_pa8_ris_special"
	}
	self.parts.wpn_fps_upg_o_zeiss.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870)
end
if self.parts.wpn_fps_upg_o_okp7 then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_okp7")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_okp7")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_okp7 = {
		"wpn_fps_shot_pa8_ris_special"
	}
	self.parts.wpn_fps_upg_o_okp7.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870)
end
if self.parts.wpn_fps_upg_o_hd33 then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_hd33")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_hd33")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_hd33 = {
		"wpn_fps_shot_pa8_ris_special"
	}
	self.parts.wpn_fps_upg_o_hd33.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870)
end
if self.parts.wpn_fps_upg_o_prismatic then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_prismatic")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_prismatic")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_prismatic = {
		"wpn_fps_shot_pa8_ris_special"
	}
	self.parts.wpn_fps_upg_o_prismatic.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870)
end
if self.parts.wpn_fps_upg_o_srs then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_srs")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_srs")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_srs = {
		"wpn_fps_shot_pa8_ris_special"
	}
	self.parts.wpn_fps_upg_o_srs.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870)
end
if self.parts.wpn_fps_upg_o_hcog then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_hcog")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_hcog")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_hcog = {
		"wpn_fps_shot_pa8_ris_special"
	}
	self.parts.wpn_fps_upg_o_hcog.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870)
end
if self.parts.wpn_fps_upg_o_reflexholo then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_reflexholo")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_reflexholo")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_reflexholo = {
		"wpn_fps_shot_pa8_ris_special"
	}
	self.parts.wpn_fps_upg_o_reflexholo.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870)
end
if self.parts.wpn_fps_upg_o_aog then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_aog")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_aog")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_aog = {
		"wpn_fps_shot_pa8_ris_special"
	}
	self.parts.wpn_fps_upg_o_aog.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870)
end
if self.parts.wpn_fps_upg_o_rmr_riser then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_rmr_riser")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_rmr_riser")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_rmr_riser = {
		"wpn_fps_shot_pa8_ris_special"
	}
	self.parts.wpn_fps_upg_o_rmr_riser.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870)
end
if self.parts.wpn_fps_upg_fl_ass_spotter then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_fl_ass_spotter")
table.insert(self.parts.wpn_fps_shot_pa8_b_short.forbids, "wpn_fps_upg_fl_ass_spotter")
    self.wpn_fps_shot_pa8.adds.wpn_fps_upg_fl_ass_spotter = {
		"wpn_fps_shot_pa8_gadget_rail"
    }
end
if self.parts.wpn_fps_upg_o_elo then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_elo")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_elo")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_elo = {
		"wpn_fps_shot_pa8_ris_special"
	}
	self.parts.wpn_fps_upg_o_elo.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870)
end
if self.parts.wpn_fps_upg_o_po4 then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_po4")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_po4")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_po4 = {
		"wpn_fps_shot_pa8_ris_special"
	}
	self.parts.wpn_fps_upg_o_po4.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_po4.stance_mod.wpn_fps_shot_r870)
end
if self.parts.wpn_fps_upg_o_susat then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_susat")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_susat")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_susat = {
		"wpn_fps_shot_pa8_ris_special"
	}
	self.parts.wpn_fps_upg_o_susat.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_susat.stance_mod.wpn_fps_shot_r870)
end
if self.parts.wpn_fps_upg_fl_wml then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_fl_wml")
table.insert(self.parts.wpn_fps_shot_pa8_b_short.forbids, "wpn_fps_upg_fl_wml")
    self.wpn_fps_shot_pa8.adds.wpn_fps_upg_fl_wml = {
		"wpn_fps_shot_pa8_gadget_rail"
    }
end
if self.parts.wpn_fps_upg_o_kemper then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_kemper")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_kemper")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_kemper = {
		"wpn_fps_shot_pa8_ris_special"
	}
	self.parts.wpn_fps_upg_o_kemper.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870)
end
if self.parts.wpn_fps_upg_o_horzine then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_horzine")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_horzine")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_horzine = {
		"wpn_fps_shot_pa8_ris_special"
	}
	self.parts.wpn_fps_upg_o_horzine.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870)
end
if self.parts.wpn_fps_upg_o_mepro then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_mepro")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_mepro")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_mepro = {
		"wpn_fps_shot_pa8_ris_special"
	}
	self.parts.wpn_fps_upg_o_mepro.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870)
end
if self.parts.wpn_fps_upg_o_rusak then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_rusak")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_rusak")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_rusak = {
		"wpn_fps_shot_pa8_ris_special"
	}
	self.parts.wpn_fps_upg_o_rusak.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_shot_r870)
end
--if self.parts.wpn_fps_shield_shotgun then
--table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_shield_shotgun")
--table.insert(self.parts.wpn_fps_shot_pa8_b_short.forbids, "wpn_fps_shield_shotgun")
--end
if self.parts.wpn_fps_upg_o_eotech552 then
table.insert(self.wpn_fps_shot_pa8.uses_parts, "wpn_fps_upg_o_eotech552")
table.insert(self.parts.wpn_fps_shot_pa8_s_folding.forbids, "wpn_fps_upg_o_eotech552")
	self.wpn_fps_shot_pa8.adds.wpn_fps_upg_o_eotech552 = {
		"wpn_fps_shot_pa8_ris_special"
	}
	self.parts.wpn_fps_upg_o_eotech552.stance_mod.wpn_fps_shot_pa8 = deep_clone(self.parts.wpn_fps_upg_o_eotech552.stance_mod.wpn_fps_shot_r870)
end
end
	
	---- Sniper Rifles ----

	-- Karabiner 98k --
if self.wpn_fps_snp_kar98k then
self:cafcw_add_modpack("ammo", "wpn_fps_snp_kar98k", "_792x57mm", "MoreAmmoTypes")
self:cafcw_add_modpack("ammo", "wpn_fps_snp_kar98k", "_12ga", "TaserAmmo_MoreAmmoTypes")
self:cafcw_add_modpack("forbids_add", "wpn_fps_snp_kar98k_m_geha", "_792x57mm", "MoreAmmoTypes")
self:cafcw_add_modpack("forbids_add", "wpn_fps_snp_kar98k_m_standard", "_12ga", "TaserAmmo_MoreAmmoTypes")
if self.parts.wpn_fps_upg_o_kobra then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_kobra")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_kobra = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_kobra.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_compm4s then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_compm4s")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_compm4s = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_compm4s.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_m145 then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_m145")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_m145 = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_m145.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_pkas then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_pkas")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_pkas = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_pkas.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_coyote then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_coyote")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_coyote = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_coyote.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_acog_rmr then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_acog_rmr")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_acog_rmr = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_acog_rmr.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_hologram then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_hologram")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_hologram = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_hologram.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_gitsch then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_gitsch")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_gitsch = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_gitsch.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_ta648 then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_ta648")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_ta648 = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_ta648.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_zeiss then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_zeiss")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_zeiss = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_zeiss.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_deltatitanium then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_deltatitanium")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_deltatitanium = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_deltatitanium.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_deltatitanium.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_okp7 then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_okp7")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_okp7 = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_okp7.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_hd33 then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_hd33")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_hd33 = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_hd33.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_prismatic then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_prismatic")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_prismatic = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_prismatic.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_srs then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_srs")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_srs = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_srs.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_csgoscope then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_csgoscope")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_csgoscope = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_csgoscope.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_csgoscope.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_hcog then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_hcog")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_hcog = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_hcog.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_reflexholo then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_reflexholo")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_reflexholo = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_reflexholo.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_aog then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_aog")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_aog = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_aog.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_st10 then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_st10")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_st10 = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_st10.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_st10.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_elo then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_elo")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_elo = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_elo.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_po4 then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_po4")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_po4 = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_po4.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_po4.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_susat then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_susat")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_susat = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_susat.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_susat.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_kemper then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_kemper")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_kemper = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_kemper.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_mepro then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_mepro")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_mepro = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_mepro.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_rusak then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_rusak")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_rusak = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_rusak.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_ta648rmr then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_ta648rmr")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_ta648rmr = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_ta648rmr.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_shortdot.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_delta_rm55 then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_delta_rm55")
	table.map_append(self.parts.wpn_fps_snp_kar98k_iron_sight,{
		forbids = {"wpn_fps_upg_o_delta_rm55"}
	}
	)
	self.parts.wpn_fps_upg_o_delta_rm55.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_45rds.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_upg_o_horzine then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_horzine")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_horzine = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_horzine.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_snp_mosin)
end
if self.parts.wpn_fps_shield_aug and self.parts.wpn_fps_shield_skin_ftp and self.parts.wpn_fps_shield_skin_urban then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_shield_aug")
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_shield_skin_ftp")
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_shield_skin_urban")
end
if self.parts.wpn_fps_upg_o_eotech552 then
table.insert(self.wpn_fps_snp_kar98k.uses_parts, "wpn_fps_upg_o_eotech552")
	self.wpn_fps_snp_kar98k.adds.wpn_fps_upg_o_eotech552 = {
		"wpn_fps_snp_kar98k_rail"
	}
	self.parts.wpn_fps_upg_o_eotech552.stance_mod.wpn_fps_snp_kar98k = deep_clone(self.parts.wpn_fps_upg_o_eotech552.stance_mod.wpn_fps_snp_mosin)
end
end
	
	---- Specials ----
	---- Submachine Guns ----
	
	-- Thompson M1A1 / Akimbo Thompson M1A1 --
if self.wpn_fps_smg_tm1a1 and self.wpn_fps_smg_x_tm1a1 then
if self.parts.wpn_fps_upg_o_kobra then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_o_kobra")
	self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_o_kobra = {
		"wpn_fps_shot_r870_ris_special"
	}	
	self.parts.wpn_fps_upg_o_kobra.stance_mod.wpn_fps_smg_tm1a1 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_tec9)
end
if self.parts.wpn_fps_upg_o_compm4s then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_o_compm4s")
	self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_o_compm4s = {
		"wpn_fps_shot_r870_ris_special"
	}	
	self.parts.wpn_fps_upg_o_compm4s.stance_mod.wpn_fps_smg_tm1a1 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_tec9)
end
if self.parts.wpn_fps_upg_o_m145 then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_o_m145")
	self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_o_m145 = {
		"wpn_fps_shot_r870_ris_special"
	}
	self.parts.wpn_fps_upg_o_m145.stance_mod.wpn_fps_smg_tm1a1 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_tec9)
end
if self.parts.wpn_fps_upg_o_pkas then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_o_pkas")
	self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_o_pkas = {
		"wpn_fps_shot_r870_ris_special"
	}
	self.parts.wpn_fps_upg_o_pkas.stance_mod.wpn_fps_smg_tm1a1 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_tec9)
end
if self.parts.wpn_fps_upg_o_coyote then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_o_coyote")
	self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_o_coyote = {
		"wpn_fps_shot_r870_ris_special"
	}
	self.parts.wpn_fps_upg_o_coyote.stance_mod.wpn_fps_smg_tm1a1 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_tec9)
end
if self.parts.wpn_fps_upg_o_acog_rmr then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_o_acog_rmr")
	self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_o_acog_rmr = {
		"wpn_fps_shot_r870_ris_special"
	}
	self.parts.wpn_fps_upg_o_acog_rmr.stance_mod.wpn_fps_smg_tm1a1 = deep_clone(self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_tec9)
end
if self.parts.wpn_fps_upg_o_hologram then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_o_hologram")
	self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_o_hologram = {
		"wpn_fps_shot_r870_ris_special"
	}
	self.parts.wpn_fps_upg_o_hologram.stance_mod.wpn_fps_smg_tm1a1 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_tec9)
end
if self.parts.wpn_fps_upg_o_zeiss then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_o_zeiss")
	self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_o_zeiss = {
		"wpn_fps_shot_r870_ris_special"
	}
	self.parts.wpn_fps_upg_o_zeiss.stance_mod.wpn_fps_smg_tm1a1 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_tec9)
end
if self.parts.wpn_fps_upg_o_okp7 then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_o_okp7")
	self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_o_okp7 = {
		"wpn_fps_shot_r870_ris_special"
	}
	self.parts.wpn_fps_upg_o_okp7.stance_mod.wpn_fps_smg_tm1a1 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_tec9)
end
if self.parts.wpn_fps_upg_o_hd33 then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_o_hd33")
	self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_o_hd33 = {
		"wpn_fps_shot_r870_ris_special"
	}
	self.parts.wpn_fps_upg_o_hd33.stance_mod.wpn_fps_smg_tm1a1 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_tec9)
end
if self.parts.wpn_fps_upg_o_prismatic then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_o_prismatic")
	self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_o_prismatic = {
		"wpn_fps_shot_r870_ris_special"
	}
	self.parts.wpn_fps_upg_o_prismatic.stance_mod.wpn_fps_smg_tm1a1 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_tec9)
end
if self.parts.wpn_fps_upg_o_srs then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_o_srs")
	self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_o_srs = {
		"wpn_fps_shot_r870_ris_special"
	}
	self.parts.wpn_fps_upg_o_srs.stance_mod.wpn_fps_smg_tm1a1 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_tec9)
end
if self.parts.wpn_fps_upg_o_hcog then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_o_hcog")
	self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_o_hcog = {
		"wpn_fps_shot_r870_ris_special"
	}
	self.parts.wpn_fps_upg_o_hcog.stance_mod.wpn_fps_smg_tm1a1 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_tec9)
end
if self.parts.wpn_fps_upg_o_reflexholo then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_o_reflexholo")
	self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_o_reflexholo = {
		"wpn_fps_shot_r870_ris_special"
	}
	self.parts.wpn_fps_upg_o_reflexholo.stance_mod.wpn_fps_smg_tm1a1 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_tec9)
end
if self.parts.wpn_fps_upg_o_aog then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_o_aog")
	self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_o_aog = {
		"wpn_fps_shot_r870_ris_special"
	}
	self.parts.wpn_fps_upg_o_aog.stance_mod.wpn_fps_smg_tm1a1 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_tec9)
end
if self.parts.wpn_fps_upg_o_rmr_riser then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_o_rmr_riser")
	self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_o_rmr_riser = {
		"wpn_fps_shot_r870_ris_special"
	}
	self.parts.wpn_fps_upg_o_rmr_riser.stance_mod.wpn_fps_smg_tm1a1 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_tec9)
end
if self.parts.wpn_fps_upg_fl_ass_spotter then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_fl_ass_spotter")
table.insert(self.wpn_fps_smg_x_tm1a1.uses_parts, "wpn_fps_upg_fl_ass_spotter")
    self.wpn_fps_smg_x_tm1a1.adds.wpn_fps_upg_fl_ass_spotter = {
		"wpn_fps_shot_r870_gadget_rail"
    }
    self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_fl_ass_spotter = {
		"wpn_fps_shot_r870_gadget_rail"
    }
end
if self.parts.wpn_fps_upg_o_elo then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_o_elo")
	self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_o_elo = {
		"wpn_fps_shot_r870_ris_special"
	}
	self.parts.wpn_fps_upg_o_elo.stance_mod.wpn_fps_smg_tm1a1 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_tec9)
end
if self.parts.wpn_fps_upg_o_po4 then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_o_po4")
	self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_o_po4 = {
		"wpn_fps_shot_r870_ris_special"
	}
	self.parts.wpn_fps_upg_o_po4.stance_mod.wpn_fps_smg_tm1a1 = deep_clone(self.parts.wpn_fps_upg_o_po4.stance_mod.wpn_fps_smg_tec9)
end
if self.parts.wpn_fps_upg_o_susat then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_o_susat")
	self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_o_susat = {
		"wpn_fps_shot_r870_ris_special"
	}
	self.parts.wpn_fps_upg_o_susat.stance_mod.wpn_fps_smg_tm1a1 = deep_clone(self.parts.wpn_fps_upg_o_susat.stance_mod.wpn_fps_smg_tec9)
end
if self.parts.wpn_fps_upg_fl_wml then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_fl_wml")
table.insert(self.wpn_fps_smg_x_tm1a1.uses_parts, "wpn_fps_upg_fl_wml")
    self.wpn_fps_smg_x_tm1a1.adds.wpn_fps_upg_fl_wml = {
		"wpn_fps_shot_r870_gadget_rail"
    }
    self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_fl_wml = {
		"wpn_fps_shot_r870_gadget_rail"
    }
end
if self.parts.wpn_fps_upg_o_kemper then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_o_kemper")
	self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_o_kemper = {
		"wpn_fps_shot_r870_ris_special"
	}
	self.parts.wpn_fps_upg_o_kemper.stance_mod.wpn_fps_smg_tm1a1 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_tec9)
end
if self.parts.wpn_fps_upg_o_mepro then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_o_mepro")
	self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_o_mepro = {
		"wpn_fps_shot_r870_ris_special"
	}
	self.parts.wpn_fps_upg_o_mepro.stance_mod.wpn_fps_smg_tm1a1 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_tec9)
end
if self.parts.wpn_fps_upg_o_rusak then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_o_rusak")
	self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_o_rusak = {
		"wpn_fps_shot_r870_ris_special"
	}
	self.parts.wpn_fps_upg_o_rusak.stance_mod.wpn_fps_smg_tm1a1 = deep_clone(self.parts.wpn_fps_upg_o_specter.stance_mod.wpn_fps_smg_tec9)
end
if self.parts.wpn_fps_upg_o_eotech552 then
table.insert(self.wpn_fps_smg_tm1a1.uses_parts, "wpn_fps_upg_o_eotech552")
	self.wpn_fps_smg_tm1a1.adds.wpn_fps_upg_o_eotech552 = {
		"wpn_fps_shot_r870_ris_special"
	}
	self.parts.wpn_fps_upg_o_eotech552.stance_mod.wpn_fps_smg_tm1a1 = deep_clone(self.parts.wpn_fps_upg_o_eotech552.stance_mod.wpn_fps_smg_tec9)
end
end
	
-----------! > Secondary < !-----------

	---- Assault Rifles ---
	---- Akimbos ---
	---- Machine Guns ---
	
	---- Pistols / Revolvers ----
	
	-- Colt M1911A1 / Akimbo Colt M1911A1 --
	
	-- GSh-18 / Akimbo GSh-18 --	
if self.wpn_fps_pis_gsh18 and self.wpn_fps_pis_x_gsh18 then
self:cafcw_add_modpack("ammo", "wpn_fps_pis_gsh18", "_9x19mm_p", "MoreAmmoTypes")	
self:cafcw_add_modpack("ammo", "wpn_fps_pis_x_gsh18", "_9x19mm_p", "MoreAmmoTypes")
if self.parts.wpn_fps_ass_ns_g_sup1 and self.parts.wpn_fps_ass_ns_g_sup2 then
table.insert(self.wpn_fps_pis_gsh18.uses_parts, "wpn_fps_ass_ns_g_sup1")
table.insert(self.wpn_fps_pis_gsh18.uses_parts, "wpn_fps_ass_ns_g_sup2")
table.insert(self.wpn_fps_pis_x_gsh18.uses_parts, "wpn_fps_ass_ns_g_sup1")
table.insert(self.wpn_fps_pis_x_gsh18.uses_parts, "wpn_fps_ass_ns_g_sup2")
end
end
	
	---- Shotuns ---
	---- Sniper Rifles ----
	---- Specials ----
	---- Submachine Guns ----
	
	-- AEK-919K / Akimbo AEK-919K --
if self.wpn_fps_smg_aek919 and self.wpn_fps_smg_x_aek919 then
self:cafcw_add_modpack("ammo", "wpn_fps_smg_aek919", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
self:cafcw_add_modpack("ammo", "wpn_fps_smg_x_aek919", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
if self.parts.wpn_fps_ass_ns_g_sup3 then
table.insert(self.wpn_fps_smg_aek919.uses_parts, "wpn_fps_ass_ns_g_sup3")
table.insert(self.wpn_fps_smg_x_aek919.uses_parts, "wpn_fps_ass_ns_g_sup3")
end
if self.parts.wpn_fps_ass_ns_g_sup4 then
table.insert(self.wpn_fps_smg_aek919.uses_parts, "wpn_fps_ass_ns_g_sup4")
table.insert(self.wpn_fps_smg_x_aek919.uses_parts, "wpn_fps_ass_ns_g_sup4")
end
end


-----------! > Attachments < !-----------

	---- Ammo ----

--[[	-- _9x19mm --
local custom9mm_guns = {
	"wpn_fps_pis_x_luger",
	"wpn_fps_smg_aek919",
	"wpn_fps_smg_x_aek919"
}

local custom9mm_ammo = {
	"wpn_fps_pistolin9mm",
	"wpn_fps_upg_a_taser9mm",
	"wpn_fps_upg_a_lap9mm",
	"wpn_fps_upg_a_ap9mm",
	"wpn_fps_upg_a_hv9mm"
}

for i, factory_id in ipairs(custom9mm_guns) do
	if self[factory_id] then
		for i, part_id in ipairs(custom9mm_ammo) do
			if self.parts[part_id] then
				table.insert(self[factory_id].uses_parts, part_id)
			end
		end
	end
end
--]]

end)