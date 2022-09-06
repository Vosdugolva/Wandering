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

click_buffer = 0;

Cursor = instance_create_depth(mouse_x,mouse_y,-99999,obj_cursor);
Cursor.image_speed = 0;

Inv_Add = function(_add_item){
	ds_list_add(Main_inventory,_add_item);
}

Inv_Remove = function(_Remove_item){
			var _size = ds_list_size(Main_inventory);
			for(var i=0;i<_size;i++){
			var _item = Main_inventory[| i]
				show_debug_message(_item);
			if(_item[$ "Name"] = _Remove_item){ds_list_delete(Main_inventory,i); break;}	
	
	}
}


//Active Inflatables
Active_inflatable = noone;
Active_x = 128;
Active_y = 170;
Active_size = 0;

Spawn_Active = function(_Active){
if(instance_exists(Active_inflatable))
	{
		with(Active_inflatable){Reclaim();}
		instance_destroy(Active_inflatable);
		}
Active_inflatable = instance_create_depth(Active_x+4,Active_y,-9999,_Active);
Active_size = 1;
}

Remove_Active = function(){
if(instance_exists(Active_inflatable)){instance_destroy(Active_inflatable);}
Active_inflatable = noone;
Active_size = 0;
}

get_active_size = function(){return Active_size; }
set_active_size = function(_size){Active_size = _size; }
adjust_active_size = function(_size){Active_size += _size; Active_size = clamp(Active_size,0,3);}


//Add_inventory_item(new Rat_Balloon());