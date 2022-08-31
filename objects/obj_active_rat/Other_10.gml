/// @description Variables

Name = "Rat"

Dialogue = {
	Command: "What will you do with " + Name + "?",
	
//[+]============[+]
	Look_1: {
		a: "it's the rat! he looks to be his normal size, which is freakishy huge for a rat.",
		b:"still, he seems small enough to squeeze his rubbery body into places.",
		},
//[+]============[+]
	Look_2: {
		a: "it's the rat! and he's a big one now! as big as you even!",
		b: "at this size he's probably only good for hugging, you could maybe ride on him though",
		},
//[+]============[+]
	Look_3: {
		a: "it's the rat! and he's ginormous",
		b: "you think he might be able to lift some objects at this size!",
		},
		
//[+]============[+]
	//Speach
	Speak: {
		a: "'Hey!'",
		b:"'How's it going?'",
		},
		
	Speak_StartRoom: {
		a: "'So this is what was inside that locked room!'",
		b:"'Wasn't really much to it then, oh well.'",
		},
		
	Speak_Rat_Room: {
		a: "'Hey, sorry about the mess in here,'",
		b:"'I don't get guests up here to often, if ever! this has just been my go-to quiet place.'",
		},
		
	Speak_Hall_1: {
		a: "'There's also that other door that I've been wondering about. '",
		b: "'Lizardman always goes in and out of there but he won't tell anyone what's inside.'",
		c: "'No one can get in either because it's also locked from the inside.'",
		d: "'How does he get in? he has the power to move through walls somehow.'",
		},
//[+]============[+]		
	Inflate_1:{ //to size 2
		a:"With your chosen device, you begin pumping up the rat.",
		},
		
	Inflate_2:{ // to size 3
		a:"With your chosen device, you begin pumping up the rat more.",
		},
		
	Inflate_3:{ // overinflate
		a:"With your chosen device, you begin pumping more air into the rat",
		b:"it's body creaks and it's cheeks begin to swell as you force air into the already well overblown rodent, it's claws on it's paws and feet forced out from the high internal pressure.",
		c:"soon with each pump, the rodents rod begins to force it's way between it's legs, swelling further and further untill suddenly, it lets out a huge rush of air!",
		d:"as air escapes from the rat's dick, it begins to shrink down to it's original size, though still inflated, the rat appears relieved after having released all that overbuilt pressure."
		},
		
//[+]============[+]
	Deflate: {
		a: "You unplug the stopper on the rat's naval, allowing the air to escape till he goes flat again.",
		b: "with care, you place him back into the bag.",
		},
	}

