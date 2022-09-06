/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

CM_Commands = function(){
clear_commands();
var _active = obj_RoomHandler.Active_inflatable;
if(_active){
	if(billboard_read("Anth_door_unlocked"))
		{//door opened already
		create_struct_textbox("Look_2",Dialogue);
		exit;
			
		}
	var _size = get_active_inflatable_size();
	var _Infl = _active.object_index;
	show_debug_message(_Infl)
	switch(_Infl){
		case obj_Active_Rat:
			if(_size < 2){create_struct_textbox("Right_1",Dialogue);} //success
			else{create_struct_textbox("Right_2",Dialogue);} //success also.
			billboard_post("Anth_door_unlocked",true);
			Clear_active_inflatable()
			break;
		default: create_struct_textbox("Wrong_1",Dialogue); break; //failure
		}
	}
	else{ //no inflatable
		create_struct_textbox("Look_1",Dialogue);
	}
}