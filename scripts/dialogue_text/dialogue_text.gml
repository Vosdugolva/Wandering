// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.talking_time = false;

global.Game_Dialogue = {
		basic : {
			a: "This text shouldn't appear.",
			b: "if it did, then that means something went wrong.",
			c: "you probably got the casing wrong you dingus! remember this thing is extreemely case sensitive!",
			d: "nevertheless, all the dialogue structs in 'global.Game_Dialogue' should be lowercase, no need to make it complicated!"
			},
			
		save : {
			a:"do you want to save?",
				option: {
					aa: "Yes",
					a: function(){Save_The_Game()},
					bb: "No",
					b: "save_1",
					},
		},
		save_1 : {
			a: "Fine then.",
			},
			
		wand_pedestal_1 : {
			a:"this pedestal has a hole that your rod can fit into, insert it in the hole?",
				option: {
					aa: "Yes",
					a: function(){wand_pedestal_set(1)},
					bb: "No",
					b: function(){},
					},
		},
		
		wand_pedestal_1_set : {
			a:"Take your rod back from the pedestal?",
				option: {
					aa: "Yes",
					a: function(){wand_pedestal_take(1)},
					bb: "No",
					b: function(){},
					},
		},
		
		Intro_1 : {
			a: "you wake up in a bed that isn't you own, inside a room that you know for certain isn't yours.",
			b: "in spite of this, you feel fine."
		},
		
		Intro_LivingRoom: {
			a: "You step into a cluttered room filled with dated furniture",
			b: "empty dring cups can be found all over the place."
		},
		
		Test_1 : {
			a: "This is a clickable object",
		},
		
		No_effect : {
			a: "Nothing happened",
		},
		
#region Living Room

//Rat Size 1
		Rat_Look : {
			a: "You spy a rather large rat grooming itself in the center of the room",
			b: "it's about the size and shape of a dodgeball.",
		},
		
	    Rat_Hold : {
			a: "The rat doesn't seem threatened by your approach, making it easy for you to pick it up.",
			b: "Holding the rat, it feels soft, both with it's thick fur but also with it being unusually squishy.",
			c: "it's body compresses and contorts as you squeeze it, like a big stress ball!",
			d: "The rat doesn't seem to mind being handled, it looks up to you with a warm expression.",
		},
		
		Rat_Hit : {
			a: "You take a swing at the rat, however you fists merely sink into the rat's body, it was like punching an air filled pillow!",
			b: "The Rat seems unphased by the action.",
		},
		
	    Rat_Pump : {
			a: "You draw out your pump with the curious desire to try and inflate the rodent. conveniently, it rolled over to reveal a stopper in it's naval area.",
			b: "you tug it loose, causing air to escape before shoving the pump hose in, and you began to thrust the plunger, forcing air into the rodent.",
			c: "each push caused the rat to swell, steadily getting larger and larger.",
			d: "by the time you stop, the rat has gone from merely being the size of a dodgeball to being just as tall and 3 times as wide as you!",
		},
//Rat size 2

		Rat_Look_2 : {
			a: "There's a Ginormous rat in the room because of you! swollen up like a big, round ball.",
		},
		
	    Rat_Hold_2 : {
			a: "you approach the rat to embrace it, planting your face against it's soft chest as you hug the big, balloon rodent.",
			b: "the rat responds in kind, wrapping it's large arms around you and resting it's head onto yours.",
			c: "This goes on for a good amount of time, eventually as you losen your grip, the rat releases you as well",
		},
		
	    Rat_Pump_2 : {
			a: "You draw out your pump with the curious desire to try and inflate the rodent. conveniently, it rolled over to reveal a stopper in it's naval area.",
			b: "you tug it loose, causing air to escape before shoving the pump hose in, and you began to thrust the plunger, forcing air into the rodent.",
			c: "each push caused the rat to swell, steadily getting larger and larger.",
			d: "by the time you stop, the rat has gone from merely being the size of a dodgeball to being just as tall and 3 times as wide as you!",
		},

#endregion
			
#region Ex stage 1 dialogue
		ex1_lizard_1 : {
			a: "That device back there is generating an [cb]anti magic field[cw] in the room.",
			b: "your wand is useless here, but we can't do much either.",
			},
			
	   ex1_lizard_1_pop : {
			a: "er... I heard an explosion somewhwere, was that your doing?",
			b: "Look, ignoring the lizard right next to me, most of us aren't looking for trouble",
			c: "I'm surprised you were even able to pop someone, most of the place is covered in anti-magic fields"
			},
			
	   ex1_lizard_1_pop_1 : {
			a: "now that I think about it, there is that nice basking spot around the area, though there's also a lizard that wants to hoard the spot all for himself",
			b: "He's a small guy so we just ignore him, he's all bark too because I think that place isn't under any field and he hasn't tried to fight for the spot at all.",
			c: "I bet he was having you expand him so he could claim the area better.",
			d: "y'know, why is it so hard for some folks to share?",
			},
		
			
		ex1_lizard_2 : {
			a: "Don't get the wrong idea! I'd be laying into you right now if it wasn't for that [cr]magic blocking whats-it[cw] back there!",
			option: {
				aa: "I can still fight by hand.",
				a: "ex1_lizard_2_1",
				bb: "no need to wimp out!",
				b: "ex1_lizard_2_2"
				},
			},
			ex1_lizard_2_1 : {
					a: "Ha! It'd hardly be an even fight!",
					},
			ex1_lizard_2_2 : {
					a: "I'm not wimping out! it just wouldn't be fair, that's all!",
					},
					
	   ex1_lizard_2_pop : {
			a: "Heh, I saw what happened, that greedy gut had it coming!",
			b: "Don't worry about him, he'll be back, monsters recover from far worse things than that.",
			c: "Still, he got really big though! bet he'd make a nice cushion while basking."
			},
			
	   ex1_lizard_2_pop_1 : {
			a: "I wonder if I could get that big...",
			b: "Wait! that wasn't a request, I'm just wondering, is all."
			},
					
		ex1_Doorlizard_1 : {
			a: "You're trying to get through that door?",
			b: "Well, you'll need 4 'things' to open in. they're pretty looking diamond things that a few of us are holding onto.",
			c: "this place is a common hangout for us so whoever has them shouldn't be too far from here"
			},
			
		ex1_Ant_TooSmall : {
			a: "you try to speak to the ant but it's too small to hear",
			},
			
		ex1_Ant_1 : {
			a: "oh? you can hear me now?",
			b: "well, I guess it'll be easier to say this now that we meet eye to eye.",
			e: "Hmm... [bb]Pass_hint_1[bb].",
			},
			
		ex1_Ant_2 : {
			a: "Hmm? what was that?",
			b: "you're so small that I can barely hear you down there!",
			c: "Heh, I'm only kidding. but what did you need? and why did you need to make me this big?",
			d: "The password? let me see...",
			e: "Hmm... [bb]Pass_hint_1[bb].",
			},
			
		ex1_3rdHog_0 : {
			a: "We've been arguing up and down over who's the third largest, the difference in size between us is really small, but I swear I'm it!",
			b: "Why is it such a big deal? because being the middleman is great! not so big that your the focus yet not so small that you're ignored!",
			c: "now, you're the guy with the magic that blows things up, think you could maybe work it out so I'm the 3rd largest? I'll reward you for it of course!",
			},
	
		ex1_3rdHog_1st : {
			a: "Hey! what's the big idea! I'm now unmistakably the smallest!!",
			b: "C'mon! you gotta do something about this! I'll be doomed to a life of insignificance relative to the others!",
			},
			
		ex1_3rdHog_2nd : {
			a: "Close but still not there!",
			b: "I'm only the second largest, and it's clear as day.",
			},
			
		ex1_3rdHog_3rd : {
			a: "aha! there we are! now I truly am the third largest! and no one can deny it!",
			},
			
		ex1_3rdHog_4th : {
			a: "oh no... you overdid it! I'm the 4th largest.",
			b: "I'm just a tad too big now.",
			},
			
		ex1_3rdHog_5th : {
			a: "No! No! Noo! I'm way to big now! I'm bigger than all of them!",
			b: "This is the worst! I'm not cut out for the big life, I can't handle that kind of pressure!",
			c: "hey! don't laugh! I didn't mean it like that!!",
			},
			
			
			
		ex1_basklizard_1 : {
			a: "hey! go away! this is MY personal basking spot!",
			b: "Actually hold on, aren't you're that [cr]Expand Mage[cw] that everyone has been talking about, the guy that blew up the ant king?",
			c: "hmm... if I were that big, I could get more sun!",
			d: "How about it? can you work your magic on me?"
			},
		ex1_basklizard_2 : {
			a: "Wow, this is great! I'm more than twice my size! in fact I'm bigger than you even!",
			b: "Feels a little weird though...",
			c: "this is greedy of me, but how about a bit more?",
			},
		ex1_basklizard_3 : {
			a: "now I'm thinking. this is my favorite spot but I always have to compete for it with the others,",
			b: "but they can't take my basking spot if there's no room to take!",
			c: "so how about it? can you make me big enough to fill the whole room?",
			},
		ex1_basklizard_4 : {
			a: "oof, maybe I better rethink that plan, I'm feeling really full now.",
			b: "oh well, even if someone does come, I'll still get most of the sun anyways!",
			},
		ex1_basklizard_5 : {
			a: "Gah! I said stop already!",
			b: "oh man, I can't even begin to imagine how I look right now, my gut feels like a massive beach ball!",
			},
		ex1_basklizard_6 : {
			a: "huff...no more!",
			b: "oy, I'm surprized I haven't blown yet.",
			c: "Look, if it'll convince you to stop, I'll share the room.",
			d: "I mean, now there's nowhere to bask on unless they want to lay on my gut.",
			e: "as long as no one bounces on it, I'll be fine with it.",
			},
	ex1_basklizard_7 : {
			a: "Ouch! Hey! I told you that was far too much!",
			b: "Ugh, at least I was able to get back before someone else got my basking spot.",
			c: "hmm... maybe we could try again but just not go too far this time. afterall, it would be hard to guard this spot at this size",
			},
#endregion		
};