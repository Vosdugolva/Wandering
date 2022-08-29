/// @description Insert description here
// You can write your code in this editor




// Inherit the parent event
event_inherited();

CM_Commands = function(){
billboard_post("Got_Magic_Bag",true)
create_textbox("MagicBag",false);
Add_inventory_item(new Bellows());
Add_inventory_item(new Flashlight());
Add_inventory_item(new StartRoom_Key());

/*
with(obj_RoomHandler){

	ds_list_add(Main_inventory, new Bellows());
	ds_list_add(Main_inventory, new Flashlight());
	ds_list_add(Main_inventory, new StartRoom_Key());
	}
	*/
instance_destroy();
}
/*

*/

event_user(0);