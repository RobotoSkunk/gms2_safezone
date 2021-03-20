/// @description Update
var vx = (keyboard_check(vk_right) || keyboard_check(ord("D"))) - (keyboard_check(vk_left) || keyboard_check(ord("A"))) + (abs(gamepad_axis_value(0, gp_axislh)) > 0.1 ? gamepad_axis_value(0, gp_axislh) : 0);
var vy = (keyboard_check(vk_down) || keyboard_check(ord("S"))) - (keyboard_check(vk_up) || keyboard_check(ord("W"))) + (abs(gamepad_axis_value(0, gp_axislv)) > 0.1 ? gamepad_axis_value(0, gp_axislv) : 0);

hspeed = vx * 5;
vspeed = vy * 5;

x = clamp(x, 25, room_width - 25);
y = clamp(y, 50, room_height - 25);

var scale = 1;
if (speed != 0) {
	if (direction >= 45 && direction < 135) image_index = 2;
	else if (direction >= 135 && direction < 225) { image_index = 1; scale = -1; }
	else if (direction >= 225 && direction < 315) image_index = 0;
	else image_index = 1;
}

ss += 0.05 + 0.25*(speed != 0);

image_xscale = scale + 0.1*sin(ss);
image_yscale = (scale == 1 ? 1.1 - 0.1*sin(ss) : 1 + 0.1*sin(ss));

depth = -y;
