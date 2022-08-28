/// @description Insert description here

textBox_Width = 224;
textBox_Height = 80;


border = 8;
line_sep = 12;
line_Width = textBox_Width - border*2;
txtb_spr = spr_Textbox
txtb_img = 0;
txtb_img_spd = 6/60;

//the text
page = 0;
page_number = 0;
text[0] = "";
text_Length[0] = string_length(text[0]);
char[0,0] = ""; 
char_x[0,0] = "";
char_y[0,0] = "";
draw_char = 0;
text_Spd = 1;
skip_char = false;

//in text functions
func_name = ""

//text color codes
check_next_char = false;

//options
options[0] = "";
options_link_id[0] = -1;
options_pos = 0;
option_number = 0;

key_accept_delay = 5;

setup = false;

//sound
snd_delay = 4;
snd_count = snd_delay;

//effects
scr_set_defaults_for_text();
last_free_space = 0;
text_pause_timer = 0;
text_pause_time = 16;