/// @description Progress transition
with(obj_player) state = player_state_transition;

if(leading == OUT){
	percentage = min(1, percentage + TRANSITION_SPEED);
	if (percentage >= 1){//Screen un fully obscured\
		room_goto(target);
		leading = IN;
	}
}else{
	percentage = max(0, percentage - TRANSITION_SPEED);
	if(percentage <= 0){//Screen is fully revealed
		with(obj_player){
			state = player_state_free;
		}
		instance_destroy();
	}
}


