/// @description Variables

/*
This user event mostly holds text based variables along with this object's own
personal dialogue struct, going forward I'm looking to store dialogue inside individual actors
rather than have it in a universal dialogue struct. this would just be easier 
given the way this game is put together.

//[+]============[+]
	Name: {
			a: " ",
			b: " ",
			c: " ",
		},
*/

Name = "Rat"

Dialogue = {
//[+]============[+]
	Solo: {
			a: "You decide to hop onto the matteress by yourself.",
			b: "it feels like nothing you've ever experienced before. somehow this oversized mattress provides increadible comport, unlike anything else you've ever slept on",
		},
//[+]============[+]
	Rat_1: {
			a: "you hop onto the mattress with the rat balloon and lie down with it in your arms, holding it close like an air filled teddy bear.",
			b: "an indetermined amount of time has passed before you decide to climb up and off the mattress.",
		},
//[+]============[+]
	Rat_2: {
			a: "you hop onto the mattress with the rat balloon and lie down beside it, spooning the enlarged balloon rodent.",
			b: "an indetermined amount of time has passed before you decide to climb up and off the mattress.",
		},
		
//[+]============[+]
	Rat_3: {
			a: "you hop onto the mattress with the rat balloon and lie down beneat the giant, overblown rodent.",
			b: "you relax as you are sadwiched between a giant, air filled rat and the mattress beneath you.",
			c: "an indetermined amount of time has passed before you decide to climb up and off the mattress.",
		},
		
//[+]============[+]	
	Empty: {
			a: "No intimacy script for this inflatable",
		},
		

};