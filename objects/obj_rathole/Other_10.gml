/// @description Variables

/*
This user event mostly holds text based variables along with this object's own
personal dialogue struct, going forward I'm looking to store dialogue inside individual actors
rather than have it in a universal dialogue struct. this would just be easier 
given the way this game is put together.
*/

Name = "Rat"

Dialogue = {
//[+]============[+]
	Look_1: {
			a: "There's a neat little mouse hole in the wall at the center of the room.",
			b: "it seems safe to assume that the rat inflatable might be responsible for it",
		},
//[+]============[+]
	Look_2: {
			a: "There's a neat little mouse hole in the wall at the center of the room.",
			b: "No real point trying to force any other inflatables through it now.",
		},
//[+]============[+]	
	Wrong_1: {
			a: "Doesn't look like the inflatable you have would have any chance fitting in there",
		},
		
//[+]============[+]	
	Right_1: {
			a: "despite looking bigger than the whole, you watch as the rat forces it's rubbery body into it.",
			b: "it makes strange, elastic noises as it squirms it's way into it before making it through with a resounding 'pop' sound",
			c: "you here some fiddling sounds on the otherside, afterwards the rat calls out to you.",
			d: "'Okay, it's open! you can come on in through the door in the hall'!",
		},
		
	Right_2: {
			a: "you wonder how this oversized rat balloon could ever get into that hole before you witness him undo the stopper on his naval, allowing air to escape till he shrinks to his original size.",
			b: "despite still looking bigger than the whole, you watch as the rat forces it's rubbery body into it.",
			c: "it makes strange, elastic noises as it squirms it's way into it before making it through with a resounding 'pop' sound",
			d: "you here some fiddling sounds on the otherside, afterwards the rat calls out to you.",
			e: "'Okay, it's open! you can come on in through the door in the hall'!",
		},

};