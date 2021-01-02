Dispenser, no top block: 74 m fall distance
Dispenser, block on top does not let the TNT hop: 80 m fall distance
Mytteri duper: 80 m fall distance

$$ 9.81/2*4.05^2 ~ 80.45 $$

Mytteri Duper + Torch + 5 4tick repeaters + piston: 44 gt total delay.
expected fall distance of 16.79 m, but we get 22.5 m.

$$ 9.81/2*2.15^2 ~ 22.67 $$

Dispenser, top block, torch + 5 4 tick repeaters + piston: 44gt total delay, 
expected fall distance 16.79 m, we get 26 m.

$$ 9.81/2*2.3^2 ~ 25.95 $$

The TNT appears 4 gt after the lever has been toggled. The piston needs 
2 gt to retract so the TNT can fall, so torch and retracting
piston add 4 gt.

Effective delay is just the repeaters.

Here, the TNT appears 4 gt after the lever has been toggled with a fuse of 79,
3 gt later than the

So somehow, the act of stopping a falling TNT and letting it fall again adds some time
to it's fuse timer:  0.3s for a duped TNT, 0.45s for a dispensed TNT.

It does appear as if duped TNT appears instantly the moment the duper's piston starts to move.
The dispensed TNT appears 3 game ticks later.
