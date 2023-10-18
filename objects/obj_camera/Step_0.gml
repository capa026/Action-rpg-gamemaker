/// @description Update Camera

//Update Destination
if(instance_exists(follow)){
	x_to = follow.x;
	y_to = follow.y;
}

// Update Object Position
x += (x_to - x) / 16;
y += (y_to - y) / 16;

//Keep Camera center inside room
x = clamp(x, view_half_width, room_width - view_half_width);
y = clamp(y, view_half_height, room_height - view_half_height);

//Screenshake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);

shake_remain = max(0, shake_remain -((1 / shake_length) * shake_magnitude));

camera_set_view_pos(camera, x - view_half_width, y - view_half_height);