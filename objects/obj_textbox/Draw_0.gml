textbox_x = camera_get_view_x(view_camera[0]) + 16;
textbox_y = camera_get_view_y(view_camera[0] ) + 152;
textbox_y_Shift = 0;

Key_accept = keyboard_check_pressed(vk_space);
if(key_accept_delay)key_accept_delay--;
Key_Up = keyboard_check_pressed(ord("W"));
Key_Down = keyboard_check_pressed(ord("S"));

	
//[+]=================|Setup|==============[+]
if(setup == false)
	{
		//page_number = 0;
		setup = true;
		draw_set_font(global.font_main);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		
		//loop through the pages
		for(var i = 0; i < page_number; i +=1)
		{
			text_Length[i] = string_length(text[i]);
			
			//get the X position of our textbox
				//no character (center of the textbox)
			text_x_offset[i] = 0;
			
		//setting the individual characters and finding the line where they should break
			for(var c = 0; c < text_Length[i]; c++)
			{
				var _char_pos = c+1;
				
			
				//store individual characters in the "char" array
				//array_insert(char,c,array_insert(char,i,string_char_at(text[i],_char_pos)))
				
				//char[c,i] = string_char_at(text[i],_char_pos);
				
				///Before doing anything else, we need to check this character for a color code,
				///if it is, then we need to clear that char and the one after it
				var _col_code = string_copy(text[i],_char_pos,4);
					if(_col_code == "[cr]")
					{
					//first, we will delete this from the text
					text[i] = string_delete(text[i], _char_pos, 4);
					//then from here, set the color
					scr_set_color(c,i,c_red);
					//and finally, update the text length
					text_Length[i] = string_length(text[i]);
					}
				if(_col_code == "[cw]")
					{
					text[i] = string_delete(text[i], _char_pos, 4);
					scr_set_color(c,i,c_white);
					text_Length[i] = string_length(text[i]);
					}
				if(_col_code == "[cb]")
					{
					text[i] = string_delete(text[i], _char_pos, 4);
					scr_set_color(c,i,c_blue);
					text_Length[i] = string_length(text[i]);
					}
				//let's piggyback off of this to find a code for billboard data
					if(_col_code == "[bb]")
					{
						//okay, now we are going to check the next each following character
						//untill we find another "[bb]" and take the code within it
						//var _col_code_end = 0;
						var _BB_len = 0;
						for(var k = _char_pos+4; k < text_Length[i]; k++ ){
						var _col_code_end = string_copy(text[i],k,4);
						if(_col_code_end == "[bb]"){
							var _BB_post = string_copy(text[i],_char_pos+4,_BB_len);
							var _BB_post_str = string(billboard_read(_BB_post));
							
							text[i] = string_delete(text[i], _char_pos,_BB_len+8);
							text[i] = string_insert(_BB_post_str,text[i] ,_char_pos);
							text_Length[i] = string_length(text[i]);
							show_debug_message(_BB_post_str);
							break;
						}
						_BB_len++;
							
						}
						
					}
				
				//now that that is taken care of, carry on.
				char[c,i] = string_char_at(text[i],_char_pos);
				
				//get current width of the line
				var txt_up_to_char = string_copy(text[i],1,_char_pos);
				var current_txt_w = string_width(txt_up_to_char) - string_width(char[c,i]);
				
				//get the last free space
				if(char[c,i] == " "){last_free_space = _char_pos+1;}
				
				//get the line breaks
				if (current_txt_w - line_break_offset[i] > line_Width)
					{
					line_break_pos[ line_break_num[i],i] = last_free_space;
					line_break_num[i]++;
					var _txt_up_to_last_space = string_copy( text[i], 1, last_free_space);
					var _last_free_space_string = string_char_at( text[i], last_free_space);
					line_break_offset[i] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string);
					}
					
				}
				
				//getting each character's coordinates
				for(var c = 0; c < text_Length[i]; c++)
				{
				var _char_pos = c+1;
				var _txtb_x = textbox_x + text_x_offset[page] + border;
				var _txtb_y = textbox_y + border;
				//get current width of line
				var txt_up_to_char = string_copy(text[i],1,_char_pos);
				var current_txt_w = string_width(txt_up_to_char) - string_width(char[c,i]);
				var _txt_line = 0;
				
				//compensate for string breaks
				for(var lb = 0; lb < line_break_num[i]; lb++)
					{
					//if the current looping character is after a line break
					if(_char_pos >= line_break_pos[lb , i])
						{
						var _str_copy = string_copy( text[i], line_break_pos[lb , i], _char_pos - line_break_pos[lb , i]);
						current_txt_w = string_width(_str_copy);
						
						//record the "line" this character should be on
						_txt_line = lb+1; //+1 since lb starts at 0
						}
						
					}
					
					//add to the x and y coordinates based on the info
					char_x[c,i] = _txtb_x + current_txt_w;
					char_y[c,i] = _txtb_y + _txt_line*line_sep;
				
			}
		}
		
		
	}

