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

get_input()

if(alarm[0] < 0 and shoot_pressed){
	audio_stop_all()
	audio_play_sound(Sound_button_click, 1, false)
	room_goto(Room_game)
}