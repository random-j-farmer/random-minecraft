---
layout: post
title:  "Controlling TNT Fall Distance with Redstone"
tags: redstone tnt
use_mathjax: true
---

Falling TNT is caught by some mechanism and is allowed to fall
again after some delay.  Pistons and trapdoors are popular choices.


#### Designs using a retracting piston

<p float="left">
<img alt="Mytteri / Piston" width="48%"
     src="/random-minecraft/assets/tnt-fall-distance/mytteri-piston.jpg">
<img alt="Dispenser / Piston" width="48%"
     src="/random-minecraft/assets/tnt-fall-distance/dispenser-piston.jpg">
</p>

* The input signal is typically long and is negated to control the piston
* Other push dupers can be substituted, e.g. a duper that ejects the
  TNT forward into a fall chute.
* Good for long fall distances


#### Designs using a trapdoor

<p float="left">
<img alt="Kades / Trapdoor" width="48%"
     src="/random-minecraft/assets/tnt-fall-distance/kades-trapdoor.jpg">
<img alt="Dispenser / Trapdoor" width="48%"
     src="/random-minecraft/assets/tnt-fall-distance/dispenser-trapdoor.jpg">
</p>

* The input signal is typically a 3 or 4 gt pulse.  The simplified calculator
  below assumes a 4 gt signal
* The water will not flow out because the trapdoor is only open for 2 game ticks
* Good for short fall distances - you can blow up blocks
  right up to the obsidian/waterlogged trapdoor.

If you waterlog the trapdoor you need blocks (preferably obsidian) all around it.
This means the TNT must be aligned in all 4 directions, which makes the duper
tricky to build.  I recommend pushing the minecart and rail into place.

### Simplified method for predicting fall distance

* Only repeaters on orange concrete count as delay
* Only works for the contraptions given above or contraptions
  with identical timings
* Eyeball the fall distance from the provided chart
  or use the calculator

<table>
     <caption>Simplified Fall Distance</caption>
     <tr>
          <th>Delay in seconds<br>(Orange Cement)</th>
          <th>Fall distance<br>(Push Duper/Piston)</th>
          <th>Fall distance<br>(Pull Duper/Trapdoor, Dispenser TD/Piston)</th>
     </tr>
     <tr>
          <td><input id="simpleCalculatorInput" type="number" min="0" max="4" step="0.1" value="2.0"></td>
          <td id="simpleCalculatorResultMytteriPiston"></td>
          <td id="simpleCalculatorResultKadesTrapdoor"></td>
     </tr>
</table>


![TNT Fall height by delay](/random-minecraft/assets/tnt-fall-distance/tnt-fall-distance.svg)

* Orange line: calculated fall distance for Mytteri Duper with retracting Piston
* Red line: calculated fall distance for Kades Duper with waterlogged trapdoor
  or dispenser with either method
* The points are measured fall distances for the various methods
* Points above 75m happen when the TNT is never caught, so it falls it's standard 77 blocks
* "boom" indicates that the delay was too short - the contraption was damaged

### Exact method for predicting fall distance

The simplified calculator only works if your mechanism has the exact same
timings as the ones the calculator is made for.  If your design is different 
or directly activated by user input, the timings may be different.

If you can figure out the amount of fuse left on the TNT in the exact moment
it begins to fall, you can use the calcular below which is always correct.

* Use `tick freeze` in carpet mod
* Activate the mechanism
* `tick step` until the TNT is released from the piston/trap door again.
  Use `data get entity @e[type=tnt,sort=nearest,limit=1]` and look
  for the tick in which it falls 0.04m.  With trapdoors, you have to look
  at the change in y-coordinate, with pistons look at `fallHeight`
* Write down the repeater setting and the measured remaining fuse
* Using the Exact Fall Distance calculator, figure out the change
  in delay you need (increasing the delay will *shorten* the fuse)

<table>
     <caption>Exact Fall Distance</caption>
     <tr>
          <th>Fuse time (gt)</th>
          <th>Fall distance</th>
     </tr>
     <tr>
          <td><input id="exactCalculatorInput" type="number" min="0" max="79" step="1" value="39"></td>
          <td id="exactCalculatorResult"></td>
     </tr>
</table>



### Dupers vs Dispensers

As you may have noticed, fall distance is different for dupers and dispensers.

With a dispenser, the TNT is primed 4 gt after the dispenser was activated.

With a duper, the TNT is primed the instant the piston starts moving.

So in general, TNT will fall shorter distances from a push duper.  A pull duper dupes
at the end of the signal, and the most convenient signal is 4 game ticks,
so pull dupers typically have the same fall distance as a dispenser.

### Direct User Activation

User input is handled specially by the game, it is processed *before*
redstone.  So I figured I would see if that makes a difference,
and it does.

A push duper will prime the TNT one game tick *later* when activated
directly by a lever or button, and the TNT falls for 1 game tick longer.

That came as a surprise to me, I would have expected the opposite.

In the other cases, direct user activation does not make a difference.
Dispensers always take 4 gt to prime the TNT.  And pull based
dupers dupe at the falling edge of the signal. While it might
be possible to set one up so that is directly powered,
there are easier ways to get a 1 gt delay.

<script async
  src="/random-minecraft/assets/tnt-fall-distance/calculator.js"
  ></script>
