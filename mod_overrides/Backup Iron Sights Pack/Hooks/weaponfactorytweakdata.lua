Hooks:PostHook(WeaponFactoryTweakData, "init", "BackupIronSightsPackModInit", function(self)
-- Striker
if not self.wpn_fps_sho_striker.override then
	self.wpn_fps_sho_striker.override = {}
end
	self.wpn_fps_sho_striker.override.wpn_fps_upg_o_var_dd_a1_front = {a_obj = "a_o_f"}
	self.wpn_fps_sho_striker.override.wpn_fps_upg_o_var_dd_a1_rear = {a_obj = "a_o_r"}
	self.wpn_fps_sho_striker.override.wpn_fps_upg_o_var_kac_front = {a_obj = "a_o_f"}
	self.wpn_fps_sho_striker.override.wpn_fps_upg_o_var_kac_rear = {a_obj = "a_o_r"}
	self.wpn_fps_sho_striker.override.wpn_fps_upg_o_var_m4flipup_front = {a_obj = "a_o_f"}
	self.wpn_fps_sho_striker.override.wpn_fps_upg_o_var_m4flipup_rear = {a_obj = "a_o_r"}
	self.wpn_fps_sho_striker.override.wpn_fps_upg_o_var_mbus_front = {a_obj = "a_o_f"}
	self.wpn_fps_sho_striker.override.wpn_fps_upg_o_var_mbus_rear = {a_obj = "a_o_r"}
	self.wpn_fps_sho_striker.override.wpn_fps_upg_o_var_scorpionevo_front = {a_obj = "a_o_f"}
	self.wpn_fps_sho_striker.override.wpn_fps_upg_o_var_scorpionevo_rear = {a_obj = "a_o_r"}
	self.wpn_fps_sho_striker.override.wpn_fps_upg_o_var_troy_front = {a_obj = "a_o_f"}
	self.wpn_fps_sho_striker.override.wpn_fps_upg_o_var_troy_rear = {a_obj = "a_o_r"}
	self.wpn_fps_sho_striker.override.wpn_fps_upg_o_var_troym4_front = {a_obj = "a_o_f"}
	self.wpn_fps_sho_striker.override.wpn_fps_upg_o_var_troym4_rear = {a_obj = "a_o_r"}
-- KSG
if not self.wpn_fps_sho_ksg.override then
	self.wpn_fps_sho_ksg.override = {}
end
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_o_var_dd_a1_front = {a_obj = "a_o_f"}
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_o_var_dd_a1_rear = {a_obj = "a_o_r", stats = {value = 1, concealment = 2}}
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_o_var_kac_front = {a_obj = "a_o_f"}
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_o_var_kac_rear = {a_obj = "a_o_r", stats = {value = 1, concealment = 2}}
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_o_var_m4flipup_front = {a_obj = "a_o_f"}
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_o_var_m4flipup_rear = {a_obj = "a_o_r", stats = {value = 1, concealment = 2}}
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_o_var_mbus_front = {a_obj = "a_o_f"}
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_o_var_mbus_rear = {a_obj = "a_o_r", stats = {value = 1, concealment = 2}}
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_o_var_scorpionevo_front = {a_obj = "a_o_f"}
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_o_var_scorpionevo_rear = {a_obj = "a_o_r", stats = {value = 1, concealment = 2}}
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_o_var_troy_front = {a_obj = "a_o_f"}
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_o_var_troy_rear = {a_obj = "a_o_r", stats = {value = 1, concealment = 2}}
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_o_var_troym4_front = {a_obj = "a_o_f"}
	self.wpn_fps_sho_ksg.override.wpn_fps_upg_o_var_troym4_rear = {a_obj = "a_o_r", stats = {value = 1, concealment = 2}}
-- M4
if not self.parts.wpn_fps_upg_ass_m4_fg_moe.override then
	self.parts.wpn_fps_upg_ass_m4_fg_moe.override = {}
end
	self.parts.wpn_fps_upg_ass_m4_fg_moe.override.wpn_fps_upg_o_var_dd_a1_front = {a_obj = "a_of_moe"}
	self.parts.wpn_fps_upg_ass_m4_fg_moe.override.wpn_fps_upg_o_var_kac_front = {a_obj = "a_of_moe"}
	self.parts.wpn_fps_upg_ass_m4_fg_moe.override.wpn_fps_upg_o_var_m4flipup_front = {a_obj = "a_of_moe"}
	self.parts.wpn_fps_upg_ass_m4_fg_moe.override.wpn_fps_upg_o_var_mbus_front = {a_obj = "a_of_moe"}
	self.parts.wpn_fps_upg_ass_m4_fg_moe.override.wpn_fps_upg_o_var_scorpionevo_front = {a_obj = "a_of_moe"}
	self.parts.wpn_fps_upg_ass_m4_fg_moe.override.wpn_fps_upg_o_var_troy_front = {a_obj = "a_of_moe"}
	self.parts.wpn_fps_upg_ass_m4_fg_moe.override.wpn_fps_upg_o_var_troym4_front = {a_obj = "a_of_moe"}
-- M16
if not self.wpn_fps_ass_m16.override then
	self.wpn_fps_ass_m16.override = {}
end
	self.wpn_fps_ass_m16.override.wpn_fps_upg_o_var_dd_a1_rear = {adds = {"wpn_fps_ass_m16_os_frontsight"}}
	self.wpn_fps_ass_m16.override.wpn_fps_upg_o_var_kac_rear = {adds = {"wpn_fps_ass_m16_os_frontsight"}}
	self.wpn_fps_ass_m16.override.wpn_fps_upg_o_var_m4flipup_rear = {adds = {"wpn_fps_ass_m16_os_frontsight"}}
	self.wpn_fps_ass_m16.override.wpn_fps_upg_o_var_mbus_rear = {adds = {"wpn_fps_ass_m16_os_frontsight"}}
	self.wpn_fps_ass_m16.override.wpn_fps_upg_o_var_scorpionevo_rear = {adds = {"wpn_fps_ass_m16_os_frontsight"}}
	self.wpn_fps_ass_m16.override.wpn_fps_upg_o_var_troy_rear = {adds = {"wpn_fps_ass_m16_os_frontsight"}}
	self.wpn_fps_ass_m16.override.wpn_fps_upg_o_var_troym4_rear = {adds = {"wpn_fps_ass_m16_os_frontsight"}}
-- CBRPS Saiga 12K
if not self.parts.wpn_fps_sho_basset_fg_short.override then
	self.parts.wpn_fps_sho_basset_fg_short.override = {}
end
	self.parts.wpn_fps_sho_basset_fg_short.override.wpn_fps_upg_o_var_dd_a1_front = {a_obj = "a_of_short"}
	self.parts.wpn_fps_sho_basset_fg_short.override.wpn_fps_upg_o_var_kac_front = {a_obj = "a_of_short"}
	self.parts.wpn_fps_sho_basset_fg_short.override.wpn_fps_upg_o_var_m4flipup_front = {a_obj = "a_of_short"}
	self.parts.wpn_fps_sho_basset_fg_short.override.wpn_fps_upg_o_var_mbus_front = {a_obj = "a_of_short"}
	self.parts.wpn_fps_sho_basset_fg_short.override.wpn_fps_upg_o_var_scorpionevo_front = {a_obj = "a_of_short"}
	self.parts.wpn_fps_sho_basset_fg_short.override.wpn_fps_upg_o_var_troy_front = {a_obj = "a_of_short"}
	self.parts.wpn_fps_sho_basset_fg_short.override.wpn_fps_upg_o_var_troym4_front = {a_obj = "a_of_short"}
-- MP5
	self.wpn_fps_smg_mp5.adds.wpn_fps_upg_o_var_dd_a1_rear = {"wpn_fps_smg_mp5_body_rail"}
	self.wpn_fps_smg_mp5.adds.wpn_fps_upg_o_var_kac_rear = {"wpn_fps_smg_mp5_body_rail"}
	self.wpn_fps_smg_mp5.adds.wpn_fps_upg_o_var_m4flipup_rear = {"wpn_fps_smg_mp5_body_rail"}
	self.wpn_fps_smg_mp5.adds.wpn_fps_upg_o_var_mbus_rear = {"wpn_fps_smg_mp5_body_rail"}
	self.wpn_fps_smg_mp5.adds.wpn_fps_upg_o_var_troy_rear = {"wpn_fps_smg_mp5_body_rail"}
	self.wpn_fps_smg_mp5.adds.wpn_fps_upg_o_var_troym4_rear = {"wpn_fps_smg_mp5_body_rail"}
-- MPX
if not self.parts.wpn_fps_smg_shepheard_body_short.override then
	self.parts.wpn_fps_smg_shepheard_body_short.override = {}
end
	self.parts.wpn_fps_smg_shepheard_body_short.override.wpn_fps_upg_o_var_dd_a1_front = {a_obj = "a_of_short"}
	self.parts.wpn_fps_smg_shepheard_body_short.override.wpn_fps_upg_o_var_kac_front = {a_obj = "a_of_short"}
	self.parts.wpn_fps_smg_shepheard_body_short.override.wpn_fps_upg_o_var_m4flipup_front = {a_obj = "a_of_short"}
	self.parts.wpn_fps_smg_shepheard_body_short.override.wpn_fps_upg_o_var_mbus_front = {a_obj = "a_of_short"}
	self.parts.wpn_fps_smg_shepheard_body_short.override.wpn_fps_upg_o_var_scorpionevo_front = {a_obj = "a_of_short"}
	self.parts.wpn_fps_smg_shepheard_body_short.override.wpn_fps_upg_o_var_troy_front = {a_obj = "a_of_short"}
	self.parts.wpn_fps_smg_shepheard_body_short.override.wpn_fps_upg_o_var_troym4_front = {a_obj = "a_of_short"}
end)