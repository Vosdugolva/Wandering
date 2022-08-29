/// @description Insert description here
// You can write your code in this editor

if(room = StartRoom){
	if(billboard_read("Hall_door_unlocked") = true)
	{
	room_goto(Hall_1);
	}
	else{
	create_textbox("Locked_1",false);
	exit;	
	}
}

room_goto(Hall_1);
