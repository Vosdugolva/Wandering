/*

These functions are for conditional dialogue sequences, stored here so that saved and loaded actors
can acces them here (as this stuff cannot be saved via JSON, so I cannot put them in creation codes)

*/

enum DH_Keys{
	Null,
	Lizard_1,
	Lizard_2,
	Ant_1,
	}

function get_dialogue_function(_funcID){
	switch(_funcID)
		{
		case DH_Keys.Null: break;
		case DH_Keys.Lizard_1: dh_Lizard_1(); break;
		case DH_Keys.Lizard_2: dh_Lizard_2(); break;
		case DH_Keys.Ant_1: dh_ant_1(); break;
		}
		
	}

#region EX Stage 1

//Lizard 1
function dh_Lizard_1(){
	
	if(billboard_read("Popped_BaskLizard"))
		{
		switch(billboard_read("Talked_To_Lizard_1"))
			{
			case 1: Dialogue_Tag = "ex1_lizard_1_pop_1"; break;
			default: Dialogue_Tag = "ex1_lizard_1_pop"; billboard_post("Talked_To_Lizard_1",1); break;
			
			}
			
		}
	else{Dialogue_Tag = "ex1_lizard_1";}
	
}

//Lizard 2
function dh_Lizard_2(){
	if(billboard_read("Popped_BaskLizard"))
		{
		switch(billboard_read("Talked_To_Lizard_2"))
			{
			case 1: Dialogue_Tag = "ex1_lizard_2_pop_1"; break;
			default: Dialogue_Tag = "ex1_lizard_2_pop"; billboard_post("Talked_To_Lizard_2",1); break;
			
			}
			
		}
	else{Dialogue_Tag = "ex1_lizard_2";}
}

function dh_ant_1(){
	var _rand1 = irandom_range(0,4);
	var _rand2 = irandom_range(1,8);
	switch(_rand1){
	default : billboard_post("Pass_hint_1","I'm pretty sure it start's with  " + string(_rand2)); break;
	case 1 : billboard_post("Pass_hint_1","I know somewhere, there was a " + string(_rand2) + " in it."); break;
	case 2 : billboard_post("Pass_hint_1","I know this is vague but I think it had mostly even numbers in it."); break;
	case 3 : billboard_post("Pass_hint_1","I don't think any of the numbers repeat."); break;
	case 4 : billboard_post("Pass_hint_1","I think the first and last number was the same, just don't remember what number it was."); break;
	}
	
				
	switch(EnemySize)
	{
		case 0:
		case 1: Dialogue_Tag = "ex1_Ant_TooSmall"; break;
		
		case 3:
		case 4: 
		case 5: Dialogue_Tag = "ex1_Ant_2"; break;
	default: Dialogue_Tag = "ex1_Ant_1"; break;	
	}
}



#endregion

