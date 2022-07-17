/// Steps

get_input()

if(xaxis1 > joystick_deadzone or xaxis2 > joystick_deadzone){
	//accelerate right
	ship_speed_x += max(xaxis1, xaxis2) * ship_acceleration
	if(ship_speed_x < 0){ //Stop on a dime
		if(ship_speed_x < -dime_stop_cutoff){
			audio_play_sound(Sound_bump, 1, false)
			instance_activate_object(obj_dime_stop_left)
			obj_dime_stop_left.x = x
			obj_dime_stop_left.y = y + (sprite_height/2)
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
			instance_activate_object(obj_dime_stop_right)
			obj_dime_stop_right.x = x + sprite_width
			obj_dime_stop_right.y = y + (sprite_height/2)
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
			instance_activate_object(obj_dime_stop_top)
			obj_dime_stop_top.x = x + (sprite_width/2)
			obj_dime_stop_top.y = y
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
			instance_activate_object(obj_dime_stop_bottom)
			obj_dime_stop_bottom.x = x + (sprite_width/2)
			obj_dime_stop_bottom.y = y + sprite_height
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
		instance_activate_object(obj_wall_bump_effect_x)
		obj_wall_bump_effect_x.x = 0
		obj_wall_bump_effect_x.y = y + (sprite_height/2)
		obj_wall_bump_effect_x.image_index = 0
	}
	ship_speed_x = 0
}
else if(x + sprite_width + ship_speed_x > room_width){
	x = room_width - sprite_width
	if(ship_speed_x > wall_effect_cutoff){
		audio_play_sound(Sound_bump, 1, false)
		instance_activate_object(obj_wall_bump_effect_x)
		obj_wall_bump_effect_x.x = room_width-1
		obj_wall_bump_effect_x.y = y + (sprite_height/2)
		obj_wall_bump_effect_x.image_index = 0
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
		instance_activate_object(obj_wall_bump_effect_y)
		obj_wall_bump_effect_y.x = x + (sprite_width/2)
		obj_wall_bump_effect_y.y = 0
		obj_wall_bump_effect_y.image_index = 0
	}
	ship_speed_y = 0
}
else if(y + sprite_height + ship_speed_y > room_height){
	y = room_height - sprite_height
	if(ship_speed_y > wall_effect_cutoff){
		audio_play_sound(Sound_bump, 1, false)
		instance_activate_object(obj_wall_bump_effect_y)
		obj_wall_bump_effect_y.x = x + (sprite_width/2)
		obj_wall_bump_effect_y.y = room_height-1
		obj_wall_bump_effect_y.image_index = 0
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
				instance_activate_object(obj_bomb_bar)
				obj_bomb_bar.x = x+8
				obj_bomb_bar.y = y+20
				obj_bomb_bar.image_index = 0
				obj_bomb_bar.image_speed = 1
			}
		}
		if(shoot_released){
			audio_stop_sound(Sound_charge)
			instance_deactivate_object(obj_bomb_bar)
			if(global.bomb_distance < bomb_min_distance){
				audio_play_sound(Sound_splat_small, 1, false)
			}
			else{
				instance_create_depth(x + (sprite_width/2), y, -1, obj_bomb)
			}
			global.bomb_distance = 0
		}
	}
	else{
		instance_deactivate_object(obj_bomb_bar)
	}
	if(global.dice_equipped == 3){
		instance_activate_object(obj_outline)
		if(shoot_held){
			if(global.shield_charge < 1){
				global.shield_charge = 0
			}
			if(!instance_exists(obj_shield) and global.shield_charge > min_shield_energy){
				instance_activate_object(obj_shield)
				obj_shield.x = x + (sprite_width/2)
				obj_shield.y = y + (sprite_height/2)
			}
			if(instance_exists(obj_shield)){
				global.shield_charge -= 1
			}
		}
		else{
			instance_deactivate_object(obj_shield)
		}
		if(global.shield_charge < 1){
			instance_deactivate_object(obj_shield)
		}
		if(!instance_exists(obj_shield) and global.shield_charge < global.max_shield_charge){
			global.shield_charge += 1
		}
	}
	else{
		instance_deactivate_object(obj_shield)
	}
	if(global.dice_equipped == 4){
		if(shoot_held){
			audio_play_sound(Sound_buzz, 1, true)
			global.whip_active = true
			if(!instance_exists(obj_whip_node1)){
				instance_activate_object(obj_whip_node1)
				obj_whip_node1.x = x + (sprite_width/2)
				obj_whip_node1.y = y
			}
			if(!instance_exists(obj_whip_node2)){
				instance_activate_object(obj_whip_node2)
				obj_whip_node2.x = x + (sprite_width/2)
				obj_whip_node2.y = y
			}
			if(!instance_exists(obj_whip_node3)){
				instance_activate_object(obj_whip_node3)
				obj_whip_node3.x = x + (sprite_width/2)
				obj_whip_node3.y = y
			}
		}
		else{
			global.whip_active = false
			audio_stop_sound(Sound_buzz)
		}
	}
	else{
		audio_stop_sound(Sound_buzz)
		global.whip_active = false
		instance_deactivate_object(obj_whip_node1)
		instance_deactivate_object(obj_whip_node2)
		instance_deactivate_object(obj_whip_node3)
	}
	if(global.dice_equipped == 5){
		instance_activate_object(obj_outline)
		if(shoot_pressed){
			if(global.shield_charge == global.max_shield_charge){
				global.shield_charge = 0
				audio_play_sound(Sound_laser_bolt, 1, false)
				instance_create_depth(x+(sprite_width/2),y,-2,obj_cannonball)
			}
		}
		if(global.shield_charge < global.max_shield_charge){
			global.shield_charge += 1
		}
	}
	if(global.dice_equipped != 3 and global.dice_equipped != 5){
		instance_deactivate_object(obj_outline)
	}
}
