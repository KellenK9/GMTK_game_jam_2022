/// Draw

if(global.damaged == true){
	image_blend = c_red
}
else{
	image_blend = c_white
}

draw_self()

//Draw health
if(global.player_health >= 2){
	draw_sprite(spr_heart, 0 , x + 8, y + 22)
}
if(global.player_health >= 3){
	draw_sprite(spr_heart, 0 , x + 17, y + 22)
}