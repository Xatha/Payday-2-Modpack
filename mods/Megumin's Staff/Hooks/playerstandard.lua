if XAudio then
  blt.xaudio.setup()
  local sound_buffer = XAudio.Buffer:new(ModPath .. "assets/soundbank/megumins_staff_charge.ogg")
  
  local _check_action_melee_original = PlayerStandard._check_action_melee
  function PlayerStandard:_check_action_melee(t, input, ...)
    local melee_entry = managers.blackmarket:equipped_melee_weapon()
    
    if melee_entry == "megumins_staff" then
      if self._state_data.meleeing and not self._playing_charge then
        self._playing_charge = XAudio.Source:new(sound_buffer)
      elseif not self._state_data.meleeing and self._playing_charge then
        if not self._playing_charge:is_closed() then
          self._playing_charge:close()
        end
        self._playing_charge = nil
      end
    end

    return _check_action_melee_original(self, t, input, ...)
  end
  
end

local _do_melee_damage_original = PlayerStandard._do_melee_damage
function PlayerStandard:_do_melee_damage(t, bayonet_melee, melee_hit_ray, melee_entry, ...)
  local col_ray = _do_melee_damage_original(self, t, bayonet_melee, melee_hit_ray, melee_entry, ...)
  
  melee_entry = melee_entry or managers.blackmarket:equipped_melee_weapon()
  if melee_entry == "megumins_staff" then
    local melee_damage_delay = tweak_data.blackmarket.melee_weapons[melee_entry].melee_damage_delay or 0
    local charge_lerp_value = self:_get_melee_charge_lerp_value(t, melee_damage_delay)
    if charge_lerp_value >= 1 then
      local slot_mask = managers.slot:get_mask("explosion_targets")
      local from = self._unit:movement():m_head_pos()
      local dir = self._unit:movement():m_head_rot():y()
      local ray = World:raycast("ray", from, from + dir * 2000, "slot_mask", slot_mask)
      local position = from + dir * (ray and ray.distance - 10 or 2000)
      do_explosion(position, -dir, slot_mask)
      self._unit:character_damage():set_health(0)
      self._unit:character_damage():_check_bleed_out(nil, true)
      managers.player:set_player_state("fatal")
    end
  end
  
  return col_ray
end

function do_explosion(position, normal, slot_mask)
  local user_unit = managers.player:local_player()
  local slot_mask = managers.slot:get_mask("explosion_targets")
  local damage = 2000
  local range = 1000
  managers.explosion:play_sound_and_effects(position, normal, range, {
    sound_event = "grenade_explode",
    effect = "effects/payday2/particles/explosions/grenade_explosion",
    sound_muffle_effect = true,
    feedback_range = range * 2,
    idstr_decal = Idstring("explosion_round"),
    idstr_effect = Idstring("")
  })
  managers.explosion:detect_and_give_dmg({
    hit_pos = position,
    range = range,
    collision_slotmask = slot_mask,
    curve_pow = 2,
    damage = damage,
    player_damage = 0,
    user = user_unit,
    owner = user_unit:inventory():equipped_unit()
  })
  local network_damage = math.ceil(damage * 163.84)
  managers.network:session():send_to_peers_synched("sync_explode_bullet", position, normal, math.min(16384, network_damage), managers.network:session():local_peer():id())
end