/// @description Insert description here
// You can write your code in this editor
bounce = 0;
deteriorate = 0;
z = 0
spd = 0;
fric = 0;
image_speed = 0;
image_index = irandom(image_number - 1);
collision_map = layer_tilemap_get_id(layer_get_id("col"));
image_xscale = choose(-1, 1);