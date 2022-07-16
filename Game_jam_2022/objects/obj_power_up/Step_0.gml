/// Step

y = y + global.flight_speed

if(place_meeting(x, y, obj_player)){
	global.powerup_grabbed = true
	instance_destroy(self)
}