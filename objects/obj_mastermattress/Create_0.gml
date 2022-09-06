/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

CM_Commands = function(){
clear_commands();	
var _active = obj_RoomHandler.Active_inflatable;
if(_active){
	var _size = get_active_inflatable_size();
	var _Infl = _active.object_index;
	show_debug_message(_Infl)
	switch(_Infl){
		case obj_Active_Rat:
			switch(_size){
				case 1: create_struct_textbox("Rat_1",Dialogue); break;
				case 2: create_struct_textbox("Rat_2",Dialogue); break;
				case 3: create_struct_textbox("Rat_3",Dialogue); break;
				}
			break;
		default: create_struct_textbox("Empty",Dialogue); break; //failure
		}
	}
	else{ //no inflatable
		create_struct_textbox("Solo",Dialogue);
	}
	
}