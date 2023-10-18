// Use attack hitbox and check for hits
function calc_attack(_sprite){
	mask_index = _sprite;

	var _hit_by_attack_now = ds_list_create();
	var _hits = instance_place_list(x, y, obj_parent_entity, _hit_by_attack_now, false);

	if(_hits > 0){
		for(var _i = 0; _i < _hits; _i++){
			// if this instance has not yet been hit by this attack, then hit it!
			var _hit_id = _hit_by_attack_now[| _i];
			
			if(ds_list_find_index(hit_by_attack, _hit_id) == -1){
				ds_list_add(hit_by_attack, _hit_id);
				
				with(_hit_id){
					if(entity_hit_script != -1) {
						script_execute(entity_hit_script);
					}
					
				}
			}
		}
	}
	ds_list_destroy(_hit_by_attack_now)
	mask_index = spr_player_idle_right;
}