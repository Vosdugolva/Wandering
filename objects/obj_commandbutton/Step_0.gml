/// @description Insert description here
// You can write your code in this editor



if (mouse_check_button(mb_left) and not global.talking_time)
{
	var _actor = instance_position(mouse_x,mouse_y,self)
    if position_meeting(mouse_x, mouse_y, _actor)
    {
		
		with(_actor){global.Game_Command = Command_Type}
			
		
        
    }
}

if(global.Game_Command == Command_Type){image_index = 1;}
else{image_index = 0;}