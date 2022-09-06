/// @description Insert description here
// You can write your code in this editor




// Inherit the parent event
event_inherited();

CM_Use = function(){
switch(global.Use_item){
	case "Room Key": 
		Remove_inventory_item("Room Key")
		create_textbox("Unlocked_1",false);
		billboard_post("Anth_door_unlocked",true)
		break;
	
	default: create_textbox("No_effect",false); break;
	}
clear_commands();
}