/// @description Insert description here
// You can write your code in this editor




// Inherit the parent event
event_inherited();

CM_Commands = function(){
	if(not billboard_read("checked_startroom_drawer")){
		if(billboard_read("Got_Magic_Bag")){
			billboard_post("checked_startroom_drawer",true)
			create_textbox("Startroom_drawer_2",false);
			Add_inventory_item(new Bellows());
		}
		else{
		create_textbox("Startroom_drawer_1",false);
		}
	}
	else{
		create_textbox("Startroom_drawer_3",false);
	}
}
/*

*/

event_user(0);