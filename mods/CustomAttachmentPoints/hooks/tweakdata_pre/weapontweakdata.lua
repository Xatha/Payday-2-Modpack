function RotationCAP( yaw, pitch, roll )
	local rotation_object = {
		values = {
			yaw = yaw,
			pitch = pitch,
			roll = roll
		},

		yaw = function(self) return self.values.yaw end,
		pitch = function(self) return self.values.pitch end,
		roll = function(self) return self.values.roll end
	}

	return rotation_object
end