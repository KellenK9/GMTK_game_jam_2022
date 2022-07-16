/// Step

y = y + global.flight_speed

if(place_meeting(x, y, obj_player) and global.damaged == false){
	global.player_health -= 1
	global.damaged = true
	//Add sound and animation
	instance_destroy(self)
}
