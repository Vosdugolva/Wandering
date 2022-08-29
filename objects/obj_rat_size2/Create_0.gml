/// @description Insert description here
// You can write your code in this editor
event_inherited()

image_speed = 0;
image_index = 1;

CM_Commands = function(){
create_textbox("Rat_Look_2",false);
spawn_commands(["Look","Speak","Hit","Hold"]);
	
}

CM_Look = function(){
create_textbox("Rat_Look_2",false);
	
}


CM_Hold = function(){
create_textbox("Rat_Hold_2",false);
Draw_Splash_Screen(spls_Rat,2);
}


CM_Hit = function(){
create_textbox("Rat_Hit",false);
	
}

CM_Pump = function(){
create_textbox("Rat_Pump_2",false);
Draw_Splash_Screen(spls_Rat,0);
clear_game_command();
}

CM_Speak = function(){
create_textbox("Rat_Speak_3",false);
}

CM_Use = function(){
switch(global.Use_item){
	case "Bellows": CM_Pump(); break;
	default: create_textbox("No_effect",false); break;
	}
clear_commands();
}