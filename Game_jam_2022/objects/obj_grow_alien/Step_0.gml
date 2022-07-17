/// Step

if(image_xscale > max_size){
	growth_scale = 1
	growth_scale_continuous = 1
}

y = y + global.flight_speed

if(y > room_height + 32){
	instance_destroy(self)
}

if(place_meeting(x, y, obj_player) and global.damaged == false and damaged == false){
	global.player_health -= 1
	global.damaged = true
	audio_play_sound(Sound_blop, 1, false)
	instance_destroy(self)
}

if(place_meeting(x, y, obj_player_projectile_parent)){
	if(damaged == false and image_xscale < max_size){
		audio_play_sound(Sound_splat, 10, false)
	}
	damaged = true
	if(alarm[2]<0){
		alarm[2] = 12
	}
	image_xscale = image_xscale * growth_scale
	image_yscale = image_yscale * growth_scale
}
if(place_meeting(x, y, obj_bomb)){
	bomb_id = instance_place(x, y, obj_bomb)
	if(bomb_id.sprite_index != spr_bomb){
		if(damaged == false){
			audio_play_sound(Sound_splat, 10, false)
		}
		damaged = true
		if(alarm[2]<0){
			alarm[2] = 12
		}
		image_xscale = image_xscale * growth_scale
		image_yscale = image_yscale * growth_scale
	}
}
if(instance_exists(obj_whip_node1) and instance_exists(obj_whip_node2) and instance_exists(obj_whip_node3)){
	if(collision_line(obj_player.x+(obj_player.sprite_width/2)-5, obj_player.y, obj_whip_node1.x-5, obj_whip_node1.y, id, true, false) or
	collision_line(obj_player.x+(obj_player.sprite_width/2)+3, obj_player.y, obj_whip_node1.x+3, obj_whip_node1.y, id, true, false) or
	collision_line(obj_whip_node1.x-5, obj_whip_node1.y, obj_whip_node2.x-5, obj_whip_node2.y, id, true, false) or
	collision_line(obj_whip_node1.x+3, obj_whip_node1.y, obj_whip_node2.x+3, obj_whip_node2.y, id, true, false) or
	collision_line(obj_whip_node2.x-5, obj_whip_node2.y, obj_whip_node3.x-5, obj_whip_node3.y, id, true, false) or
	collision_line(obj_whip_node2.x+3, obj_whip_node2.y, obj_whip_node3.x+3, obj_whip_node3.y, id, true, false)
	){
		if(damaged == false){
			audio_play_sound(Sound_meteor_destruction, 10, false)
		}
		damaged = true
		if(alarm[2]<0){
			alarm[2] = 12
		}
		image_xscale = image_xscale * growth_scale_continuous
		image_yscale = image_yscale * growth_scale_continuous
	}
}
