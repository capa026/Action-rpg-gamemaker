/// @desc initialize & globals
randomize()

global.game_paused = false
global.text_speed = 0.75;
global.i_camera = instance_create_layer(0,0,layer,obj_camera)
global.target_room = -1;
global.target_x = -1;
global.target_y = -1;
global.target_direction = 0;
global.current_state = noone;
//surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H)
room_goto(ROOM_START)

