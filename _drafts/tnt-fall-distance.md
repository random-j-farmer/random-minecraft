---
layout: post
title:  "TNT Fall Distance"
tags: redstone tnt
use_mathjax: true
---

* [Controlling Fall Distance with Redstone](#controlling-fall-distance-with-redstone)
* [Controlling Fall Distance with Honey]


## Controlling Fall Distance with Redstone

The falling TNT is caught by some mechanism and allowed to fall
again after some delay.  Pistons and trapdoors are popular choices.
Trapdoors have the advantage that they can be water logged - if you
screw up the timing and the TNT explodes in the water, your mechanism
will not be damaged (it's not 100% foolproof though, e.g. 3.6s delay with
the trapdoor example will damage the duper).

<p float="left">
<img alt="Rays Works / Piston" width="48%"
     src="/random-minecraft/assets/tnt-fall-distance/ray-piston.jpg">
<img alt="Mytteri / Piston" width="48%"
     src="/random-minecraft/assets/tnt-fall-distance/mytteri-piston.jpg">
<img alt="Dispenser / Piston" width="48%"
     src="/random-minecraft/assets/tnt-fall-distance/dispenser-piston.jpg">
</p>

<p float="left">
<img alt="Kades / Trapdoor" width="48%"
     src="/random-minecraft/assets/tnt-fall-distance/kades-trapdoor.jpg">
<img alt="Dispenser / Trapdoor" width="48%"
     src="/random-minecraft/assets/tnt-fall-distance/dispenser-trapdoor.jpg">
</p>

Only repeaters on orange concrete count as delay.

If you want *really* low fall height, that green cement block on the Kades Duper
should be obsidian as well.

In both cases it takes some additional time until the TNT is primed.  So for delay $$d$$,
the fall time is $$t = 4.1 - d$$ for dupers and $$t = 4.4 - d$$ for dispensers.

$$a = 9.81$$

$$h = at^2$$


![TNT Fall height by delay](/random-minecraft/assets/tnt-fall-distance/tnt-fall-distance.svg)

The line in red is the plotted formula.  Generally you need at least 0.5 seconds of delay
or the TNT falls straight through to it's max fall height of 77 blocks.  With the trapdoor
you can use longer delays (up to 3.2 seconds) although you'll have to make that green cement
block obsidian.  With 3.2 s delay, all the blocks up to the obsidian are destroyed.

The Piston/Fall Chute version blows up if you go over 2.8 s.

<table>
     <tr>
          <th>Delay in seconds</th>
          <th>Fall distance (Duper)</th>
          <th>Fall distance (Dispenser)</th>
     </tr>
     <tr>
          <td><input id="calculatorInput" type="number" min="0" max="4" step="0.1" oninput="calculatorOnInput(event)"></td>
          <td id="calculatorResultDuper"></td>
          <td id="calculatorResultDispenser"></td>
     </tr>
</table>

### On the magic 4.1/4.4 values

I don't fully understand what is going on here.  If you let the TNT fall without catching it,
it reaches its expected fall distance assuming a 4 second fuse time.  As soon as you catch it
and let it fall again, it suddenly falls for longer than expected, and TNT
from dispensers falls even longer.  Dispensers seem to take 3 gt longer to prime than dupers,
but sad the difference is more than that.

It is consistent though, so I am sharing my method of predicting fall distance.
Which is to only count magic "orange" repeaters as delay, and subtracting
from magic constants.

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


