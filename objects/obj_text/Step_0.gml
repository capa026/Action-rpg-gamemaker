//Animation ofdrawing the gui and the text
lerp_progress += (1 - lerp_progress) / 50;
text_progress += global.text_speed;

x_1 = lerp(x_1, x1_target, lerp_progress);
x_2 = lerp(x_2, x2_target, lerp_progress);

//Cycle trougth responses
var _up_key = keyboard_check_pressed(vk_down);
var _down_key = keyboard_check_pressed(vk_up);
response_selected += (_down_key - _up_key);

var _max = array_length(responses) - 1;
if (response_selected > _max) response_selected = 0;
if (response_selected < 0) response_selected = _max;


//Interaction with the keyboard
if(obj_player.action_key){
	var _message_len = string_length(msj);
	
	if(text_progress >= _message_len){
		
		if(responses[0] != -1){
			with(origin_instance) dialog_responses(other.response_script[other.response_selected]);
		}
		instance_destroy()
		if (instance_exists(obj_text_queued)){
			with(obj_text_queued) ticket--
		}else{
			with(obj_player){
				state = last_state;
			}
		}
	}else{
		if(text_progress > 2) text_progress = _message_len;
	}
}
