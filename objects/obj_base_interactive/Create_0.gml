/// @description Insert description here
// You can write your code in this editor

CM_Commands = function(){
spawn_commands();	
}

CM_Look = function(){
	
	
}

CM_Use = function(){
switch(global.Use_item){
	default: create_textbox("No_effect",false); break;
	}
clear_commands();
}

event_user(0);