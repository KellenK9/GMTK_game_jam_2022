/// stop moving

if(damaged == false and y > 24){
	y = y - global.flight_speed
}

if(damaged == true and alarm[1] < 0){
	if(sprite_index == spr_ufo_mad){
		instance_destroy(self)
	}
	if(sprite_index == spr_ufo_sad){
		alarm[1] = 90
		sprite_index = spr_ufo_mad
	}
	if(sprite_index == spr_ufo){
		alarm[1] = 90
		sprite_index = spr_ufo_sad
	}
}

if(alarm[2] < 0){
	if(sprite_index == spr_ufo_mad){
		alarm[2] = 120
	}
	if(sprite_index == spr_ufo_sad){
		alarm[2] = 180
	}
	if(sprite_index == spr_ufo){
		alarm[2] = 360
	}
}
