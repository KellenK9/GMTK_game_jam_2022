/// 

image_index = sprite_get_number(spr_lightning) - 1
image_speed = 0

if(global.lightning_targets > 1){
	instance_create_depth(global.first_target.x, global.first_target.y, -1, obj_lightning_bolt2)
}
else{
	instance_destroy(self)
}
