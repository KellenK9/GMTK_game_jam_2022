/// Draw points

if(global.score > 9999){
	x_pos = 320
}
else{
	if(global.score > 999){
		x_pos = 260
	}
	else{
		x_pos = 200
	}
}

if(damaged){
	draw_text(x_pos, display_get_gui_height() - 240, "+100")
}
