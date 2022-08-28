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

/*
commandList

function spawn_commands()
{
for (var i = 0, 1)
}

function clear_commands(){}