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

//Draw line between whip nodes
if(instance_exists(obj_whip_node1) and instance_exists(obj_whip_node2) and instance_exists(obj_whip_node3)){
	draw_set_color($0F0B9E)
	draw_line_width(x+(sprite_width/2)-1,y,obj_whip_node1.x-1,obj_whip_node1.y, 8)
	draw_line_width(obj_whip_node1.x-1,obj_whip_node1.y,obj_whip_node2.x-1,obj_whip_node2.y, 8)
	draw_line_width(obj_whip_node2.x-1,obj_whip_node2.y,obj_whip_node3.x-1,obj_whip_node3.y, 8)
	draw_set_color(c_white)
}
