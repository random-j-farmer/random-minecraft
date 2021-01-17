---
layout: post
title:  Building an Ilmango Tunnel Bore
tags: slimestone tnt tunnelbore
use_mathjax: true
---
> Q: "I built this in survival and it blew up"
> 
> A: Yes, these tunnel bores will blow up if anything goes wrong.
>    Hit Ancient Debris, MACHINE GO BOOM.  Timing is off,
>    MACHINE GO BOOM.  Click Noteblock twice,
>    MACHINE GO BOOM.  Minecart slides back on the activator rail
>    when using the Minecart option, MACHINE GO BOOM.  
>
>    On the positive side, they make a big hole, they can be modified
>    to make an even bigger hole and you don't need Ancient Debris
>    to build them, because I hate mining for Ancient Debris.
>
>    You should
>    probably learn to use them in Creative, although learning in
>    survival might re-inforce the lesson, so it's all good.
>
> Q: "But my tunnel bore!  And my materials are all gone!"
>
> A: Haha! MACHINE GO BOOM!

All the components here are lifted from Ilmangos designs,  I merely re-arrange them
according to my goals.

* Ease of understaning
* Simplicity
* Main module can be used alone or with additional extensions
* Variable spacing is possible

In particular this means that I don't use Ilmango's trademark
"Devil's Horns" Double Catapults.  I just use 1 single catapult
per duper.  With the 1 wide duper, there is plenty of space.

I will prefer Honeyblocks over Slimeblocks when I have a choice -
I find this easier to understand as Honeyblocks are less
powerful.

## Catapult and Duper

I prefer the newer 1-wide duper but using Slimeblocks
everywhere, this lets me push in the rail and cart with the piston
that pushes the duper (this is not an option with honey blocks,
because you can not put a rail on a honey block).

By using a slimeblock in the bottom position,
the duper can be used to stop the flying machine
that is providing the delay.

In the catapult, 2 observers extend and retract a sticky piston with a slimeblock
on top.  The primed TNT slides over the slimeblock and
a glazed terracotta before being stopped by a wall.

4 blocks above the first slimeblock is another slimeblock
that will be retracted by another piston (when this happens,
the lower part has already moved).

Both pistons will fire at the same time, but the upper slimeblock moves 2 game ticks
later because that happens on retraction.  The TNT is launched
first up and then forward. The slab on top bounces it back down.

![Catapult and Duper](/random-minecraft/assets/ilmango-tunnel-bore/catapult-and-duper.jpg)


#### The 2 Observer Trick

This trick may not be obvious at first:  2 observers
where 1 is observer is observing the other one.  In a stationary design,
this would simply propagate the signal with additional delay.
But when moved, both observers will fire, and the second one will then observe
the first one and fire again.  So you get a 2 gt on, 2 gt off, 2 gt on signal.

This will cause a piston to fire twice - a sticky piston will
first eject its block, then retract it again.

This can also be used to block other pistons from extending,
e.g. to stop a flying machine or to get a piston in a BUDed state.


### Single-Step Insta-Wire

![Single Step Instawire](/random-minecraft/assets/ilmango-tunnel-bore/single-step-instawire.jpg)

Lots of ways to set this one up.  The important thing is to keep the same delay for
the duper and catapult.  I choose to fire the extensions on the instawire extension,
this makes the design more flexible by preserving as much push limit as possible.

The position is higher than would be natural, this keeps the instawire in the 3 high
central zone.

### Stopping the 2-way Flying Machine

![FM Stopper](/random-minecraft/assets/ilmango-tunnel-bore/fm-stopper.jpg)

The returning flying machine must be stopped after activating the catapult instawire.
I just have it run up against the duper.  The image shows the position you build this in.
In action, the duper would have been single-stepped already, so there would be an open
space between duper and glazed terracotta.  This allows the flying machine to push
that redstone block away, then it runs into the duper and is stopped by the push limit.


## The 2-Way Flying Machine

![2-way Flying Machine](/random-minecraft/assets/ilmango-tunnel-bore/2-way-fm.jpg)

Standard flying machine with an additional observer to trigger the return station
and with a Redstone Block payload that will single-step the return station.

## Single-Stepping Return Station

![Single Step Return Station](/random-minecraft/assets/ilmango-tunnel-bore/return-station.jpg)

Another single stepper.  This time the back piston is powered
by QC by an observer when the sticky piston retracts.  It can
be advanced by powering and depowering the sticky piston.

The incoming 2-way flying machine does this by its payload redstone block.
It also has an observer that triggers the upper piston in the image.
This activates the observer in the 2-way flying machine that
will send it on its way back.


## The Control Module

The tunnel bore is complete and can be used already, but another single-step
flying machine makes it more convenient.  You can go as simple or fancy
as you like, for creative I like doing something like this:

![Control Module](/random-minecraft/assets/ilmango-tunnel-bore/control-module.jpg)

This lets me ride along on the honey block, and the noteblock can be reached from
the ground.  In survival, I might use a Slimeblock in front and stick a
repeater and observer to it.  Another observer to the pushing piston will stop 
the loop.  This is easier to activate from the ground, and it lets me climb
up to ride along.

![Control Module - Survival Option](/random-minecraft/assets/ilmango-tunnel-bore/control-module-survival.jpg)

## Extending the Tunnel Bore

Once you've come this far, extending the tunnel bore is relatively easy.
You simply extend the instawires and build the duper and catapult
extensions.  Note that the first module is slightly different,
but from here on all extensions are the same.

This variation works with a duper on every 5th block or on every 7th.
When blasting through netherrack you could space them out even more,
but if you hit basalt or blackstone you'd have to remove the left over blocks
or MACHINE GO BOOM.

![More Dupers](/random-minecraft/assets/ilmango-tunnel-bore/more-dupers.jpg)

![More Catapults](/random-minecraft/assets/ilmango-tunnel-bore/more-catapults.jpg)

I am not showing the duper and catapult again, these are completely unchanged.

On the last module, remove those last 2 Honeblocks or they will stick
to the wall and MACHINE GO BOOM.


