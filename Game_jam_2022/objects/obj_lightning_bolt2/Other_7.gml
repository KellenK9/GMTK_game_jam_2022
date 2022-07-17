/// 

image_index = sprite_get_number(spr_lightning) - 1
image_speed = 0

if(global.lightning_targets > 2){
	instance_create_depth(global.second_target.x, global.second_target.y, -1, obj_lightning_bolt3)
}
else{
	instance_destroy(obj_lightning_bolt)
	instance_destroy(self)
}
