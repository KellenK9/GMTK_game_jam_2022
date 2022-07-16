/// Draw GUI

//Draw score
draw_text(4, display_get_gui_height() - 24, "Score: " + string(global.score))


//Draw Game Over
if(global.game_over == true){
	draw_text(800, 400, "Game Over")
	if(alarm[2] < 0){
		alarm[2] = 180
	}
}