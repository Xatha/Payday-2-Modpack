Hooks:PostHook(WeaponFactoryTweakData, "create_bonuses", "CAFCWMod_MWSNICK_Init", function(self)
-- Replace "MWSNICK" with your mostly used nick on Modworkshop in unique hook id.

if self.wpn_fps_smg_example then
-- This will checks if Factory ID of custom weapon exist in game.

-- Adding custom attachments to custom weapons are done by using "cafcw_add_to_parts" function.
-- First parameter in function is part type there are few defined types that requires additional parameters and these are explained below this part.
	self:cafcw_add_to_parts("sight", "wpn_fps_smg_example", "wpn_fps_upg_o_kobra", "specter", "wpn_fps_ass_flint")
-- In this case part type is "sight" followed by ID of custom weapon "wpn_fps_smg_example".
-- Next parameter is ID of custom attachment ("wpn_fps_upg_o_kobra") that will be added to weapon if such ID exist in game.
-- And 2 last parameters in this example ("specter", "wpn_fps_ass_flint") are required data for sights stance_mod and these are exactly same as used in custom weapon "weaponfactorytweakdata" hook for adding stance_mod base game sights.

-- Defined part types:
-- Sight:
	self:cafcw_add_to_parts("sight", "wpn_fps_smg_example", "wpn_fps_upg_o_acogrmr", "acog", "wpn_fps_ass_flint")
	self:cafcw_add_to_parts("sight", "wpn_fps_smg_example", "wpn_fps_upg_o_ta648", "wpn_fps_upg_o_shortdot", "wpn_fps_snp_msr")
	self:cafcw_add_to_parts("sight", "wpn_fps_smg_example", "wpn_fps_upg_o_delta_rm55", "wpn_fps_upg_o_45rds", "wpn_fps_ass_flint")
-- Function call explained - ("sight", "Factory ID of custom weapon", "ID of custom sight", "ID of sight that stance_mod will be copied", "Factory ID of base weapon")
-- Note. ID of sights "wpn_fps_upg_o_specter" and "wpn_fps_upg_o_acog" can be shorted with "specter" and "acog".

-- Sight with rail (sight_rail):
	self:cafcw_add_to_parts("sight_rail", "wpn_fps_smg_example", "wpn_fps_upg_o_kobra", "specter", "wpn_fps_ass_flint", "wpn_fps_smg_example_sight_rail")
-- Same as above but with last parameter being ID of added sight rail.

-- Sight with stance_mod copied from scope mount override table (sight_smcopy):
	self:cafcw_add_to_parts("sight_smcopy", "wpn_fps_smg_example", "wpn_fps_upg_o_kobra", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14")
-- Function call explained - ("sight_smcopy", "Factory ID of custom weapon", "ID of custom sight", "ID of scope mount attachment", "ID of sight that stance_mod will be copied from scope mount override table", "Factory ID of base weapon")
-- Note. ID of sights "wpn_fps_upg_o_specter" and "wpn_fps_upg_o_acog" can be shorted with "specter" and "acog".

-- Sight with stance_mod from scope mount override table with rail (sight_smcopy_rail):
	self:cafcw_add_to_parts("sight_smcopy_rail", "wpn_fps_smg_example", "wpn_fps_upg_o_kobra", "wpn_fps_upg_o_m14_scopemount", "specter", "wpn_fps_ass_m14", "wpn_fps_smg_example_scope_mount")
-- Same as above but with last parameter being ID of added sight rail.

-- Sight with fixed stance_mod value (sight_vector):
	self:cafcw_add_to_parts("sight_vector", "wpn_fps_smg_example", "wpn_fps_upg_o_1p69", "-0.002,-20,-4.275")
-- Function call explained - ("sight_vector", "Factory ID of custom weapon", "ID of custom sight", "Vector3 value - Note: Value can't have spaces")
-- Note: Rotation value is currently not supported.

-- Sight with fixed stance_mod value and with rail (sight_vector_rail):
	self:cafcw_add_to_parts("sight_vector_rail", "wpn_fps_smg_example", "wpn_fps_upg_o_1p69", "-0.002,-20,-4.275", "wpn_fps_smg_example_sight_rail")
-- Same as above but with last parameter being ID of added sight rail.

-- Gadget:
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_example", "wpn_fps_upg_fl_wml")
-- Function call explained - ("gadget", "Factory ID of custom weapon", "ID of custom gadget")

-- Gadget with rail (gadget_rail):
	self:cafcw_add_to_parts("gadget_rail", "wpn_fps_smg_example", "wpn_fps_upg_fl_ass_spotter", "wpn_fps_smg_example_gadget_rail")
-- Same as above but with last parameter being ID of added gadget rail.
-- If you need similar function but not categorized for gadgets you can use "attach_adds" part type.

-- Custom attachment overrides part unit (part_unit_ovr):
	self:cafcw_add_to_parts("part_unit_ovr", "wpn_fps_smg_example_barrel", "wpn_fps_upg_ns_ass_smg_tromix", "units/mods/weapons/wpn_fps_smg_example_pts/wpn_fps_smg_example_barrel_threaded")
-- Function call explained - ("part_unit_ovr", "ID of attachment that unit will be overrided when custom attachment is added", "ID of custom attachment", "Path to unit")

-- Part override custom attachment a_obj (part_a_obj_ovr):
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_smg_example_sight_rail_high", "wpn_fps_upg_o_kobra", "a_o_high")
-- Function call explained - ("part_a_obj_ovr", "ID of attachment that will override a_obj", "ID of custom attachment", "Used a_obj ID")

-- Weapon override custom attachment a_obj (wpn_a_obj_ovr):
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_smg_example", "wpn_fps_upg_o_kobra", "a_o_sm")
-- Function call explained - ("wpn_a_obj_ovr", "Factory ID of custom weapon", "ID of custom attachment", "Used a_obj ID")

-- Weapon override custom attachment a_obj and parent (wpn_a_obj_parent_ovr):
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_smg_example", "wpn_fps_ass_ns_g_sup1", "a_ns", "barrel")
-- Same as above but with last parameter being used parent type.

-- Weapon override custom attachment parent (wpn_parent_ovr):
	self:cafcw_add_to_parts("wpn_parent_ovr", "wpn_fps_smg_example", "wpn_fps_ass_ns_g_sup2", "barrel")
-- Function call explained - ("wpn_parent_ovr", "Factory ID of custom weapon", "ID of custom attachment", "Parent type")

-- Forbids:
	self:cafcw_add_to_parts("forbids", "wpn_fps_upg_o_45rds", "wpn_fps_smg_example_sight_rail_high")
-- Function call explained - ("forbids", "ID of custom attachment that will receive ID to forbids table", "ID of forbidden attachment")

-- Forbids adds:
	self:cafcw_add_to_parts("forbids_add", "wpn_fps_upg_o_45rds", "wpn_fps_smg_example_sight_rail_high")
-- Function call explained - ("forbids_add", "ID of forbidden custom attachment", "ID of attachment that will receive ID to forbids table")

-- You can also create own part type names to categories added custom attachments:
	self:cafcw_add_to_parts("barrel_ext", "wpn_fps_smg_example", "wpn_fps_ass_ns_g_sup3")
	self:cafcw_add_to_parts("other", "wpn_fps_smg_example", "wpn_fps_riflein556")
	self:cafcw_add_to_parts("stock", "wpn_fps_smg_example", "wpn_fps_upg_m4_s_caastock")
	self:cafcw_add_to_parts("gadget", "wpn_fps_smg_example", "wpn_fps_upg_fl_wml")
-- These examples will only add custom attchment to custom weapon:
-- Function call explained - ("PART_TYPE_NAME", "ID of custom attachment")
end
end)
--[[
Adding new script to mod for own custom weapons:
1. Save this file as weaponfactorytweakdata_MWSNICK where "MWSNICK" is your mostly used nick on Modworkshop.
2. Open main.xml and add:
		<hook file="weaponfactorytweakdata_MWSNICK.lua" source_file="lib/tweak_data/weaponfactorytweakdata"/>
To <Hooks> group.
3. Test modified mod with added script in-game.

Publishing script to mod
1. Submit push request with changes on Github.
2. After push get accepted and uploaded on MWS you will be get access to CAFCW mod.
Alternatively you can ask one modders that have access to CAFCW mod page on MWS discord to upload it.

Uploading update on MWS - http://modwork.shop/19169
1. After finishing changes to script open main.xml and increase version="" value by 0.001.
2. On MWS in edit page change version value to same as in XML.
3. Upload packed mod in ZIP format.
]]
