// Get Player Input
left_key = keyboard_check(vk_left);
right_key = keyboard_check(vk_right);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);

roll_key = keyboard_check_pressed(vk_space);
attack_key = keyboard_check_pressed(ord("X"));
item_key = keyboard_check_pressed(ord("C"));
action_key = keyboard_check_pressed(ord("Z"));

input_direction = point_direction(0,0,right_key - left_key, down_key - up_key);
input_magnitude = (right_key - left_key != 0) || (down_key - up_key != 0);

if(!global.game_paused)script_execute(state);
depth = -bbox_bottom;