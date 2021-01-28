---
layout: post
title: On Hopper Lag
tags: hoppers lag
---

Some numbers about hopper lag, for version 1.16.4.

Using command blocks, a 65x65 surface of these blocks was created,
4225 in total.

| What | Vanilla | Sodium/Lithium/Phosphor |
| Empty world |  1ms | 1.2mspt |
| create 4225 hoppers, facing down |  7-8ms| 8.1 mspt|
| cover them with composters |  4ms| 3.6 mspt |
| cover them with droppers |  4ms| 4.3 mspt |
| cover them with furnaces |  5-6ms| 4.8 mspt |
| redstone blocks |  1-2ms| 1.3 mspt |
| redstone blocks + droppers |  2ms| 1.3 mspt |
| redstone blocks + composters |  2ms| 1.3 mspt |
| redstone blocks + furnace |  2ms| 1.9 mspt |

* Hoppers without an inventory above them are bad, although not
  that bad: 4225 hoppers in 25 chunks cause approx 7 mspt.
* I did try having some loose items in each chunk but could not
  see a difference, although I am not certain I measured
  the furnace case.
* Some kind of inventory above the hopper halves the penalty,
  but furnaces are a bad choice.  Composters or droppers are good.
* Best is turning them off by powering them.

Using the carpet mod commands `tick health` or `tick entities` gives
more dramatic numbers.  It seems the 'Uncertainty Principle' applies to
Minecraft.  I wonder what Heisenberg would think about that.
