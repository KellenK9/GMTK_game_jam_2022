/// 

if(instance_exists(global.second_target)){
	image_xscale = point_distance(x, y, global.second_target.x, global.second_target.y) / sprite_width
	image_angle = point_direction(x, y, global.second_target.x, global.second_target.y)
}
else{
	if(instance_exists(global.third_target)){
		global.second_target = global.third_target
		global.lightning_targets = 2
		image_xscale = point_distance(x, y, global.second_target.x, global.second_target.y) / sprite_width
		image_angle = point_direction(x, y, global.second_target.x, global.second_target.y)
	}
}
