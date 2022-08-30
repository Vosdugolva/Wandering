/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();
event_user(0);

image_speed = 0;
image_index = 0;

CM_Commands = function(){
create_quick_textbox(Dialogue[$ "Command"])
spawn_commands(["Look","Speak","Hold"]);
	
}

CM_Look = function(){
	
	
}

CM_Use = function(){
switch(global.Use_item){
	default: create_textbox("No_effect",false); break;
	}
clear_commands();
}