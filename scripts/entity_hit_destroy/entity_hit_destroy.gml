// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function entity_hit_destroy(){
	if(image_number - 1 > 0){
		image_speed = 1;
		entity_anim = false;
	}else instance_destroy()
	//instance_destroy();
	
}