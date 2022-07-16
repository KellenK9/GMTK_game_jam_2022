/// Draw backgrounds

draw_sprite(spr_space, 0, 0, 0)
draw_sprite_tiled_ext(spr_stars1, 0, 0, background_y1, 320/256, 320/256, c_white, 1)
draw_sprite_tiled_ext(spr_stars2, 0, 0, background_y2, 320/256, 320/256, c_white, 1)
draw_sprite_tiled_ext(spr_stars3, 0, 0, background_y3, 320/256, 320/256, c_white, 1)
draw_sprite_tiled_ext(spr_stars4, 0, 0, background_y4, 320/256, 320/256, c_white, 1)

background_y1 += background_speed1
background_y2 += background_speed2
background_y3 += background_speed3
background_y4 += background_speed4
