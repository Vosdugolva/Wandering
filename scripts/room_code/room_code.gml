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
		clear_commands();
		global.Use_item = Name;
		global.Game_Command = GameCommand.Use
		};
	};
Use_on = function(_item){
	switch(_item){
	default: create_textbox("No_effect",false); break;
	}
clear_commands();
	
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


function Inflatable() : Inventory() constructor{
Name = "Inflatable";
id = self;
Use = function(){
	if(not global.talking_time)
		{
		var _text = "do what with " + Name + "?"
		with(instance_create_depth(0,0,-99999,obj_textBox))
			{
			
			scr_text(_text);
			global.talking_time = true;
			}
		spawn_commands(["Speak","Hold"],true)
		};
	}

CM_Commands = function(){}
CM_Hit = function(){}
CM_Hold = function(){}
CM_Look = function(){}
CM_Pump = function(){}
CM_Speak = function(){}
Use_on = function(_item){
	switch(_item){					
	default: create_textbox("No_effect",false); break;
	}
clear_commands();
	
}

}


function Rat_Balloon() : Inflatable() constructor{
Name = "Rat Balloon";
Use = function(){
	create_quick_textbox("it's a flacid balloon rat, you'll need something to blow him up!");
	};
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
CM_Hold = function(){
	create_textbox("Rat_Hold",false);
	Draw_Splash_Screen(spls_Rat,1);
	}
	
Use_on = function(_item){
	show_debug_message(_item + "on rat")
	switch(_item){		
	case "Bellows" : create_quick_textbox("You take out the flacid rodent and blow it up to size!");
					Draw_Splash_Screen(spls_Rat,0);
					Set_active_inflatable(obj_Active_Rat);
					Remove_inventory_item("Rat Balloon")
					clear_game_command()
					break;
					
	default: create_textbox("No_effect",false); break;
	}
clear_commands();
	
}
	

}

//for inflatable structs, finds their inventory slot and returns it
function Find_inflatable(_name){

with(obj_RoomHandler){
			var _size = ds_list_size(Main_inventory);
			for(var i=0;i<_size;i++){
			var _item = Main_inventory[| i]
				//show_debug_message(_item);
			if(_item[$ "Name"] = _name){return i;}	
	
	}
}
	
}

//set up for automatically generated commands

function spawn_commands(_input_list, is_inventory = false)
{
clear_commands();
global.Command_Target = id;
if(is_inventory)
	{
	global.Command_Target = obj_RoomHandler;
	}
show_debug_message(global.Command_Target)
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

function Set_active_inflatable(_active){
		with(obj_RoomHandler){
			Spawn_Active(_active);
			}	
}

function get_active_inflatable_size(){
	var _val = 0;
		with(obj_RoomHandler){
			_val = get_active_size();
			}	
	return _val;
}

function set_active_inflatable_size(_size){
		with(obj_RoomHandler){
			set_active_size(_size);
			}	
}

function adjust_active_inflatable_size(_size){
		with(obj_RoomHandler){
			adjust_active_size(_size);
			}	
}


function run_command(_actor,_cmnd = global.Game_Command){
	
	//if this is an inventory item, it will point to the object handler
		if(_actor = obj_RoomHandler){
					switch(_cmnd){
				case GameCommand.Null: with(_actor){ Main_inventory[| Cursor_at][$ "CM_Commands"]();} break;
				case GameCommand.Look: with(_actor){ Main_inventory[| Cursor_at][$ "CM_Look"]();} break;
				case GameCommand.Hold: with(_actor){ Main_inventory[| Cursor_at][$ "CM_Hold"]();} break;
				case GameCommand.Hit: with(_actor){ Main_inventory[| Cursor_at][$ "CM_Hit"]();} break;
				case GameCommand.Pump: with(_actor){ Main_inventory[| Cursor_at][$ "CM_Pump"]();} break;
				case GameCommand.Use: with(_actor){ Main_inventory[| Cursor_at][$ "Use_on"]();} break;
				case GameCommand.Speak: with(_actor){Main_inventory[| Cursor_at][$ "CM_Speak"]();} break;
				default: break;
				}
			clear_commands();
			exit;
			}
	
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
