
function new_text_box(_message, _responses){
	
	var _obj = instance_exists(obj_text) ? obj_text_queued : obj_text;
	
	with(instance_create_layer(0,0,"Instances", _obj)){
		msj = _message;
		origin_instance = instance_exists(other) ? other.id : noone;

		if(is_undefined(_responses)){
			responses = [-1];
			response_script = [-1];
		}else{
			//Trim markers from responses
			var _array = _responses;
			for (var _i = 0; _i < array_length(_array); _i++){
				responses[_i] = _array[_i];
				var _marker = string_pos(":", responses[_i]);
				response_script[_i] = string_copy(responses[_i], 1, _marker - 1);
				response_script[_i] = real(response_script[_i]);
				responses[_i] = string_delete(responses[_i], 1, _marker)
			}
		}
	}
	
	with(obj_player){
		if(state != player_state_locked){
			last_satate = state;
			state = player_state_locked;
		}
	}
}

//function new_text_box(_message, _responses){
	
//	var _obj = instance_exists(obj_text) ? obj_text_queued : obj_text;
	
//	with(instance_create_layer(0,0,"Instances", _obj)){
//		msj = _message;
//		origin_instance = instance_exists(other) ? other.id : noone;

		
//		if(is_undefined(_responses)){
//			responses = [-1];
//			response_script = [-1];
//		}else{
//			//Trim markers from responses
//			var _array = _responses;
//			for (var _i = 0; _i < array_length(_array); _i++){
//				responses[_i] = _array[_i];
//				var _marker = string_pos(":", responses[_i]);
//				response_script[_i] = string_copy(responses[_i], 1, _marker - 1);
//				response_script[_i] = real(response_script[_i]);
//				responses[_i] = string_delete(responses[_i], 1, _marker)
//			}
//		}
//	}
	
//	with(obj_player){
//		if(state != player_state_locked){
//			last_satate = state;
//			state = player_state_locked;
//		}
//	}
//}