// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_set_defaults_for_text() {
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	//snd[page_number] = 0;
	
	//variable for every letter/character
	for(var c = 0; c < 500; c++)
	{
	col_1[c, page_number] = c_black;
	col_2[c, page_number] = c_black;
	col_3[c, page_number] = c_black;
	col_4[c, page_number] = c_black;
	}
	//show_debug_message("color reset" + string(id))
	
}


function scr_set_color(_start,_page,_col)
{
	for(var c = _start; c < 500; c++)
	{
	col_1[c, _page] = _col;
	col_2[c, _page] = _col;
	col_3[c, _page] = _col;
	col_4[c, _page] = _col;
	}	
	//show_debug_message("color set " + string(id))
}

function scr_text(_text){
scr_set_defaults_for_text();
text[page_number] = _text;
page_number++;
}

function scr_function(_func, _pos){
scr_set_defaults_for_text();
show_debug_message("method in dialogue")
//array_insert(T_Func,_pos,_func)
func_name = _func;
//page_number++;
}

function scr_get_dialogue(_tag = "basic"){

//gonna try and recode this to use accessors instead
	
//first let's make sure the dialogue tag exists. if not, we return the
//error handler message
	
	if (!variable_struct_exists(global.Game_Dialogue,_tag))
		{_tag = "basic";}
	
	//grab the struct inside the dialogue struct, get all it's keys in an array,
	//and sort them in alphabetical order, the variable names are in
	//alphabets
	var strc = variable_struct_get(global.Game_Dialogue,_tag);
	var keys = variable_struct_get_names(strc);
	array_sort(keys, true); 
	
	//each dialogue struct can also have an option struct inside it, they should
	//be processed last, in case we find it, we will store it in this.
	var O_Strc = undefined;
	
	
	for (var i = 0; i <= array_length(keys)-1; ++i) {
	var k = keys[i];
    var v = strc[$ k];
	show_debug_message(string(k) + " " + string(v))
	if is_struct(v){//store this for later
			O_Strc = v;
			continue;
			}
	if(k == "Func"){
		show_debug_message("is method")
		scr_function(v,array_length(keys)-1);
		continue;
	}
	if is_string(v){//this is just a failsafe incase any weird data is in the struct
			scr_text(v);
			}

	} //end of text processing array
	
	if(is_undefined(O_Strc)) exit; //[+]=======================[+]
	
	// now for the option struct. each option name has a single letter "a:" and it's link
	// that letter but doubled "aa:", we will search for only single letter variable
	// names, and add it's double as the option key
	
	var O_keys = variable_struct_get_names(O_Strc);
	array_sort(O_keys, true); 
	for (var j = 0; j <= array_length(O_keys)-1; j+=2) {
		var k = O_keys[j];
		if(string_length(k) > 1) continue; //too big, skip it
		var kk = string(k + k);
		var v = O_Strc[$ kk];
		var v_link = O_Strc[$ k];
		scr_options(v,v_link);
	}
	
}



//function scr_get_dialogue(_tag = "basic"){
//	if (!variable_struct_exists(global.Game_Dialogue,_tag))
//		{_tag = "basic";}
//	var strc = variable_struct_get(global.Game_Dialogue,_tag);
//	var keys = variable_struct_get_names(strc);
//	array_sort(keys, true); //gotta sort that shit because the struct keeps changing order
//	for (var i = 0; i <= array_length(keys)-1; ++i) {
//    var k = keys[i];
//    var v = variable_struct_get(strc, k);
//    /* Use k and v here */
//	//if()
//	if is_struct(v)
//		{ //any struct inside the dialogue struct will be considered an option list
//			var _struct2 = v
//			var _keys2 = variable_struct_get_names(_struct2);
//			array_sort(_keys2, false); //gotta sort that shit because the struct keeps changing order
//			for (var j = 0; j <= array_length(_keys2)-1; j+=2) {
//			var k2 = _keys2[j];
//			var k2_link = _keys2[j+1];
//			var v2 = variable_struct_get(_struct2, k2);
//			var v2_link = variable_struct_get(_struct2, k2_link)
//			scr_options(v2,v2_link);
//			}
//		}
//	else{scr_text(v);}
//	}
//}

function create_textbox(_tag = "basic",_option = false)
{
if(not global.talking_time or _option)
	{
	with(instance_create_depth(0,0,-99999,obj_textBox))
		{
		scr_get_dialogue(_tag);
		}
	global.talking_time = true;
	}
}

///@param option
///@param link_id
function scr_options(_option, _link_id){
	
	options[option_number] = _option;
	options_link_id[option_number] = _link_id;
	show_debug_message(string(_option) + "  " + string(_link_id));
	
	option_number++;
	
}