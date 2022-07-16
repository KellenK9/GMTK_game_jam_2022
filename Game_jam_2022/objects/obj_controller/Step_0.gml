/// Steps

//Spawn powerups
if(alarm[0] < 0){
	alarm[0] = powerup_spawn_rate
}

//Spawn grunts
if(alarm[1] < 0){
	alarm[1] = meteor_spawn_rate
}

if(global.player_health = 0){
	global.game_over = true
}

if(global.game_over == false){
	global.score += 1
}