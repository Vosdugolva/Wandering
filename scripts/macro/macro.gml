#macro GUI_W display_get_gui_width()
#macro GUI_H display_get_gui_height()

enum GameCommand{
	Null,
	Look,
	Hit,
	Hold,
	Pump,
	Use,
	Speak,
	Deflate,
}

//used for command listings
global.commandList = {
Look: GameCommand.Look,
Hit: GameCommand.Hit,
Hold: GameCommand.Hold,
Pump: GameCommand.Pump,
Speak: GameCommand.Speak,
Deflate: GameCommand.Deflate,
}

global.Game_Command = GameCommand.Look;
global.Command_Target = noone;
global.Use_item = ""