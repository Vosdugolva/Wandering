/// @description Insert description here
// You can write your code in this editor

if(global.talking_time){click_buffer = 5}
else if(click_buffer){click_buffer--;}

if (mouse_check_button_pressed(mb_left))
{
	if(click_buffer) exit;
	click_buffer = 5;
	var _actor = instance_position(Cursor.x,Cursor.y,par_clickable)
    if position_meeting(Cursor.x, Cursor.y, _actor)
    {
		//Movers
		if(object_is_ancestor(_actor.object_index,obj_Base_Mover)){
			switch(global.Game_Command){
			case GameCommand.Use: with(_actor){ CM_Use();} break;
			default: with(_actor) event_user(1);
			}
			exit;
		}
		//interactives
		if(object_is_ancestor(_actor.object_index,obj_Base_Interactive)){
		switch(global.Game_Command){
		case GameCommand.Null: with(_actor){ CM_Commands();} break;
		case GameCommand.Look: with(_actor){ CM_Look();} break;
		case GameCommand.Hold: with(_actor){ CM_Hold();} break;
		case GameCommand.Hit: with(_actor){ CM_Hit();} break;
		case GameCommand.Pump: with(_actor){ CM_Pump();} break;
		case GameCommand.Use: with(_actor){ CM_Use();} break;
		case GameCommand.Speak: with(_actor){ CM_Speak();} break;
		default: break;
			
		}
		exit;
		}
        
		show_debug_message("Click");
    }
	
	//Checks if the player clicks on an inventory item.
	if(point_in_rectangle(Cursor.x,Cursor.y,Inv_x1,Inv_y1,Inv_x2,Inv_y2))
	{
		var _box_range = Inv_y2-Inv_y1;
		var _Mouse_spot = Cursor.y-Inv_y1;
		var _divisor = _box_range/7;
		var _Cursor_spot = _Mouse_spot div _divisor;
		if(_Cursor_spot = Cursor_at and global.Game_Command = GameCommand.Use) exit;
		Cursor_at = _Cursor_spot;
		
		var _Inv = Main_inventory[| Cursor_at]
		if(is_undefined(_Inv))exit;
		_Inv[$ "Use"]();
		show_debug_message(_Inv[$ "Name"])
		
	}
}