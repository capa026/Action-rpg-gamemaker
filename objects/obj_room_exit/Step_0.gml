/// @description Cause a room Transition
if(instance_exists(obj_player) && position_meeting(obj_player.x, obj_player.y,id)){
	if(!instance_exists(obj_transition)){
		global.target_room = target_room;
		global.target_x = target_x;
		global.target_y = target_y;
		global.target_direction = obj_player.direction;
		with(obj_player) {
			state = player_state_transition;
			can_move = false;
		}
		room_transition(TRANS_TYPE.SLIDE, target_room);
		instance_destroy();
	}
}






