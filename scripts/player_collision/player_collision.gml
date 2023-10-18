function player_collision(){
	//Chapter three tells more about thiss function
var _collision = false;
var _entity_list = ds_list_create();
var _entity_count;
//var _entity_count

if (!can_move) return;

// Horizontal Tiles
if(tilemap_get_at_pixel(collision_map, x + vx, y)){
	x -= x mod TILE_SIZE
	if (sign(vx) == 1) x += TILE_SIZE - 1;
	vx = 0;
	_collision = true;
}

//Horizontal Entities
_entity_count = instance_position_list(x + vx, y, obj_parent_entity, _entity_list, false);
var _snap_x;

while(_entity_count > 0){
	var _entity_check = _entity_list[| 0];
	
	if(_entity_check.entity_collision){
		//Move as close as we can
		if(sign(vx) == -1) _snap_x = _entity_check.bbox_right + 1;
		else _snap_x = _entity_check.bbox_left - 1;
		x = _snap_x;
		vx = 0;
		_collision = true;
		_entity_count = 0;
	}
	ds_list_delete(_entity_list, 0);
	_entity_count--;
}

// Horizontal Move
x += vx;

ds_list_clear(_entity_list)

// Vertical Tiles
if(tilemap_get_at_pixel(collision_map, x, y + vy)){
	y -= y mod TILE_SIZE
	if (sign(vy) == 1) y += TILE_SIZE - 1;
	vy = 0;
	_collision = true;
}

//Vertical Entities
_entity_count = instance_position_list(x, y + vy, obj_parent_entity, _entity_list, false);
var _snap_y;

while(_entity_count > 0){
	var _entity_check = _entity_list[| 0];
	
	if(_entity_check.entity_collision){
		//Move as close as we can
		if(sign(vy) == -1) _snap_y = _entity_check.bbox_bottom + 1;
		else _snap_y = _entity_check.bbox_top - 1;
		y = _snap_y;
		vy = 0;
		_collision = true;
		_entity_count = 0;
	}
	ds_list_delete(_entity_list, 0);
	_entity_count--;
}

// Vertical Move
y += vy;

ds_list_destroy(_entity_list);
return _collision;
}


function player_facing_right(){
	var _facing = 0;
	if (direction == 0 || direction < 90 || direction > 270) _facing = 1
	
	return _facing
}
function player_facing_left(){
	var _facing = 0;
	if (direction == 180 || direction > 90 && direction < 270) _facing = 1
	
	return _facing
}

function player_facing(){
	var _facing = 0;
	
	if (input_magnitude == 0) {
		if(sprite_index == spr_player_idle_right) direction = 0;
		if(sprite_index == spr_player_idle_left) direction = 180;
	}else{
		if(direction == 90 || direction == 270){
			if(sprite_index == spr_player_atk_right) _facing = 1;
			if(sprite_index == spr_player_atk_left) _facing = -1;
		}
	}
	
	if(sprite_index == spr_player_run_right || player_facing_right()) _facing = 1;
	if(sprite_index == spr_player_run_left || player_facing_left()) _facing = -1;
	
	print(_facing)
	return _facing
}