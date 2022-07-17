/// Step

if(position_meeting(mouse_x, mouse_y, self)){
	image_index = 1
	if(mouse_check_button_pressed(mb_any)){
		audio_stop_all()
		audio_play_sound(Sound_button_click, 1, false)
		room_goto(Room_game)
	}
}
else{
	image_index = 0
}

if(alarm[0] < 0 and keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter)){
	audio_stop_all()
	audio_play_sound(Sound_button_click, 1, false)
	room_goto(Room_game)
}