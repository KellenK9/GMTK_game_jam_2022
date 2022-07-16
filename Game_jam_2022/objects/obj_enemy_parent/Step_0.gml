/// Step

if(damaged == false){
	y = y + global.flight_speed
}

if(place_meeting(x, y, obj_player) and global.damaged == false){
	global.player_health -= 1
	global.damaged = true
	audio_play_sound(Sound_blop, 1, false)
	instance_destroy(self)
}

if(place_meeting(x, y, obj_player_projectile_parent)){
	if(damaged == false){
		audio_play_sound(Sound_splat, 1, false)
	}
	damaged = true
	if(alarm[0] < 0){
		alarm[0] = 30
	}
}
if(place_meeting(x, y, obj_bomb)){
	bomb_id = instance_place(x, y, obj_bomb)
	if(bomb_id.sprite_index != spr_bomb){
		if(damaged == false){
			audio_play_sound(Sound_splat, 1, false)
		}
		damaged = true
		instance_destroy(self)
	}
}
