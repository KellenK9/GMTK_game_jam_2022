/// Move

y -= movement_speed

if(place_meeting(x, y, obj_enemy_parent) or place_meeting(x, y, obj_grow_alien)){
	if(alarm[0] < 0){
		alarm[0] = 2
	}
}

if(y < -10){
	instance_destroy(self)
}