//[+]=================|typing the text|==============[+]
if(text_pause_timer <= 0)
{
	//var _draw_this_char = true;
	skip_char = false;
	
	var _Sounder = function()
		{
		if (snd_count < snd_delay){snd_count++;}
		else
			{
			snd_count = 0; 
			audio_play_sound(snd_TestTalk,1,false);
			}
		}
		
	if(draw_char < text_Length[page] )
		{
		draw_char += text_Spd;	
		draw_char = clamp(draw_char,0,text_Length[page]);
		var _check_char = string_char_at(text[page],draw_char)
		//if(_check_char == "[" ){char[draw_char, page] = ""; check_next_char = true;}
		//if(check_next_char)
		//	{
		//	if(_check_char == "r"){scr_set_color(c_red); skip_char = true; check_next_char = false;}
		//	}
			if(_check_char == "."
			or _check_char == ","
			or _check_char == "?"
			or _check_char == "!"){text_pause_timer = text_pause_time;}
			else{_Sounder();}
		}
}
else{text_pause_timer--;}
	
//[+]=================|flip through pages|==============[+]
if(Key_accept and not key_accept_delay)
	{
	
	//if typing is done, go to next page
	if(draw_char = text_Length[page] )
	{
		//next page
		if (page < page_number-1)
			{
			page++;
			draw_char = 0;
			
			}
		else{		
			//link text for options
			if(option_number > 0){
				var _link = options_link_id[options_pos];
				
				if is_string(_link){
				create_textbox(options_link_id[options_pos],true);
				}
				
				if is_method(_link){
					_link();					
				}
			}
			//destry textbox
			instance_destroy()
			if(not option_number)global.talking_time = false;
			} 
	}
	//not done typing
	else
		{
		draw_char = text_Length[page];
		}
	}


//[+]=================|draw textbox|==============[+]
var _txtb_x = textbox_x; //+ text_x_offset[page];
var _txtb_y = textbox_y;
txtb_img += txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr)
txtb_spr_h = sprite_get_height(txtb_spr)

draw_sprite_ext(txtb_spr,txtb_img,_txtb_x,_txtb_y+textbox_y_Shift, textBox_Width/txtb_spr_w, textBox_Height/txtb_spr_h,0,c_white,1)


//draw text
////var _drawText = string_copy(text[page],1,draw_char);
////draw_text_ext(textbox_x + text_x_offset[page]+border,textbox_y+border,_drawText,line_sep,line_Width);

for(var c = 0; c < draw_char; c++)
	{
		//draw text
		//draw_text_color(char_x[c, page]-_xoff,char_y[c, page]+textbox_y_Shift,char[c, page],_col,_col,_col,_col,1);
		draw_text_color(char_x[c, page],char_y[c, page]+textbox_y_Shift,char[c, page],col_1[c, page],col_2[c, page],col_3[c, page],col_4[c, page],1);
			
	}

//[+]=================|Options|==============[+]

if(draw_char == text_Length[page] && page == page_number-1)
	{
		//option selection
	
		options_pos += Key_Down - Key_Up;
		options_pos = clamp(options_pos,0,option_number-1);

		//draw the options
		var _op_space = 16;
		var _op_border = 5;
		for(var op = 0; op < option_number; op++)
		{
		// the option box
		var _o_w = string_width(options[op]) + _op_border*2;
		draw_sprite_ext(txtb_spr,txtb_img,_txtb_x+16,_txtb_y-_op_space*option_number + _op_space*op,_o_w/txtb_spr_w, (_op_space-1)/txtb_spr_h,0,c_white,1);
		
		//the arrow
		if(options_pos == op){
			draw_sprite(spr_option_arrow,0,_txtb_x,_txtb_y-_op_space*option_number + _op_space*op);
			}
		// the option text
		draw_set_color(c_white);
		draw_text(_txtb_x + 16 + _op_border,_txtb_y - _op_space*option_number + _op_space*op + 4,options[op]);
		
		}
		
	}