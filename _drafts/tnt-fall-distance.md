---
layout: post
title:  "TNT Fall Distance"
tags: redstone tnt
use_mathjax: true
---

## Controlling Fall Height by Redstone

The falling TNT is caught by some mechanism and only allowed to fall
after some delay.  Pistons and trapdoors are popular choices.
Trapdoors have the advantage that they can be water logged - if you
screw up the timing and the TNT explodes in the water, your mechanism
will not be damaged (it's not 100% foolproof though, e.g. 3.6s delay with
the trapdoor example will damage the duper).


![Fall chute/piston](/random-minecraft/assets/tnt-fall-height/push_duper_retained_by_piston.jpg)

The torch and the duper piston cancel each other out - only orange cement counts as delay.

![Waterlogged trapdoor](/random-minecraft/assets/tnt-fall-height/pull_duper_waterlogged_trapdoor.jpg)

We need a 2 tick pulse for the duper, the the push of the piston adds another tick.  This
is cancelled out by the 3 tick repeater on the green cement.  Again, only orange cement
counts as delay.

If you want *really* low fall height, that green cement block should be obsidian as well.

In both cases it takes the TNT another 0.1s to be primed.  So for delay $$d$$,
fall time $$t$$ and fall height $$h$$ we get:

$$t = 4.1 - d$$

$$a = 9.81$$

$$h = at^2$$


![TNT Fall height by delay](/random-minecraft/assets/tnt-fall-height/fallheight.svg)

## Horizontal Dispenser w/ Honey Blocks

| Honey blocks | Destroyed Y |
| 1  | 50 - 57 |
| 2 | 38 - 43 |
| 3 | 25 - 30 |
| 4 | 16 - 20 |
| 5 | 8 - 13 |


## Horizontal TNT Duper w/ Honey Blocks

| Honey blocks | Destroyed Y |
| 3x2 Honey | 48 - 54 |
| 3x3 Honey | 33 - 39 |
| 3x4 Honey | 22 - 27 |
| 3x5 Honey | 14 - 19 |


