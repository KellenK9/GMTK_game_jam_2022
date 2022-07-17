/// Steps

//Spawn powerups
if(alarm[0] < 0){
	alarm[0] = powerup_spawn_rate
}

//Spawn meteors
if(alarm[1] < 0){
	alarm[1] = meteor_spawn_rate
}

//Spawn grow aliens
if(alarm[3] < 0){
	alarm[3] = grow_alien_spawn_rate
}

//Spawn UFOs
if(alarm[4] < 0){
	alarm[4] = ufo_spawn_rate
}

//Spawn Enemy ships
if(alarm[5] < 0){
	alarm[5] = ship_spawn_rate
}

//Increase spawn rate
powerup_spawn_rate = powerup_spawn_rate * spawn_rate_increase
meteor_spawn_rate = meteor_spawn_rate * spawn_rate_increase
grow_alien_spawn_rate = grow_alien_spawn_rate * spawn_rate_increase
ufo_spawn_rate = ufo_spawn_rate * spawn_rate_increase
ship_spawn_rate = ship_spawn_rate * spawn_rate_increase

if(global.player_health = 0){
	global.game_over = true
}

if(global.game_over == false){
	global.score += 1
}