/// @description Draw Text Box

draw_sprite_stretched(spr_text_box, background, x_1, y_1, x_2, y_2); 
draw_set_font(fnt_text);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);

var _print = string_copy(msj, 1, text_progress);

if(responses[0] != -1 && text_progress >= string_length(msj)){
	for(var _i = 0; _i < array_length(responses); _i++){
		_print += "\n";
		if(responses[_i] == ""){}
		else{
			if (_i == response_selected) _print += "> "
			_print += responses[_i]
			if (_i == response_selected) _print += " <"
		}
	}
}
draw_text((x_1 + x_2) / 2, y_1 + 8, _print);
draw_set_color(c_white)
draw_text((x_1 + x_2) / 2, y_1 + 7, _print);

display_set_gui_size(RESOLUTION_W,RESOLUTION_H)
