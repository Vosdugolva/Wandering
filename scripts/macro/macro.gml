#macro GUI_W display_get_gui_width()
#macro GUI_H display_get_gui_height()

enum GameCommand{
	Look,
	Hit,
	Hold,
	Pump,
	Use,
	
	
}

global.Game_Command = GameCommand.Look;
global.Use_item = ""