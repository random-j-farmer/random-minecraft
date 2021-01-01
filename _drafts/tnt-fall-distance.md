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

<p float="left">
<img alt="Fall chute/piston" width="48%"
     src="/random-minecraft/assets/tnt-fall-height/push_duper_retained_by_piston.jpg">
<img alt="Waterlogged trapdoor" width="48%"
     src="/random-minecraft/assets/tnt-fall-height/pull_duper_waterlogged_trapdoor.jpg">
</p>

Only repeaters on orange concrete count as delay (in the first picture, the torch and repeater
cancel each other out; in the second case the 3-tick repeater (green concrete) is canceled
by the 2 ticks repeater and the wait until the piston retracts).

If you want *really* low fall height, that green cement block on the right picture should be obsidian as well.

In both cases it takes the TNT another 0.1s to be primed.  So for delay $$d$$,
fall time $$t$$ and fall height $$h$$ we get:

$$t = 4.1 - d$$

$$a = 9.81$$

$$h = at^2$$


![TNT Fall height by delay](/random-minecraft/assets/tnt-fall-height/fallheight.svg)

The line in red is the plotted formula.  Generally you need at least 0.5 seconds of delay
or the TNT falls straight through to it's max fall height of 77 blocks.  With the trapdoor
you can use longer delays (up to 3.2 seconds) although you'll have to make that green cement
block obsidian.  With 3.2 s delay, all the blocks up to the obsidian are destroyed.

The Piston/Fall Chute version blows up if you go over 2.8 s.

| Delay | Fall Distance |
{% for tup in site.data.tnt_fallheight %}| {{ tup.delay }} s | {{ tup.fallHeight }} m |
{% endfor %}

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


