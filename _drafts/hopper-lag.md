---
layout: post
title: Hopper Lag
---

As of 1.16.4

Using command blocks, a 64x64 surface of of these blocks is created.

| What | Vanilla | Sodium/Lithium/Phosphor |
| Empty world |  1ms | 1.2mspt |
| create 4225 hoppers, facing down |  7-8ms| 8.1 mspt|
| cover them with composters |  4ms| 3.6 mspt |
| cover them with droppers |  4ms| 4.3 mspt |
| cover them with furnace |  5-6ms| 4.8 mspt |
| redstone blocks |  1-2ms| 1.3 mspt |
| redstone blocks + droppers |  2ms| 1.3 mspt |
| redstone blocks + composters |  2ms| 1.3 mspt |
| redstone blocks + furnace |  2ms| 1.9 mspt |

So results still stand: hoppers without inventory bad:
8ms for 4226 hoppers.  powering them removes the penalty,
composters or furnaces halve the penalty.
