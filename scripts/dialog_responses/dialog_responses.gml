/// @arg _response
function dialog_responses(_response){
	
	switch(_response){
		case 0: break;
		case 1: new_text_box("Response A", ["0:"]); break;
		case 2: new_text_box("Ok, i new it jsjsjsjs", ["1:Okey dokey", "0:uwu"]); break;
		default: break;
	}
}