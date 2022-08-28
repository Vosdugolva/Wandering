/// @description Insert description here
// You can write your code in this editor


This_Room = new StartRoom();

Spl_Sprite = 0;
Spl_Frame = 0;
Spl_Active = 0;

depth = -1000

//inventory
Inv_x1 = 144;
Inv_y1 = 32;
Inv_x2 = 239;
Inv_y2 = 147;

Main_inventory = ds_list_create();
ds_list_add(Main_inventory, new Bellows());
ds_list_add(Main_inventory, new Flashlight());

Cursor_at = 0;
Cursor_offset = 0;

//TextBox
textBox_Width = 224;
textBox_Height = 80;

border = 8;
line_Width = textBox_Width - border*2;
txtb_spr = spr_Textbox
txtb_img = 0;
txtb_img_spd = 6/60;