// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function great_sword(){
	image_speed = 2;
	var _end = animation_end();
	var _facing = player_facing();
	
	if(_facing == 1) {
		sprite_index = spr_player_atk_right
		calc_attack(spr_player_atk_rightHB)
	}
	if(_facing == -1) {
		sprite_index = spr_player_atk_left
		calc_attack(spr_player_atk_leftHB)

	}
	
	if (_end){
		image_speed = 1;
		state = player_state_free;
		_end = false;
	}
	
}