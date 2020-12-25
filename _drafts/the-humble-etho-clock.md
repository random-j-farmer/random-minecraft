---
layout: post
title:  "The Humble Etho Clock"
# date:   2020-12-24 08:47:49 +0100
categories: redstone
---
The Etho Clock shows up in a lot of redstone tutorials as a clock with 
variable cycle length.  But it is actually much more than that:
It will always complete its current cycle, thus making it safe to turn off at
any moment and giving spam protection.

It also provides a variety of signals: a 2gt+ pulse at the start and at halftime,
and 2 continuous signals that last half the total cycle.

It can be used as a monostable circuit, as a latch or a flip-flop or as a clock,
all with well-defined minimal and maximal signal lengths.

## Signal Pickups

![Signals](/assets/the-humble-etho-clock/etho-clock-signals.png)

1. The torch on the right (near the off-switch) gives a 2gt+ signal
   at the start of the cycle
2. The front lamp shows a continuous signal for the rest of the first half-cycle
3. The torch on the left gives a 2gt+ signal at half-time

Additional comparator readings can be taken from the right hopper, this
is on for the whole cycle except for the start pulse.  When combined
with a falling edge detector, you can get an additional signal at the
end of the cycle (in the example image, the comparator at the back 
leads into sticky piston pushing an observer).

A continuous signal for the second half can be taken from the redstone
block in its left position.


### 2gt+ Signal aka Extended 2 Game Tick Signal

Normally, a 2 game tick signal will cause a sticky piston
to eject its block, and it will not pass through comparators
or torches.

An Extended 2 Game Tick Signal will still cause a sticky piston
to eject its block, but it *will* pass through torches and comparators.

This means the start and half-time pulses can be used in logic circuits
or torch towers, but it it can also be used as a normal 2gt signal,
no need for an additional monostable.

There are other ways to produce such a signal (generally by a block event
triggering the removal of a power source).  Ilmango has an excellent
video on [Extended 2 Game Tick Signals](https://www.youtube.com/watch?v=VjzuJqWAPFQ).


## Programmable Delay

The table below gives the cycle lengths for various numbers of items.

1 item is special because the Hopper 8gt cooldown does not come into play.

| Items | Total Cycle | Half-Cycle |
| 1 item | 14 gt (0.7s) | 5 gt up, 9 gt down |
| 2 items | 20 gt (1 s) | 8 gt up, 4 + 8 gt down |
| 3 items | 36 gt (1.8 s) | 16 gt up, 4 + 16 gt down |
| 4 items | 52 gt (2.6 s) | 24 gt up, 4 + 24 gt down |
| 5 items | 68 gt (3.4 s) | 32 gt up, 4 + 32 gt down |
| For n >= 2 | 4 + 16*(n - 1) | 8*(n - 1) up |


## Example: Stem Farm TnT Duper Control

![Stem Farm](/assets/the-humble-etho-clock/stem-farm.png)

The screenshot shows the control of a TnT duper for a stem farm.

The TnT is duped on the leading edge, so the half-cycle signal is
used to extend and retract the controlling piston.  An additional reading
is taken from the hopper below - this turns the rest of the farm off
until the TnT has exploded.

6 items in the Etho clock allows the TnT to go off, when the signal turns off
the farm goes back into grow mode.  Once the next stem
is grown it signals the TnT duper again and the cycle continues.


## Example: Gnembon Tree Farm

![Gnembon Tree Farm](/assets/the-humble-etho-clock/gnembon-tree-farm.png)

This is the piston layout for a Gnembon-style tree farm.
It runs on a 10 gt signal, with 8 gt delay between the piston groups.
The final piston column needs a 10 gt delay.

3 items in the Etho clock will prevent the farm from tearing
itself apart if it is triggered too quickly.

The 10gt signal for the double extenders is produced by
the falling sand block which is triggered by the 2gt start pulse.


## Example: Ilmango Duper

![Ilmango Duper](/assets/the-humble-etho-clock/ilmango-duper.png)

This is from Ilmangos Simple Oak/Birch farm.  It is kind of special because
the TnT is duped on retraction - at the end of the signal.  The trap door
is pulsed by the observer when the lower piston extends - at the start of the signal.

Usually TnT dupers will be controlled by the half-cycle signal, here
the 2gt+ pulse is better because we need both edges close together.

The clock contains 5 items - the next tnt is already falling while the trap
door operates.

## Example:  TnTree Farm

![TnTree Farm](/assets/the-humble-etho-clock/tntree-farm.png)

This example shows an Etho clock controlling a variation of an Etho TnTree Farm.  6
dispensers loaded with TnT are spaced over 21 blocks, with a 24 gt delay between.
Below every dispenser is a piston that will retract 40 gt later, giving the TnT
a fall height of around 25-30 blocks.

It's a nice and fun farm, but if the signal is too short, the lower pistons will
expand before the last TnT has passed by and the farm will blow up.

The Etho clock has 21 items in it and the signal it provides is just long enough
to prevent that from happening - one less item and farm go BOOM.  The second half of
the cycle allows all pistons to extend again.  This is not strictly necessary but
does not hurt with this farm because after the explosions the player has to plant
and bonemeal 4 spruce trees anyway.

Why 21 items?  The last dispenser fires 120 gt after the first one, 40 gt later that
TnT starts falling - it has to fall 22 blocks before the first pistom may expand again.
The first piston retracts at T40 and expands again at T(40 + X).
