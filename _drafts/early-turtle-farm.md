---
layout: post
title: Early Game Turtle Farm
---

Early game turtle farms are extremely useful.

The Turtle Shell helmet gives an additional 10 seconds of time under water
before the player starts to take damage.  This makes diving into shipwrecks
much easier - and early game, the loot from these shipwrecks is extremely useful.

[Shipwrecks](https://minecraft.gamepedia.com/Shipwreck) generate with up to 3 loot chests containing
various seeds (sometimes bamboo!  which can be very welcome), iron (very common) or 
other precious ores and Treasure Maps, leading to more useful items (the treasure is always
at chunk coordinate 9, btw).

Later in the game, I've rarely found a use for turtle shells.  An enchanted diamond or netherite
helmet is a better choice; and I personally do not think that a Potion of the Turtle Master
is worth the inventory slot.

## Well Known Designs

[Turtle farming](https://minecraft.gamepedia.com/Tutorials/Turtle_farming) has been
on the minecraft wiki for a long time, and you'll find plenty of videos on youtube
using this design.

Then there is Rays Works [Easy AFK Turtle Shell Farm](https://www.youtube.com/watch?v=IcnPYOVhYyM),
which is fully automatic but in my opinion not a good choice early game.  I do like
that it kills the turtles though - my starter base is usually near if not in the spawn chunks,
and I don't like flooding the spawn chunks with turtles.

## The Pathfinding Approach

I like using path finding in my farms, and turtle babies attempt to path find to the
nearest water source block with sky light access.  So you arrange the layout that
the water source blocks on one side are always the nearest for every block inside the
enclosure, and then you stop the migration to the sea with trap doors, dropping the baby
turtles down at least 2 blocks.

The baby turtles sometimes climb on each other, and when they grow up they can glitch out
of the kill chamber if you use less than that.

The hoppers below the slabs will pick up the scutes and the seagrass.

## Building the farm

Turtles will lay their eggs only on their home beach.  If you trap non-local turtles
in your enclosure, they will never lay eggs.  I suggest finding a nice turtle beach
and breeding 2 turtles, then building your farm around those first eggs.
If you trap the parent turtles, one of them may be non-local and you'll have to kill it.

Once you have your turtle eggs, light up the area and build an enclosure around it.
The interior dimensions are not that important, I like using 3 turtles in a 5x5 space
but that is just preference.  The important bit is that on one side, you need an additional
block and then water, and on all other sides the water must be further away.

In the enclosure, all non-sand blocks should be replaced with sand.  I also like 
to replace the layer below with some non-gravity block but that is not strictly
necessary.

If you still need additional turtles, put a temporay block above the drop until you have
enough.

## Using the farm

Turtle eggs need random ticks to crack, and their best chance to crack is 
in a brief window of time (21600 to 22550 ticks, around 48 seconds according to the wiki)
immediately before dawn.

So you can not sleep at night when trying to breed turtles, you need to stay
up through the night, although you can sleep just before the sun goes up if
you are afraid of phantoms.

You also have to stay in the area - only chunks whose center is within 128 blocks
of a player are ticked.

And once the turtles are hatched, the baby turtles need to grow up.  This takes
one minecraft day AKA 20 minutes, and again you have to stay in the area -
the chunk needs to be ticked for animals (or plants, for that matter) to grow.

You could AFK this, personally I just build my starter base within tick distance
of my turtle farm.
