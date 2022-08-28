/// @description Insert description here
// You can write your code in this editor



if (mouse_check_button_pressed(mb_left) and not global.talking_time)
{
	var _actor = instance_position(mouse_x,mouse_y,par_clickable)
    if position_meeting(mouse_x, mouse_y, _actor)
    {
		//Movers
		if(object_is_ancestor(_actor.object_index,obj_Base_Mover)){
			with(_actor) event_user(1);
			exit;
		}
		//interactives
		if(object_is_ancestor(_actor.object_index,obj_Base_Interactive)){
		switch(global.Game_Command){
		case GameCommand.Look: with(_actor){ CM_Look();} break;
		case GameCommand.Hold: with(_actor){ CM_Hold();} break;
		case GameCommand.Hit: with(_actor){ CM_Hit();} break;
		case GameCommand.Pump: with(_actor){ CM_Pump();} break;
		case GameCommand.Use: with(_actor){ CM_Use();} break;
		default: break;
			
		}
		exit;
		}
        
		show_debug_message("Click");
    }
	
	//Checks if the player clicks on an inventory item.
	if(point_in_rectangle(mouse_x,mouse_y,Inv_x1,Inv_y1,Inv_x2,Inv_y2))
	{
		var _box_range = Inv_y2-Inv_y1;
		var _Mouse_spot = mouse_y-Inv_y1;
		var _divisor = _box_range/7;
		Cursor_at = _Mouse_spot div _divisor;
		
		var _Inv = Main_inventory[| Cursor_at]
		if(is_undefined(_Inv))exit;
		_Inv[$ "Use"]();
		show_debug_message(_Inv[$ "Name"])
		
	}
}