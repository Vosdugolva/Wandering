/// @description Insert description here
// You can write your code in this editor

event_inherited()

image_speed = 0;
image_index = 0;

CM_Commands = function(){
create_textbox("Rat_Look",false);
spawn_commands(["Look","Speak","Hit","Hold"]);
	
}

CM_Look = function(){
create_textbox("Rat_Look",false);
	
}


CM_Hold = function(){
create_textbox("Rat_Hold",false);
Draw_Splash_Screen(spls_Rat,1);
}


CM_Hit = function(){
create_textbox("Rat_Hit",false);
	
}

CM_Pump = function(){
create_textbox("Rat_Pump",false);
billboard_post("Rat_size",1);
Draw_Splash_Screen(spls_Rat,0);
instance_change(obj_Rat_size2,true);
clear_game_command()
}

CM_Speak = function(){
	var _message = 0;
	//rat opening message
	if(not billboard_read("Spoke_to_rat"))
		{_message = 0;}
	else{
		if(billboard_read("checked_startroom_drawer")){_message = 2}
		else{_message = 1;}
	}
	
	switch(_message){
	case 1: create_textbox("Rat_Speak_1",false); break;
	case 2: create_textbox("Rat_Speak_2",false); break;
	default: billboard_post("Spoke_to_rat",true); create_textbox("Rat_Speak",false); break;
	}
}

CM_Use = function(){
switch(global.Use_item){
	case "Bellows": CM_Pump(); break;
	default: create_textbox("No_effect",false); break;
	}
clear_commands();
}

event_user(0);