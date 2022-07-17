
y = y + global.flight_speed

if(y > room_height + 32){
	instance_destroy(self)
}

if(place_meeting(x, y, obj_player) and global.damaged == false and damaged == false){
	global.player_health -= 1
	global.damaged = true
	audio_play_sound(Sound_blop, 1, false)
	instance_destroy(self)
}
