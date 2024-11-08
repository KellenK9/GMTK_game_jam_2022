/// Initialize Variables

powerup_spawn_rate = 800 //lower numbers spawn powerups more frequently
alarm[0] = 120 //start the player off with a powerup
powerup_line_spawn_rate = 3000
meteor_spawn_rate = 100
ship_spawn_rate = 210
grow_alien_spawn_rate = 310
ufo_spawn_rate = 410
spawn_rate_increase = 0.9999
delay_spawn_ship = 500
delay_spawn_grow_alien = 1500
delay_spawn_ufo = 3000
alarm[6] = delay_spawn_ufo
spawn_ship = false
spawn_grow_alien = false
spawn_ufo = false

global.score = 0
global.game_over = false

background_speed1 = 0
background_speed2 = 0.1
background_speed3 = 0.2
background_speed4 = 0.3
background_y1 = 0
background_y2 = 0
background_y3 = 0
background_y4 = 0

window_set_cursor(cr_none)
cursor_sprite = cr_none

//Create instances and deactivate them
instance_create_depth(x, y, 0, obj_dime_stop_left)
instance_deactivate_object(obj_dime_stop_left)
instance_create_depth(x, y, 0, obj_dime_stop_right)
instance_deactivate_object(obj_dime_stop_right)
instance_create_depth(x, y, 0, obj_dime_stop_top)
instance_deactivate_object(obj_dime_stop_top)
instance_create_depth(x, y, 0, obj_dime_stop_bottom)
instance_deactivate_object(obj_dime_stop_bottom)
instance_create_depth(x, y, 0, obj_wall_bump_effect_x)
instance_deactivate_object(obj_wall_bump_effect_x)
instance_create_depth(x, y, 0, obj_wall_bump_effect_y)
instance_deactivate_object(obj_wall_bump_effect_y)
instance_create_depth(x, -64, 0, obj_power_up)
instance_deactivate_object(obj_power_up)
instance_create_depth(x, y, -1, obj_outline)
instance_deactivate_object(obj_outline)
instance_create_depth(x, y, 2, obj_shield)
instance_deactivate_object(obj_shield)
instance_create_depth(x+8, y+20,-1, obj_bomb_bar)
instance_deactivate_object(obj_bomb_bar)
instance_create_depth(x, y,-1, obj_whip_node1)
instance_deactivate_object(obj_whip_node1)
instance_create_depth(x, y,-1, obj_whip_node2)
instance_deactivate_object(obj_whip_node2)
instance_create_depth(x, y,-1, obj_whip_node3)
instance_deactivate_object(obj_whip_node3)
instance_create_depth(x, y, -1, obj_lightning_bar)
instance_deactivate_object(obj_lightning_bar)

//Add fonts
draw_set_font(Font1)

//Play music
audio_play_sound(Sound_space_music1, 1, true)

