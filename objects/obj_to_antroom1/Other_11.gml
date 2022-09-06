/// @description Insert description here
// You can write your code in this editor

if(room = Hall_1){
	if(billboard_read("Anth_door_unlocked") = true)
	{
	room_goto(AnthRoom_1);
	}
	else{
	create_quick_textbox("The door is locked from the inside.",false);
	exit;	
	}
}

room_goto(AnthRoom_1);
