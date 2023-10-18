/// @description Set up Camera
camera = view_camera[0];
follow = obj_player;
view_half_width = camera_get_view_width(camera) * 0.5;
view_half_height = camera_get_view_height(camera) * 0.5;

x_to = xstart;
y_to = ystart;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;

