/// Destroy after animation

if(image_index > sprite_get_number(sprite_index)-1){
	if(alarm[0] < 0){
		alarm[0] = floor(60/sprite_get_speed(sprite_index))
	}
}