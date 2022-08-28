function RoomData() constructor{
	
	
	
};


function StartRoom() : RoomData() constructor{

}

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



//set up for automatically generated commands
// working...


global.commandList = [
[GameCommand.Look,"Look"],
[GameCommand.Hit,"Hit"],
[GameCommand.Hold,"Hold"],
[GameCommand.Pump,"Pump"],
]

function spawn_commands()
{
var _cmnd_list = global.commandList;
var _size = array_length(_cmnd_list)
var _x = 24;
var _y = 160;
var _x_inc = 32;
var _y_inc = 16;

for (var i = 0; i < _size;i++){
	
var _x_set = _x + _x_inc;
var _y_set = _y + _y_inc*i
show_debug_message(_cmnd_list[i][1]);
var _cmnd = instance_create_depth(_x_set,_y_set,-1600,obj_CommandButton);
	with(_cmnd){
	Command_Type = _cmnd_list[i][0];
	Command_Text = _cmnd_list[i][1];
	}
}
}

function clear_commands()
{global.Game_Command = GameCommand.Null;
	instance_destroy(obj_CommandButton);}