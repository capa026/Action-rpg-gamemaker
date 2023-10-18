// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drop_items(_x, _y, _items){
	var _total_items = array_length(_items);
	
	if(_total_items > 1){
		var _angle_per_item = random(360) / _total_items;
		var _angle = random(360);
		
		for(var _i = 0; _i < _total_items; _i++){
			with(instance_create_layer(_x, _y, "Instances", _items[_i])){
				direction = _angle;
				spd = 0.75 + (_total_items * 0.1) + random(0.1);
			}
			_angle += _angle_per_item;
		}
	}else instance_create_layer(_x, _y, "Instances", _items[0])

}