---
layout: post
title:  "The Humble Etho Clock"
# date:   2020-12-24 08:47:49 +0100
categories: redstone
---
The Etho Clock shows up in a lot of redstone tutorials as a clock with 
programmable cycle length. But it is more than that -
it will always complete its current cycle, 
making it safe to turn off at any moment (important
when using the longer signals) and giving spam protection
(important when using the start pulses).  When used as
 a clock, the signals and delays are always the same on
 the first and all subsequent cycles.

It has a built-in latch, so it can be used as a latch or t-flip flop.
And by having one half auto-reset and the other controlled
by an input signal, you get a monostable with spam protection,
or even a monostable/pulse extender.


## Timings and Signals

The table below gives the cycle lengths for various numbers of items.

| Items | Total Cycle | Half-Cycle |
| 2 items | 20 gt (1 s) | 8 gt up, 4 + 8 gt down |
| 3 items | 36 gt (1.8 s) | 16 gt up, 4 + 16 gt down |
| 4 items | 52 gt (2.6 s) | 24 gt up, 4 + 24 gt down |
| 5 items | 68 gt (3.4 s) | 32 gt up, 4 + 32 gt down |
| For n >= 2 | 4 + 16*(n - 1) | 8*(n - 1) up |

I would not recommend using an Etho clock with 1 item. The half-cycles
become odd (5gt up/9gt down),  and the start pulse is unreliable. 
It behaves differently depending on the input signal (i.e. when the
clock is on for longer periods, you get an alternating 14gt signal,
when triggered by a short signal you get anything between a 2gt
and 7gt pulse).


![Signals](/assets/the-humble-etho-clock/etho-clock-signals.png)

The three most useful signals are:

1. In the position of the front lamp, a continuous signal for the
   first half cylcle (minus the start pulse) can be taken.
2. The torch on the right (near the off-switch) gives a 2gt+ signal
   at the start of the cycle - this can be used with comparators
   and torches but sticky pistons will eject their block.
3. The comparator pointing in front gives a continuous signal
   for the whole cycle (minus the start pulse).

A continuous signal for the second half can be taken from the redstone
block in its left position.

Combining an additional comparator reading from the right hopper
with a falling edge detector gives a signal at the end of the
cycle (in the example image, the comparator at the back 
leads into sticky piston pushing an observer).

### 2gt+ Signal aka Extended 2 Game Tick Signal

Normally, a 2 game tick signal will cause a sticky piston
to eject its block, and it will not pass through comparators
or torches.

An Extended 2 Game Tick Signal will still cause a sticky piston
to eject its block, but it *will* pass through torches and comparators.

This means the start and half-time pulses can be used in logic circuits
or torch towers, but they can also be used as a normal 2gt signal,
no need for an additional monostable.

There are other ways to produce such a signal (generally by a block event
triggering the removal of a power source).  Ilmango has an excellent
video on [Extended 2 Game Tick Signals](https://www.youtube.com/watch?v=VjzuJqWAPFQ).

## Example: Monostable with Spam Protection

![Gnembon Tree Farm](/assets/the-humble-etho-clock/gnembon-tree-farm.png)

This is the piston layout for a Gnembon-style tree farm.
It runs on a 10 gt signal, with 8 gt delay between the piston groups.
The final piston column needs a 10 gt delay.

We need a 2gt signal into the sand on the piston to start the piston sequence,
and it must not be signaled again before the piston sequence has completed.
The Etho clock (3 items) provides both guarantees, no matter how
often the button is pressed or how fast that lever is toggled.

In a real farm, the piston sequence would be triggered by
a comparator reading the bonemeal dispenser through the
tree.  The clock would be positioned further back. It is in 
this position because it gives a good view of piston sequence.

## Example: Monostable II

![Ilmango Duper](/assets/the-humble-etho-clock/ilmango-duper.png)

This is from Ilmangos Simple Oak/Birch farm.  It is kind of special because
the TnT is duped on retraction - at the end of the signal.  The trap door
is pulsed by the observer when the lower piston extends - at the start of the signal.

Usually TnT dupers will be controlled by the half-cycle signal, here
the 2gt+ pulse is better because we need a short signal.

The clock contains 5 items - with a constant signal,
the next tnt is already falling while the trap door operates.


## Example: Monostable/Pulse Extender

![Stem Farm](/assets/the-humble-etho-clock/stem-farm.png)

The screenshot shows the control of a TnT duper for a stem farm.

The input is the NoTree signal on the right.  When this goes down,
a TnT is duped every 4.2 seconds until the trunk has been pushed
up by a piston.

The output is the DuperActive signal on the left.  It goes into
a logic circuit that controls the main farm.  When the tree
trunk has been pushed up and the current TnT has has exploded,
the farm will go back into grow mode and signal the TnT duper
again when the next tree has grown.



## Example: Monostable/Pulse Extender II

![TnTree Farm](/assets/the-humble-etho-clock/tntree-farm.png)

This example shows an Etho clock controlling a variation of an Etho TnTree Farm.  6
dispensers loaded with TnT are spaced over 21 blocks, with a 24 gt delay between.
Below every dispenser is a piston that will retract 36 gt later, giving the TnT
a fall height of around 27ish blocks.

It's a nice and fun farm, but if the signal is too short, the lower pistons will
expand before the last TnT has passed by and the farm will blow up.

The Etho clock is triggered by pressing the button, or by the observing a bubble
column onto a 2-tick repeater.  It has 21 items in it and the signal it provides is just long enough
to prevent that from happening - one less item and farm go BOOM.  The second half of
the cycle allows all pistons to extend again.  This is not strictly necessary but
does not hurt with this farm because after the explosions the player has to plant
and bonemeal 4 spruce trees anyway.

Why 21 items?  The last dispenser fires 120 gt after the first one, and the last
TnT has to fall 20+ blocks before the first piston extends again.  The piston delays
cancel each other out, it is just the delay between first and last dispenser
plus the time for the TnT to fall.
