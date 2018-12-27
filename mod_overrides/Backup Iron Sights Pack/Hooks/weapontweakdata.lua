Hooks:PostHook(WeaponTweakData, "init", "BackupIronSightsPackModInit", function(self)
if BeardLib.Utils:FindMod("Custom Attachment Points") then
-- M4
	self:SetupAttachmentPoint("new_m4", {
		name = "a_of",
		base_a_obj = "a_o",
		position = Vector3(0, 17.2, 0),
		rotation = Rotation(0, 0, 0)
	})
	self:SetupAttachmentPoint("new_m4", {
		name = "a_of_moe",
		base_a_obj = "a_o",
		position = Vector3(0, 24, 0),
		rotation = Rotation(0, 0, 0)
	})
	self:SetupAttachmentPoint("new_m4", {
		name = "a_or",
		base_a_obj = "a_o",
		position = Vector3(0, -15, 0),
		rotation = Rotation(0, 0, 0)
	})
-- M16
	self:SetupAttachmentPoint("m16", {
		name = "a_or",
		base_a_obj = "a_o",
		position = Vector3(0, -15, 0),
		rotation = Rotation(0, 0, 0)
	})
-- G36
	self:SetupAttachmentPoint("g36", {
		name = "a_of",
		base_a_obj = "a_o",
		position = Vector3(0, 4.3, 0),
		rotation = Rotation(0, 0, 0)
	})
	self:SetupAttachmentPoint("g36", {
		name = "a_or",
		base_a_obj = "a_o",
		position = Vector3(0, -16.3, 0),
		rotation = Rotation(0, 0, 0)
	})
-- CBRPS Saiga 12K
	self:SetupAttachmentPoint("basset", {
		name = "a_of",
		base_a_obj = "a_o",
		position = Vector3(0, 19, 0),
		rotation = Rotation(0, 0, 0)
	})
	self:SetupAttachmentPoint("basset", {
		name = "a_of_short",
		base_a_obj = "a_o",
		position = Vector3(0, 8.7, 0),
		rotation = Rotation(0, 0, 0)
	})
	self:SetupAttachmentPoint("basset", {
		name = "a_or",
		base_a_obj = "a_o",
		position = Vector3(0, -13, 0),
		rotation = Rotation(0, 0, 0)
	})
-- MP5
	self:SetupAttachmentPoint("new_mp5", {
		name = "a_of",
		base_a_obj = "a_o",
		position = Vector3(0, 0, 0),
		rotation = Rotation(0, 0, 0)
	})
	self:SetupAttachmentPoint("new_mp5", {
		name = "a_or",
		base_a_obj = "a_o",
		position = Vector3(0, -13.5, 0),
		rotation = Rotation(0, 0, 0)
	})
-- CZ-805
	self:SetupAttachmentPoint("hajk", {
		name = "a_of",
		base_a_obj = "a_o",
		position = Vector3(0, 20, 0),
		rotation = Rotation(0, 0, 0)
	})
	self:SetupAttachmentPoint("hajk", {
		name = "a_or",
		base_a_obj = "a_o",
		position = Vector3(0, -19, 0),
		rotation = Rotation(0, 0, 0)
	})
-- SIX-12
	self:SetupAttachmentPoint("rota", {
		name = "a_of",
		base_a_obj = "a_o",
		position = Vector3(0, 11, 0),
		rotation = Rotation(0, 0, 0)
	})
	self:SetupAttachmentPoint("rota", {
		name = "a_or",
		base_a_obj = "a_o",
		position = Vector3(0, -11, 0),
		rotation = Rotation(0, 0, 0)
	})
-- Kriss Vector
	self:SetupAttachmentPoint("polymer", {
		name = "a_of",
		base_a_obj = "a_o",
		position = Vector3(0, 10, 0),
		rotation = Rotation(0, 0, 0)
	})
	self:SetupAttachmentPoint("polymer", {
		name = "a_or",
		base_a_obj = "a_o",
		position = Vector3(0, -19, 0),
		rotation = Rotation(0, 0, 0)
	})
-- X95
	self:SetupAttachmentPoint("komodo", {
		name = "a_of",
		base_a_obj = "a_o",
		position = Vector3(0, 16, 0),
		rotation = Rotation(0, 0, 0)
	})
	self:SetupAttachmentPoint("komodo", {
		name = "a_or",
		base_a_obj = "a_o",
		position = Vector3(0, -13.5, 0),
		rotation = Rotation(0, 0, 0)
	})
-- AK-12
	self:SetupAttachmentPoint("flint", {
		name = "a_of",
		base_a_obj = "a_o",
		position = Vector3(0, 17, 0),
		rotation = Rotation(0, 0, 0)
	})
	self:SetupAttachmentPoint("flint", {
		name = "a_or",
		base_a_obj = "a_o",
		position = Vector3(0, -19, 0),
		rotation = Rotation(0, 0, 0)
	})
-- MPX
	self:SetupAttachmentPoint("shepheard", {
		name = "a_of",
		base_a_obj = "a_o",
		position = Vector3(0, 16, 0),
		rotation = Rotation(0, 0, 0)
	})
	self:SetupAttachmentPoint("shepheard", {
		name = "a_of_short",
		base_a_obj = "a_o",
		position = Vector3(0, 7, 0),
		rotation = Rotation(0, 0, 0)
	})
	self:SetupAttachmentPoint("shepheard", {
		name = "a_or",
		base_a_obj = "a_o",
		position = Vector3(0, -15, 0),
		rotation = Rotation(0, 0, 0)
	})
end
end)