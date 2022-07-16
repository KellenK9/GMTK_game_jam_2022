///desc get_input()
function get_input() {

	rKey1 = max(keyboard_check(ord("D")), 0);
	lKey1 = max(keyboard_check(ord("A")), 0);
	dKey1 = max(keyboard_check(ord("S")), 0);
	uKey1 = max(keyboard_check(ord("W")), 0);
	rKey2 = max(keyboard_check(vk_right), 0);
	lKey2 = max(keyboard_check(vk_left), 0);
	dKey2 = max(keyboard_check(vk_down), 0);
	uKey2 = max(keyboard_check(vk_up), 0);

	xaxis1 = (rKey1 - lKey1);
	yaxis1 = (dKey1 - uKey1);
	xaxis2 = (rKey2 - lKey2);
	yaxis2 = (dKey2 - uKey2);
	
	shoot_pressed = keyboard_check_pressed(vk_space)
	shoot_held = keyboard_check(vk_space)
	shoot_released = keyboard_check_released(vk_space)

	if (gamepad_is_connected(0)){
		rKey = gamepad_button_check(0, gp_padr);
		lKey = gamepad_button_check(0, gp_padl);
		uKey = gamepad_button_check(0, gp_padu);
		dKey = gamepad_button_check(0, gp_padd);
		xaxis1 = gamepad_axis_value(0, gp_axislh)
		yaxis1 = gamepad_axis_value(0, gp_axislv)
		xaxis2 = gamepad_axis_value(0, gp_axisrh)
		yaxis2 = gamepad_axis_value(0, gp_axisrv)
		if(gamepad_button_check_pressed(0, gp_shoulderrb) or gamepad_button_check_pressed(0, gp_face1)){
			shoot_pressed = true
		}
		else{
			shoot_pressed = false
		}
		if(gamepad_button_check(0, gp_shoulderrb) or gamepad_button_check(0, gp_face1)){
			shoot_held = true
		}
		else{
			shoot_held = false
		}
		if(gamepad_button_check_released(0, gp_shoulderrb) or gamepad_button_check_released(0, gp_face1)){
			shoot_released = true
		}
		else{
			shoot_released = false
		}
	}


}
