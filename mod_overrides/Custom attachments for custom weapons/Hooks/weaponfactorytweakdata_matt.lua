Hooks:PostHook(WeaponFactoryTweakData, "create_bonuses", "CAFCWMod_Matt_Init", function(self)
-- Akimbo UMP
if self.wpn_fps_smg_x_ump then
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_ump", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_ump", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_ump", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_ump", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_ump", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_x_ump", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_x_ump", "wpn_fps_upg_ns_ass_smg_tromix")
end
-- UMP
if self.wpn_fps_smg_ump then
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_ump", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_ump", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_ump", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_ump", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_ump", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_ump", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_ump", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_custom_sights("specter", "wpn_fps_smg_ump", "wpn_fps_smg_mp5")
	self:cafcw_add_custom_sights("acog", "wpn_fps_smg_ump", "wpn_fps_smg_mp5")
	self:cafcw_add_custom_sights("custom", "wpn_fps_smg_ump", "wpn_fps_smg_mp5")
end
-- Montana 5.56
if self.wpn_fps_ass_yayo then
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_yayo", "wpn_fps_upg_fl_ass_spotter")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_yayo", "wpn_fps_upg_fl_wml")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_yayo", "wpn_fps_upg_fl_anpeq2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_yayo", "wpn_fps_upg_fl_dbal_d2")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_yayo", "wpn_fps_upg_fl_m600p")
	self:cafcw_add_to_parts("gadget", "wpn_fps_ass_yayo", "wpn_fps_upg_fl_utg")
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_ass_yayo", "wpn_fps_upg_ns_ass_smg_tromix")
	self:cafcw_add_modpack("ammo", "wpn_fps_ass_yayo", "_556x45mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("stock", "wpn_fps_ass_yayo", "AR15_StockPack")
	self:cafcw_add_modpack("stock", "wpn_fps_ass_yayo", "Stock_Attachment_Pack")
	self:cafcw_add_modpack("barrel_ext", "wpn_fps_ass_yayo", "SneakySuppressorPack", "ARSupp")
	self:cafcw_add_custom_sights("specter", "wpn_fps_ass_yayo", "wpn_fps_ass_contraband")
	self:cafcw_add_custom_sights("acog", "wpn_fps_ass_yayo", "wpn_fps_ass_contraband")
	self:cafcw_add_custom_sights("custom", "wpn_fps_ass_yayo", "wpn_fps_ass_contraband")
	self:cafcw_add_custom_sights("rds45", "wpn_fps_ass_yayo", "wpn_fps_ass_contraband")
end
end)