function RoomData() constructor{
	
	
	
};


function StartRoom() : RoomData() constructor{

}

function set_game_command(_cmnd){global.Game_Command = _cmnd;}
	
function clear_game_command(){global.Game_Command = GameCommand.Null;}

function Draw_Splash_Screen(_sprite,_Frame){
	
with(obj_RoomHandler){
	Spl_Active = true;
	Spl_Sprite = _sprite;
	Spl_Frame = _Frame;
	}
}


function Inventory() constructor{
Name = "Name";
Use = function(){
	if(not global.talking_time)
		{
		var _text = "Use " + Name + " on what?"
		with(instance_create_depth(0,0,-99999,obj_textBox))
			{
			
			scr_text(_text);
			global.talking_time = true;
			}
		global.Use_item = Name;
		global.Game_Command = GameCommand.Use
		};
	}	
	
};

function Bellows() : Inventory() constructor{
Name = "Bellows";
}

function Flashlight() : Inventory() constructor{
Name = "Flashlight";

}

function StartRoom_Key() : Inventory() constructor{
Name = "Room Key";

}

//set up for automatically generated commands

function spawn_commands(_input_list)
{
global.Command_Target = id;
var _cmnd_list = global.commandList;
var _size = array_length(_input_list)
var _x = 24;
var _y = 160;
var _x_inc = 32;
var _y_inc = 9;

for (var i = 0; i < _size;i++){
	
var _x_set = _x + _x_inc;
var _y_set = _y + _y_inc*i

var _cmnd_name = _input_list[i];
var _cmnd_type = _cmnd_list[$ _input_list[i]];
show_debug_message(_cmnd_name);

var _cmnd = instance_create_depth(_x_set,_y_set,-1600,obj_CommandButton);
	with(_cmnd){
	Command_Type = _cmnd_type;
	Command_Text = _cmnd_name;
	}
}
}


function clear_commands()
{clear_game_command()
	instance_destroy(obj_CommandButton);}
	
function Add_inventory_item(_item){
		with(obj_RoomHandler){
			Inv_Add(_item);
			}	
}
	
function Remove_inventory_item(_item){
		with(obj_RoomHandler){
			Inv_Remove(_item);
			}	
}

function run_command(_actor,_cmnd = global.Game_Command){
		switch(_cmnd){
		case GameCommand.Null: with(_actor){ CM_Commands();} break;
		case GameCommand.Look: with(_actor){ CM_Look();} break;
		case GameCommand.Hold: with(_actor){ CM_Hold();} break;
		case GameCommand.Hit: with(_actor){ CM_Hit();} break;
		case GameCommand.Pump: with(_actor){ CM_Pump();} break;
		case GameCommand.Use: with(_actor){ CM_Use();} break;
		case GameCommand.Speak: with(_actor){ CM_Speak();} break;
		default: break;
			
		}
}
