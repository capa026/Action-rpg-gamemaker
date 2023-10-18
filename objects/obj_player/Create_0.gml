if(global.target_x != -1){
	direction = global.target_direction;
	x = global.target_x;
	y = global.target_y;
}
state = player_state_free;
state_attack = great_sword;
hit_by_attack = -1;

last_state = state;
collision_map = layer_tilemap_get_id(layer_get_id("col"))

left_key = 0;
right_key = 0;
up_key = 0;
down_key = 0;

roll_key = 0;
attack_key = 0;
item_key = 0;
action_key = 0;

input_direction = 0
input_magnitude = 0

can_move = true;

vx = 0;
vy = 0;

z = 0;

movement_speed = 2.0;
roll_speed = 6;
roll_distance = 64;

bonk_distance = 32;
bonk_distance_height = 12;
bonk_speed = 1.5;

