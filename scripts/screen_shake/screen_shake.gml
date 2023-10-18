// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function screen_shake(_magnitude, _frames){
	with(global.i_camera){
		if(_magnitude > shake_remain){
			shake_magnitude = _magnitude;
			shake_remain = shake_magnitude;
			shake_length = _frames;
		}
	}
}