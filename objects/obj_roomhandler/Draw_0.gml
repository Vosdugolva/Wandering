/// @description Insert description here
// You can write your code in this editor


//[+]=================|draw textbox|==============[+]
textbox_x = camera_get_view_x(view_camera[0]) + 16;
textbox_y = camera_get_view_y(view_camera[0] ) + 152;

var _txtb_x = textbox_x; //+ text_x_offset[page];
var _txtb_y = textbox_y;
txtb_img += txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr)
txtb_spr_h = sprite_get_height(txtb_spr)

//draw_sprite_ext(txtb_spr,txtb_img,_txtb_x,_txtb_y, textBox_Width/txtb_spr_w, textBox_Height/txtb_spr_h,0,c_white,1)


//Draw splash screens
if(Spl_Active)
{
	var _x = 16;
	var _x2 = 127;
	var _y = 24;
	var _y2 = 135;
	
	
draw_rectangle_color(_x,_y,_x2,_y2,c_white,c_white,c_white,c_white,false);
draw_sprite(Spl_Sprite,Spl_Frame,_x,_y);

if(not global.talking_time){Spl_Active = false;}
}

//Draw Inventory
{
var _size = ds_list_size(Main_inventory)
_size = clamp(_size,0,7);
for(var i = Cursor_offset; i < _size; i++){
	var _place = ((Inv_y2-Inv_y1)/7)*i;
	var _Inv = Main_inventory[| i]
	draw_text(Inv_x1+18,Inv_y1+_place,_Inv[$ "Name"])
	}
	
}