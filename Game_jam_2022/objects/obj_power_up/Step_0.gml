/// Step

y = y + global.flight_speed

if(place_meeting(x, y, obj_player)){
	global.powerup_grabbed = true
	instance_deactivate_object(self)
}

if(y > room_height + 32){
	instance_deactivate_object(self)
}