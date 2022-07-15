/// Steps

image_index = global.dice_equipped - 1

get_input()

if(xaxis1 > joystick_deadzone or xaxis2 > joystick_deadzone){
	//accelerate right
	ship_speed_x += max(xaxis1, xaxis2) * ship_acceleration
	if(ship_speed_x < 0){ //Stop on a dime
		ship_speed_x = 0
		dime_stop_left = true
	}
}
else if(xaxis1 < -joystick_deadzone or xaxis2 < -joystick_deadzone){
	//accelerate left
	ship_speed_x += min(xaxis1, xaxis2) * ship_acceleration
	if(ship_speed_x > 0){ //Stop on a dime
		ship_speed_x = 0
		dime_stop_right = true
		instance_create_depth(x + sprite_width, y + (sprite_height/2), 0, obj_dime_stop_right)
	}
}
else{ //decelerate x
	ship_speed_x = ship_speed_x * ship_deceleration
	if(abs(ship_speed_x) < ship_deceleration_cutoff){
		ship_speed_x = 0
	}
}

if(yaxis1 > joystick_deadzone or yaxis2 > joystick_deadzone){
	//accelerating up
	ship_speed_y += max(yaxis1, yaxis2) * ship_acceleration
	if(ship_speed_y < 0){ //Stop on a dime
		ship_speed_y = 0
		dime_stop_bottom = true
	}
}
else if(yaxis1 < -joystick_deadzone or yaxis2 < -joystick_deadzone){
	//accelerating down
	ship_speed_y += min(yaxis1, yaxis2) * ship_acceleration
	if(ship_speed_y > 0){ //Stop on a dime
		ship_speed_y = 0
		dime_stop_top = true
	}
}
else{ //decelerate y
	ship_speed_y = ship_speed_y * ship_deceleration
	if(abs(ship_speed_y) < ship_deceleration_cutoff){
		ship_speed_y = 0
	}
}

//move ship x
if(x + ship_speed_x < 0){
	x = 0
	if(ship_speed_x < -wall_effect_cutoff){
		instance_create_depth(0, y + (sprite_height/2), 0, obj_wall_bump_effect_x)
	}
	ship_speed_x = 0
}
else if(x + sprite_width + ship_speed_x > room_width){
	x = room_width - sprite_width
	ship_speed_x = 0
}
else{
	x += ship_speed_x
}
//move ship y
if(y + ship_speed_y < 0){
	y = 0
	ship_speed_y = 0
}
else if(y + sprite_height + ship_speed_y > room_height){
	y = room_height - sprite_height
	ship_speed_y = 0
}
else{
	y += ship_speed_y
}