/// @description Drop fragments and items
if(entity_fragment_count > 0){
	fragment_array = array_create(entity_fragment_count, entity_fragment);
	drop_items(x, y, fragment_array);
}




