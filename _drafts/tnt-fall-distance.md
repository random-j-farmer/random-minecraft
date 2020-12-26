---
layout: post
title:  "TnT Fall Distance"
# date:   2020-12-24 08:47:49 +0100
categories: redstone
---

## Horizontal TnT Duper Retained by Piston

![Duper retained by piston](/assets/tnt-fall-height/duper-piston.png)

Fall height is measured from the Shroomlights.  Example shows 2s delay.

Delay is pure redstone delay on piston retraction.  The torch
and the duper piston cancel each other out.  It takes an additional
tick for the TnT to prime it seems!

Fall time is 4.1 - delay.  The fall height formula is the standard
one from real life:  9.81/2*square(t)

| Delay | Destroyed Y | Fall time | Height according to formula |
| 2.8 s | 3 - 11 | 1.3 s | 8.2 m |
| 2.4 s | 11 - 17 | 1.7 s | 14.14 m |
| 2 s | 17 - 25 | 2.1 s | 21.64 m |
| 1.6 s | 26 - 34 | 2.5 s | 30.65 m |
| 1.2 s | 38 - 44 | 2.9 s | 41.25 m |


## Horizontal Dispenser w/ Honey Blocks

| Honey blocks | Destroyed Y |
| 1  | 50 - 57 |
| 2 | 38 - 43 |
| 3 | 25 - 30 |
| 4 | 16 - 20 |
| 5 | 8 - 13 |


## Horizontal TnT Duper w/ Honey Blocks

| Honey blocks | Destroyed Y |
| 3x2 Honey | 48 - 54 |
| 3x3 Honey | 33 - 39 |
| 3x4 Honey | 22 - 27 |
| 3x5 Honey | 14 - 19 |


