/// Initialize Variables

randomize()
global.player_health = 3
global.dice_equipped = 1
global.flight_speed = 1
global.powerup_grabbed = false
global.damaged = false
ship_speed_x = 0
ship_speed_y = 0
ship_acceleration = 0.1
ship_deceleration = 0.95
joystick_deadzone = 0.1
ship_deceleration_cutoff = 0.1
wall_effect_cutoff = 2 //minimum speed needed to create wall hit effect
dime_stop_cutoff = 2 //minimum speed needed to create dime stop effect
image_index = global.dice_equipped - 1
time_damaged = 30
global.bomb_distance = 0
bomb_max_distance = 10
bomb_min_distance = 2
bomb_charge_rate = 0.05
global.shield_charge = 100
global.max_shield_charge = global.shield_charge
min_shield_energy = 20
global.whip_active = false
lightning_max_distance = 64
lightning_max_targets = 3
global.lightning_distance = 0
global.lightning_targets = 1
lightning_charge_rate = bomb_charge_rate / bomb_max_distance * lightning_max_distance
lightning_min_distance = bomb_min_distance / bomb_max_distance * lightning_max_distance

