/// Powerup die chosen

audio_stop_sound(Sound_dice_shuffle)
audio_play_sound(Sound_dice_roll, 1, false)
sprite_set_speed(sprite_index, 0, spritespeed_framespersecond)
global.dice_equipped = irandom_range(1, 6)
image_index = global.dice_equipped - 1