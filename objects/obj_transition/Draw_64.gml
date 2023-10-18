/// @description Insert description here
// You can write your code in this editor
if(type == TRANS_TYPE.SLIDE){
	draw_set_color(c_black);
	draw_rectangle(0, 0, width, percentage * half_height, false);
	draw_rectangle(0, height, width, height - (percentage * half_height), false)
}

if(type == TRANS_TYPE.FADE){
	draw_set_alpha(percentage);
	draw_set_color(c_black);
	draw_rectangle(0, 0, width, height, false);
	draw_set_alpha(1);
}

if (type == TRANS_TYPE.ZOOM)
{
	draw_set_color(c_black);
	draw_circle(width * 0.5, height * 0.5, percentage * (FRAME_RATE * 3.5), false);
}

display_set_gui_size(RESOLUTION_W,RESOLUTION_H)