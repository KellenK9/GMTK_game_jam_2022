/// Spawn powerup

instance_activate_object(obj_power_up)
obj_power_up.x = random_range(0, room_width-sprite_get_width(spr_dice_powerup))
obj_power_up.y = -64

