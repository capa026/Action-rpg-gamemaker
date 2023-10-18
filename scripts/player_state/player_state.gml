var _move_distance_remaining = 0;
var _activate = 0;
function player_state_free(){
	global.current_state = state;
	//Player Movement
	vx = lengthdir_x(input_magnitude * movement_speed, input_direction);
	vy = lengthdir_y(input_magnitude * movement_speed, input_direction);
	
	can_move = true;

	player_collision()

	//Update Sprite Index
	var _old_sprite = sprite_index;
	
	var _facing_right = player_facing_right();
	var _facing_left = player_facing_left();
	
	// When this state is called check the direction and check if the player is rolling, then change it to the apropriate Sprite
	if((direction == 90 || direction == 270) && sprite_index == spr_player_roll_right || sprite_index == spr_player_hurt_right || sprite_index == spr_player_atk_right) sprite_index = spr_player_run_right
	if((direction == 90 || direction == 270) && sprite_index == spr_player_roll_left || sprite_index == spr_player_hurt_left || sprite_index == spr_player_atk_left) sprite_index = spr_player_run_left
	// New comment added
	if (input_magnitude != 0) {
		direction = input_direction;
		if (_facing_right) {
			if (sprite_index != spr_player_run_right) sprite_index = spr_player_run_right
		}
		if (_facing_left) {
			if (sprite_index != spr_player_run_left) sprite_index = spr_player_run_left
		}
		if(sprite_index == spr_player_idle_right) sprite_index = spr_player_run_right
		if(sprite_index == spr_player_idle_left) sprite_index = spr_player_run_left
		
		

	}else{
		if (_facing_right) sprite_index = spr_player_idle_right;
		if (_facing_left) sprite_index = spr_player_idle_left;
		
		if(sprite_index == spr_player_run_right) sprite_index = spr_player_idle_right
		if(sprite_index == spr_player_run_left) sprite_index = spr_player_idle_left
	}
	
	//ROll
	if(roll_key){
		state = player_state_roll;
		_move_distance_remaining = roll_distance;
	}
	
	//ATTACK
	if(attack_key){
		image_index = 0;
		state = player_state_attack;
		state_attack = great_sword;
		if(!ds_exists(hit_by_attack, ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack)
	}
	
	//Change State
	if(action_key){
		var _activate_x = lengthdir_x(10, direction);
		var _activate_y = lengthdir_y(10, direction);
		_activate = instance_position(x + _activate_x, y + _activate_y, obj_parent_entity)
		
		//Activate the entity
		if(_activate){
			if(_activate.entity_activate_script != -1){
				script_execute_ext(_activate.entity_activate_script,_activate.entity_activate_args);
			}
			
			//Make the NPC face to us
			//if(_activate.entity_npc) direction = point_direction(x, y, other.x, other.y)
		}
		
		
	}
}

function player_state_roll(){
	global.current_state = state;
	var _facing = player_facing();
	
	//Movement
	vx = lengthdir_x(roll_speed, direction);
	vy = lengthdir_y(roll_speed, direction);
	
	_move_distance_remaining = max(0, _move_distance_remaining - roll_speed)
	
	var _collided = player_collision();

	if(_facing == 1) sprite_index = spr_player_roll_right;
	if(_facing == -1) sprite_index = spr_player_roll_left;
	
	//Change State back to free
	if(_move_distance_remaining <= 0) state = player_state_free;
	
	if(_collided){
		state = player_state_bonk;
		_move_distance_remaining = bonk_distance;
		screen_shake(4, 6)
	}
}

function player_state_bonk(){
	global.current_state = state;
	//Movement
	vx = lengthdir_x(bonk_speed , direction - 180);
	vy = lengthdir_y(bonk_speed, direction - 180);
	
	
	_move_distance_remaining = max(0, _move_distance_remaining - bonk_speed)
	
	var _collided = player_collision();

	
	if(sprite_index == spr_player_roll_right) sprite_index = spr_player_hurt_right;
	if(sprite_index == spr_player_roll_left) sprite_index = spr_player_hurt_left;
	
	//change height
	z = sin(((_move_distance_remaining / bonk_distance) * pi)) * bonk_distance_height;
	
	//Change State back to free
	if(_move_distance_remaining <= 0) {
		state = player_state_free;
	}
}
function player_state_locked(){
	//nothing
}

function player_state_attack(){
	script_execute(state_attack)
}

function player_state_transition(){
	global.current_state = state;
	player_collision();
}