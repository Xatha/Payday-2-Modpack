function WeaponTweakData:SetupAttachmentPoint( id, attachment_table )
	if not ( self[id] ) then return end

	if not ( self[id].attachment_points ) then
		self[id].attachment_points = {}
	end

	table.insert( self[id].attachment_points, attachment_table )
end