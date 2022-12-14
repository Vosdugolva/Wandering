event_inherited()

/*
CM_Commands = function(){
create_quick_textbox("Do what with the Rat?")
spawn_commands(["Look","Speak","Hit","Hold"]);
	
}
*/

CM_Look = function(){
	switch(get_active_inflatable_size()){
		default:
		case 1: create_struct_textbox("Look_1",Dialogue);   break;
		case 2: create_struct_textbox("Look_2",Dialogue);   break;
		case 3: create_struct_textbox("Look_3",Dialogue);  break;
	}
	
}


CM_Hold = function(){
create_textbox("Rat_Hold",false);
Draw_Splash_Screen(spls_Rat,1);
}


CM_Hit = function(){
create_textbox("Rat_Hit",false);
	
}

CM_Pump = function(){
	switch(get_active_inflatable_size()){
		default:
		case 1: create_struct_textbox("Inflate_1",Dialogue);  adjust_active_inflatable_size(1); break;
		case 2: create_struct_textbox("Inflate_2",Dialogue);  adjust_active_inflatable_size(1); break;
		case 3: create_struct_textbox("Inflate_3",Dialogue); set_active_inflatable_size(1); break;
	}
Draw_Splash_Screen(spls_Rat,0);
clear_game_command()
}

CM_Speak = function(){
	switch(room){
	case StartRoom: create_struct_textbox("Speak_StartRoom",Dialogue); exit;
	case Rat_room: create_struct_textbox("Speak_Rat_Room",Dialogue); exit;
	case Hall_1: create_struct_textbox("Speak_Hall_1",Dialogue); exit;
	case AnthRoom_1: create_struct_textbox("Speak_AnthRoom_1",Dialogue); exit;
	case AnthRoom_2: create_struct_textbox("Speak_AnthRoom_2",Dialogue); exit;
	default:  break;
	}
	
	create_struct_textbox("Speak",Dialogue);

}


CM_Deflate = function(){
	create_struct_textbox("Deflate",Dialogue);
	Clear_active_inflatable();
	Reclaim();

}

CM_Use = function(){
switch(global.Use_item){
	case "Bellows": CM_Pump(); break;
	default: create_textbox("No_effect",false); break;
	}
clear_commands();
}


Reclaim = function(){Add_inventory_item(new Rat_Balloon());}
event_user(0);