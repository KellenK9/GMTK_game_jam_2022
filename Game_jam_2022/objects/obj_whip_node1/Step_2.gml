/// Move towards player

if(global.whip_active){
	destination_x = obj_player.x + (obj_player.sprite_width/2)
	destination_y = obj_player.y - distance_from_player
	x = x + ((destination_x - x) * distance_covered)
	y = y + ((destination_y - y) * distance_covered)
}
else{
	destination_x = obj_player.x + (obj_player.sprite_width/2)
	destination_y = obj_player.y
	x = x + ((destination_x - x) * distance_covered)
	y = y + ((destination_y - y) * distance_covered)
	if(alarm[1] < 0){
		alarm[1] = 12
	}
}
