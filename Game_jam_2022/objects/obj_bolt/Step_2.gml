/// Move

y -= movement_speed

if(place_meeting(x, y, obj_enemy_parent)){
	if(alarm[0] < 0){
		alarm[0] = 2
	}
}

if(y < -10){
	instance_destroy(self)
}