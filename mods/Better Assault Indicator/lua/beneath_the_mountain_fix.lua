local _f_queue_dialog = DialogManager.queue_dialog -- Fix for Beneath the Mountain
function DialogManager:queue_dialog(id, ...)
	if id == "Play_loc_jr1_23" then
		managers.hud:SetNormalAssaultOverride()
	end
    return _f_queue_dialog(self, id, ...)
end