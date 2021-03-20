///@func rs_safezone(width, height, [quality]);
///@desc adjust perfectly the screen game to a given safe zone with a width and height.
///@param {real} width Width of the safe zone.
///@param {real} height Height of the safe zone.
///@param {real} [quality] The quality of the application_surface.
var width, height, quality,
	window_width, window_height, scaleX, scaleY, aspect_ratio;
globalvar rs_actual_width, rs_actual_height, rs_ideal_width, rs_ideal_height;

width = argument0;
height = argument1;
quality = (argument_count > 2 ? clamp(argument[2], 0, 1) : 1);
aspect_ratio = width/height;

//Get window/display size
window_width = (window_get_fullscreen() ? display_get_width() : window_get_width());
window_height = (window_get_fullscreen() ? display_get_height() : window_get_height());

if(!variable_global_exists("rs_actual_width") ||
	!variable_global_exists("rs_actual_height") ||
	!variable_global_exists("rs_ideal_width") ||
	!variable_global_exists("rs_ideal_height")){
	rs_actual_width = 0;
	rs_actual_height = 0;
	rs_ideal_width = 0;
	rs_ideal_height = 0;
}

//Adjust screen
if(rs_actual_width != window_width || rs_actual_height != window_height){
	if(!window_get_fullscreen()){
		rs_actual_width = window_width;
		rs_actual_height = window_height;
	}
	
	rs_ideal_width = window_width;
	rs_ideal_height = round(rs_ideal_width/aspect_ratio + 0.5);
	
	if(rs_ideal_height > window_height){
		rs_ideal_height = window_height;
		rs_ideal_width = round(rs_ideal_height*aspect_ratio + 0.5);
	}
	
	scaleX = window_width / rs_ideal_width;
	scaleY = window_height / rs_ideal_height;
	rs_ideal_width = width*scaleX;
	rs_ideal_height = height*scaleY;
	
	surface_resize(application_surface, rs_ideal_width*quality, rs_ideal_height*quality);
	display_set_gui_size(rs_ideal_width, rs_ideal_height);
}

//Avoid stupidities...
window_set_max_width(display_get_width());
window_set_max_height(display_get_height());
window_set_min_width(width);
window_set_min_height(height);

return aspect_ratio;
