/// go to player and change appearance

percent_charge = global.shield_charge / global.max_shield_charge
image_index = floor((1-percent_charge) * sprite_get_number(spr_ship_outline))
if(global.shield_charge < 1){
	image_index = sprite_get_number(spr_ship_outline) - 1
}

x = obj_player.x - 1
y = obj_player.y - 1
