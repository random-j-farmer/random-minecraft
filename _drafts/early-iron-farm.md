---
layout: post
title: "Early Game Iron Farm"
---

There are a lot of videos on youtube about "Easy Starter Iron Farms", but to me they
mostly miss the point.  The building of the farms is not really the problem,
the problem is getting the villagers in, and the big problem is getting the zombie
in.

And more times than not, that part is elegantly skipped.

To me, the important bit is that you build your early game farm close to the ground.
So no pillaring up 20 odd blocks, that just makes it harder to put the villagers in
(and the zombie, oooh oooh, the zombie).

I usually put the villagers 6 blocks up from the ground, that is just enough that
the iron golems will not spawn on the ground.  And I've built it lower, iron golem
spawn range is easily controlled - it's just 8 blocks in every compass direction
(simplified but true) and 6 blocks up or down from the villagers positions.

The actual design of the farm is secondary to me.  They all tend to work at
similiar rates.

## Techman88's Design

But I do have a preference, and it is this one: [Easier Iron Farm (1.14.4)](https://www.youtube.com/watch?v=3I2jsINPGro)

Obviously, you don't need the workstations anymore but other than that, it still works fine.
And it has a couple of advantages that I miss about the simplified 1.15+ designs:

* The villagers are not standing on their beds, so if the farm stops working because
  a bed bugged out, you just wait for day when they are standing and destroy and
  place the bed again.
* The spawning pad on top means that a replacement zombie will not be ganked on the ground
  by iron golems, just put rails or redstone dust on any steps leading up the the zombie position.

Only change that is necessary for me: 2 glass blocks above each bed, and skip the workstations.
I build temporary stairs to the villager positions and let them go to sleep, than place those
glass blocks and destroy the stairway.

The zombie: it is possible to just lure it up a spawn-proofed stairway, trap it using
trap doors (ha! see what I did there!) and get it into a minecart.  When the area is too
dangerous (not a lot of spawning spaces underground) a better alternative may be
some zombie trap with a roof, then getting the zombie in position during the day
under controlled conditions.


## Drowning Villagers 

Sometimes the villagers can start to drown when they sleep.  I think it's positional - I've fixed
farms by turning them by 90 degrees or re-building a block over.  That's why I always test the villager positions on the ground first.  If they can sleep without drowning, I move the whole setup 6 blocks up.

## Mechanics

Villagers that are scared (e.g. by a zombie) and that can see at least 2 other villagers
will summon an Iron Golem, if they have not seen one in 700 game ticks.  The villagers need
to be within 10 blocks of each other.

The Iron Golem will spawn up to 8 blocks in horizontal directions (actually: negative 8, positive direciton 7) and 5 blocks up or down.  The spawning rules are relaxed, they will spawn in water or lava and on transparent blocks, although they do need a flat top level surface and will not spawn on redstone dust or rails.

The Iron Golem will be detected in a cube up to 16 blocks away from the villagers,
and since they are 3 blocks tall, 20 blocks down from the villager position is the first
reasonable position for the killing floor.

Villagers are scared by a zombie up to 6 blocks away.

An easy way to visualize this is by using carpet mods builtin `ai_tracker` script.

    script load ai_tracker
    ai_tracker villager_buddy_detection

or

    ai_tracker villager_iron_golem_detection

Villagers need to see 2 others, and they need to be within 10 blocks of each other.
