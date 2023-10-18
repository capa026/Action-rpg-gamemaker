if(!global.game_paused){
	
	//Bounce
	if(bounce_count != 0){
		bounce += (pi * bounce_speed);
		if (bounce > pi){
			bounce -= pi;
			bounce_height *= 0.6;
			bounce_count--;
		}
		z = sin(bounce) * bounce_height;
	}else z = 0;
	
	//Deteriorate
	deteriorate++;
	if(deteriorate > deteriorate_after){
		image_alpha -= 1 / deteriorate_time;
		if (image_alpha <= 0) instance_destroy();
	}
	
	//Friction
	fric = 0.08;
	if (z == 0) fric = 0.10;
	
	x += lengthdir_x(spd, direction);
	y += lengthdir_y(spd, direction);
	if (tilemap_get_at_pixel(collision_map, x, y) > 0) spd = 0;
	spd = max(spd - fric, 0);
	
}