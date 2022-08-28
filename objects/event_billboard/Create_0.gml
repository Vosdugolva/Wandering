//This correlates to the pubsub manager, whereas the pubsub is a subscription service
//where objects can subscribe to get info on events the moment they happen, the event manager
//is more like a public billboard that objects can check when they need to. this is mostly
//used for dialogue conditionals since enemy's spawn and despawn on the regular, so a static
//entity to check data on would be necessary for them.


//the event manager essentially contains nothing but strings
Event_Billboard_struct = {};

BB_Post = function(_PostName, _Data){
	
	Event_Billboard_struct[$ _PostName] = _Data;
}

BB_Read = function(_PostName){
	var _Billboard_post = Event_Billboard_struct[$ _PostName];
    if (is_undefined(_Billboard_post)) {
		return;
	}
	
	return _Billboard_post;
		
}


