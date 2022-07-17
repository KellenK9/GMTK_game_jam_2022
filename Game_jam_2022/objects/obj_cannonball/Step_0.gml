y -= movement_speed

if(y < -(sprite_height/2)){
	instance_destroy(self)
}