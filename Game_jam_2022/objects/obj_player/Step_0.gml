/// Steps

get_input()

if(xaxis1 > joystick_deadzone or xaxis2 > joystick_deadzone){
	//accelerate right
	ship_speed_x += max(xaxis1, xaxis2) * ship_acceleration
	if(ship_speed_x < 0){ //Stop on a dime
		if(ship_speed_x < -dime_stop_cutoff){
			audio_play_sound(Sound_bump, 1, false)
			instance_create_depth(x, y + (sprite_height/2), 0, obj_dime_stop_left)
		}
		ship_speed_x = 0
	}
}
else if(xaxis1 < -joystick_deadzone or xaxis2 < -joystick_deadzone){
	//accelerate left
	ship_speed_x += min(xaxis1, xaxis2) * ship_acceleration
	if(ship_speed_x > 0){ //Stop on a dime
		if(ship_speed_x > dime_stop_cutoff){
			audio_play_sound(Sound_bump, 1, false)
			instance_create_depth(x + sprite_width, y + (sprite_height/2), 0, obj_dime_stop_right)
		}
		ship_speed_x = 0
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
		if(ship_speed_y < -dime_stop_cutoff){
			audio_play_sound(Sound_bump, 1, false)
			instance_create_depth(x + (sprite_width/2), y, 0, obj_dime_stop_top)
		}
		ship_speed_y = 0
	}
}
else if(yaxis1 < -joystick_deadzone or yaxis2 < -joystick_deadzone){
	//accelerating down
	ship_speed_y += min(yaxis1, yaxis2) * ship_acceleration
	if(ship_speed_y > 0){ //Stop on a dime
		if(ship_speed_y > dime_stop_cutoff){
			audio_play_sound(Sound_bump, 1, false)
			instance_create_depth(x + (sprite_width/2), y + sprite_height, 0, obj_dime_stop_bottom)
		}
		ship_speed_y = 0
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
		audio_play_sound(Sound_bump, 1, false)
		instance_create_depth(0, y + (sprite_height/2), -1, obj_wall_bump_effect_x)
	}
	ship_speed_x = 0
}
else if(x + sprite_width + ship_speed_x > room_width){
	x = room_width - sprite_width
	if(ship_speed_x > wall_effect_cutoff){
		audio_play_sound(Sound_bump, 1, false)
		instance_create_depth(room_width-1, y + (sprite_height/2), -1, obj_wall_bump_effect_x)
	}
	ship_speed_x = 0
}
else{
	x += ship_speed_x
}
//move ship y
if(y + ship_speed_y < 0){
	y = 0
	if(ship_speed_y < -wall_effect_cutoff){
		audio_play_sound(Sound_bump, 1, false)
		instance_create_depth(x + (sprite_width/2), 0, -1, obj_wall_bump_effect_y)
	}
	ship_speed_y = 0
}
else if(y + sprite_height + ship_speed_y > room_height){
	y = room_height - sprite_height
	if(ship_speed_y > wall_effect_cutoff){
		audio_play_sound(Sound_bump, 1, false)
		instance_create_depth(x + (sprite_width/2), room_height-1, -1, obj_wall_bump_effect_y)
	}
	ship_speed_y = 0
}
else{
	y += ship_speed_y
}

//Pick up powerup
if(global.powerup_grabbed){
	audio_play_sound(Sound_dice_shuffle, 1, true)
	alarm[0] = 120
	global.powerup_grabbed = false
	sprite_set_speed(sprite_index, 20, spritespeed_framespersecond)
}

//When damaged
if(global.damaged == true){
	if(alarm[1] < 0){
		alarm[1] = time_damaged
	}
}

//fire weapons
if(global.player_health > 0){
	if(global.dice_equipped == 1){
		if(shoot_pressed){
			audio_play_sound(Sound_laser_bolt, 1, false)
			instance_create_depth(x + (sprite_width/2), y, -1, obj_bolt)
		}
	}
	if(global.dice_equipped == 2){
		if(shoot_held and global.bomb_distance < bomb_max_distance){
			global.bomb_distance += bomb_charge_rate
			audio_play_sound(Sound_charge, 1, false)
			if(!instance_exists(obj_bomb_bar)){
				instance_create_depth(x+8, y+20,-1, obj_bomb_bar)
			}
		}
		if(shoot_released){
			audio_stop_sound(Sound_charge)
			instance_destroy(obj_bomb_bar)
			if(global.bomb_distance < bomb_min_distance){
				audio_play_sound(Sound_splat_small, 1, false)
			}
			else{
				instance_create_depth(x + (sprite_width/2), y, -1, obj_bomb)
			}
			global.bomb_distance = 0
		}
	}
}
