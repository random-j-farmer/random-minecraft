---
layout: post
title:  Understanding the Ilmango Tunnel Bore
tags: redstone tnt
use_mathjax: true
---

Specifically, this is about his 
[Industrial Mining Machine](https://www.youtube.com/watch?v=oWUpTIirzJQ),
[Designing a Honey Tunnel Bore](https://www.youtube.com/watch?v=zc3Vecx2xoU)
and the [Large Honey Tunnel Bore](https://www.youtube.com/watch?v=OZGcnpkvdHM)
from his Peaceful Challenge.  Ilmango  provides a world download
for the machines shown in the first video.

At the core of both designs are 2 lines of single-step insta-wire.
One controls the dupers, which are spaced out on every fifth block.
The other insta-wire controls TNT catapults that launch the duped
TNT in the air in front of the machine.

The delay between the dupers and the launchers is crucial. It is
provided by a flying machine that is returned by a single stepping
return station.

## Slimeblocks vs Honeyblocks

Slimeblocks are more powerful than Honeyblocks - you have much more
possibilities in arranging your circuit.  This additional power
comes at a cost:  understanding the circuit becomes harder.

So I am going to prefer Honeyblock over Slimeblocks, unless I have
a compelling reason not to.  In the following screenshots,
a Honeyblock means "nothing special here, go on", while a Slimeblock
means "uh-uh, this is not just a sticky block".

I am not going to worry about efficency or account for every
slimeball used.  If the design becomes simpler by using a
Slimeblock I will do so.


## Flying Machine Timings

<p float="left">
<img src="/random-minecraft/assets/ilmango-tunnel-bore/flying-machine-timings-1.jpg"
     alt="Flying machine: getting exact timings" width="48%">
<img src="/random-minecraft/assets/ilmango-tunnel-bore/flying-machine-timings-2.jpg"
     alt="Flying machine: getting exact timings for the duper activation" width="48%">
</p>

The images show the flying machine used to time the Ilmango Tunnel
bores.  It is a standard 2 way Flying Machine in a Honeblock
configuration.  The payload is the Redstone block that will
activate the lamp, and it has an additional observer that will
activate the return station.

In general, such a 2 way flying machine takes 5 game ticks for
one half step.

$$ t_{travel} = (5 + 5)d = 10d $$

$$ t_{act} = 9d + 4 $$

$$ t_{deact} = 9d + 2 $$

So here, the flying machine will fully arrive at the return 
station after 30 game ticks,
but the lamp will turn on after 24 game ticks.   This is the time
when Block 36 turns back into a Redstone block - although it will
take another game tick for the back piston to finish retracting.

The observer activited by the return station will fire one
game tick earlier than the one that would continue the current direction
of travel. So this half-step only takes 4 game ticks.

Now, on the way back the flying machine will travel one block further
and remove the powersource of the instant-wire piston.  This is
$$t_{deact}$$ above, and it occurs 2 game ticks earlier than activation -
this happens when the redstone block turns into Block 36 at the moment
the piston fires.

So the total time to travel 3 blocks in one direction and deactivating the powersource
4 blocks in the other direction is 61 game ticks.

$$ t_{insta} = 3*10 + 3*10 - 1 + 2 = 61 $$



## Space consideration

A catapult based tunnel bore will generally make a hole like this: 7x7 in size,
with a 5x5 are in the center where sticky blocks can be used.

{% include image.html
   url="/random-minecraft/assets/ilmango-tunnel-bore/size-matters.jpg"
   description="Size matters:  Hole Dimensions per Duper/Catapult" %}

The obsidian shows the problematic positions: the y-coordinate and
the front/back position of the exploding TNT is always the same.
But there is some randomness to the left/right position, and these
blocks do not always get blown up.

If you have multiple catapults/dupers, the tunnel will always be at least
7 m high as long as you put a catapult on every 5th block (i.e. catapult,
4 blocks of space, catapult).  If you space them out further than that,
blocks will be left over in these positions, especially if you are blasting
through blocks with high blast resistance.

For a single duper/catapult, these corner blocks will also sometimes stay
behind.  It is a sign that we are meant to leave out the corners in
out portals.

As I want to be able to space my catapults out if I am not interested in
a regular tunnel shape, I will keep any sticky blocks in these 5x5 regions,
and when linking up multiple segments I will keep them in the central 3 blocks
(the slimeblock region in the image).


### The All-Important Y-Position

The timings are critical because they determine the Y-position of the explosion.

![Timing the catapult](/random-minecraft/assets/ilmango-tunnel-bore/timing-the-catapult.jpg)

The contraption in the image has the same timings and height as the catapult 
used in the Ilmango Tunnel Bores - to horizontal piston fires 2 game ticks 
after the vertical one.  Also the upper slimeblock
is 4m above the lower one, although it as to be further back because the design is
stationary.

I want to find the delay that gives the most central explosion.  And I want to obtain
the fuse time of the TNT in the moment the vertical piston fires (this is when
the redstone lights up/when the observers in the catapult fire).


| Delay | TNT fuse on catapult activation / explosion position |
| 60 gt | fuse 19, explosion low by 2 |
| 61 gt | fuse 18, explosion low by 1 |
| 62 gt | fuse 17, explosion low by 0.75 |
| 63 gt | fuse 16, explosion low by 0.5 |
| 64 gt | fuse 15, explosion a little bit low |
| 65 gt | fuse 14, explosion a little bit high |
| 66 gt | fuse 13, explosion high by 0.5 |
| 67 gt | fuse 12, explosion high by 0.75 |
| 68 gt | fuse 11, explosion high by 1 |
| 69 gt |fuse 10, explosing high by 1 |

For the most promising candidates I also fired the catapult at a wall
and counted how many blocks were destroyed above and below the intended
vertical center of the explosion.

![Counting exploded blocks](/random-minecraft/assets/ilmango-tunnel-bore/counting-exploded-blocks.jpg)

| Delay | Distance | High | Low |
| 64 gt | 14 m | 10 | 15 |
| 64 gt | 14 m | 9 | 16 |
| 64 gt | 14 m | 10 | 15 |
| 65 gt | 13 m | 13 | 15 |
| 65 gt | 13 m | 14 | 13 |
| 65 gt | 13 m | 14 | 15 |
| 66 gt | 13 m | 8 | 5 |
| 66 gt | 13 m | 13 | 6 |
| 66 gt | 13 m | 7 | 4 |

65 game ticks of delay seems to be pretty centered, I guess it did not
seem that way because the eye has a tendency to follow the movement.
This seems like an ideal value for a centered design and
that makes me very happy - I just checked some tunnel bores I
already have, and they all show the magic fuse time of 14.
The timings seemed OK, but I always wondered if it was *exactly* right.


TODO


## Timings

* gt 1: duper single steppers begin retracting
* gt 3: flying machine observer fires
* gt 9: duper dupes (single stepper + extension delay), tnt fuse=79
* gt 27: flying machine activates return station
* gt 31: flying machine finished retraction, observer starting in other direction fires


* gt 61: flying machines removes redstone block for catapult stepper
* gt 63: flying machine has returned


Flying machine 3 blocks: 3*8 = 24 gt?

Flying machine delay: 7*8 + 4 = 60 gt????

## The TNT Launcher

2 observers (1 observing the other) activate a sticky piston
with a slime block.  Before the slime block is some
pushable non-sticky block (e.g. glazed terracotta or a
jack-o-lantern), then comes a wall to stop the TNT.

4 blocks above the first slimeblock is another slimeblock
that will be retracted by another piston via some connecting
sticky blocks.

When the duper is activated, it moves forward closing the
gap between duper and laucher.  The TNT slides forward
and comes to a stop when it hits the wall.  2 game ticks later,
the lower piston launches the TNT upwards, and another 2 game
ticks later the upper slimeblock is retracted by the other piston -
this launches the TNT forward.


#### The 2 Observer Trick

This trick may not be obvious at first:  2 observers
where 1 is observer is observing the other one.  In a stationary design,
this would simply propagate the signal with additional delay.
But when moved, both observers will fire, and the second one will then observe
the first one and fire again.  So you get a 2 gt on, 2 gt off, 2 gt on signal.

This will cause a piston to fire twice - a sticky piston will
first eject its block, then retract it again.

Also this can be used to block other pistons from extending,
e.g. to stop a flying machine or to get a piston in a BUDed state.


## The Dupers

Ilmango recently switched from using a 2 wide duper design
to his newer 1 wide honeblock duper.  He still uses the
older design in his "Industrial Mining Machine" video.
If you start building your own Tunnel Bores, I would suggest
switching to the newer design, it just gives you more
space to work with.

Behind every launcher is a duper.  When they
are spaced out on every 5th block, you get
a tunnel that is at least 7 blocks high.  If you space
them out more than that, the ceiling starts to come down.



XXX link to dupers

### Single-Step Insta-Wire





* 14 blocks of space free in front of machine
* tnt duper every 5th block (duper - 4 - duper)
* catapult 4 blocks up
