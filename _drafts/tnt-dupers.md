---
title: TNT Dupers
layout: post
tags: redstone tnt
---
## How do TNT Dupers work?

A BUDed TNT gets a block update immediately before it is
moved by a piston (directly or indirectly).  The block update primes the TNT,
it becomes an entity but the TNT block is not deleted - it becomes
Block 36 and continues being moved by the pison.

Since 1.13.1, a Coral Fan is typically used to give this block update,
although for stationary dupers you can just do it with a redstone circuit.

The position of the coral fan is important - all blocks in the duper
are moved in the same game tick, but the coral fan has to move first
in that game tick.

Ray Works has a good video about this: 
[It's BACK! 1.13.1-1.16.3+ TNT Duping | vanilla survival](https://youtu.be/CJAbnB4p52g?t=286)

Because the TNT is BUDed, you must be careful not to give it block updates.
I.e. no placing or destroying any of the 6 immediately neighboring blocks.
Redstone dust gives block updates up to 2 blocks away!

You also can not just build the duper in its working form.  As soon as you
place the TNT block or put the minecart on the powered rail, the TNT is primed 
by the block update.  You either have to push in the minecart and rail with
a piston, or arrange for the TNT to be pulled or pushed in position on the first
activation.

## The Mytteri Dupers

Popularized by Ilmango's [1.13.1 World Eater](https://youtu.be/8KAPO4NScQ8?t=73)
video, if you only know one TNT duper - it is this one.  Lots of videos about it,
if credit is given it is usually to Ilmango.  Ilmango says that Mytteri
came up with the design.

This family of dupers dupes falling TNT, either on push (the most well known one),
on pull (my favorite) or in both directions.  The TNT is below a slimeblock, so
it does not hop up which gives you extra time.  Also there are no slimeblocks
next to the TNT in the main direction of travel, this lets you align the falling
TNT with 2 walls and a fence gate.  This is great for stationary farms.

### The Mytteri Pull Duper

* Easy to figure out the correct position
* Easy to assemble and re-assemble
* Exact alignment with 2 walls and 1 open fence gate

![Mytteri Pull Duper - Assembly](/random-minecraft/assets/tnt-dupers/mytteri-pull-assembly.jpg)

Just put the TNT where you want it to fall and build the shape from there. 
First push will grab the TNT, first pull will dupe.

To re-assemble if you lost the TNT or because you used a placeholder block until
the timings seem ok:  Put the TNT below the wall, first push will grab the TNT,
first pull will dupe.

![Mytteri Pull Duper - Operational](/random-minecraft/assets/tnt-dupers/mytteri-pull-operational.jpg)


### The Mytteri Push Duper

The famous one.  Dupes on push.  For a stationary farm I prefer the pull duper,
for a flying machine I would consider other designs first.

* Easy to assemble
* Exact alignment with 2 walls and 1 open fence gate

![Mytteri Push Duper - Assembly](/random-minecraft/assets/tnt-dupers/mytteri-push-assembly.jpg)

When building, the TNT goes 1 position in front of it's fall position.
First push will grab the TNT, next push will dupe.

Can be re-assembled by knocking out the connecting slimeblock (behind the minecart in the image)
when the piston is extended, then retracting the piston.  Put TNT below wall, replace slimeblock.
First push will grab the TNT, next push will dupe.

![Mytteri Push Duper - Operational](/random-minecraft/assets/tnt-dupers/mytteri-push-operational.jpg)

### Other Variations

* Push-Pull Duper: have a coral fan in front and in back of the TNT
* [5 Way TNT Duper](https://www.youtube.com/watch?v=TyT2TdkDs0Q): 
  Pull duper, with additional slimeblock and additional walls.
  Can be pushed and pulled on top slimeblocks, or pushed against
  the minecart.


## Rays Works Slim Duper

These are by Rays Works according to his video linked above.

They are only 1 block wide, so you can pack them tightly.
The height can be a problem though.

### Rays Works Slim Push Duper

* Easy to assemble and re-assemble
* Good for controlling fall height with honey blocks

![Rays Works Slim Duper - Assembly](/random-minecraft/assets/tnt-dupers/raysworks-push-assembly.jpg)

From the fallchute, figure out the position for the wall and build the shape.
TNT below the wall. Push once to assemble, next push will dupe.

![Rays Works Slim Duper - Operational](/random-minecraft/assets/tnt-dupers/raysworks-push-operational.jpg)

Borkon likes [Controlling TNT with honey](https://youtu.be/CacH1K9RJNE).  Me, I am not entirely
convinced.  I like the more fine-grained control of pistons or waterlogged trapdoors.

In any way his formula is: 4 honey blocks, top block 1 below tnt, with 3 blocks of air
between honey and duper.  TNT will explode 15 blocks below TNT position.

### Variations

By knocking out the bottom 2 slimeblocks and sticking the coral fan on the remaining slimeblock
below the TNT, you get a pull duper.  The TNT falls instead of shooting out.


## Timing and Alignment

* 2 Walls and open fence gate: Ilmango
* Water: moves 1 block in 5 game ticks


## TODO

[2 way duper by Mytteri](https://www.youtube.com/watch?v=gpb4MxmX-6Y)

Eta740 on [Standard TNT Dupers](https://www.youtube.com/watch?v=xs2XVyZ0tGY)
