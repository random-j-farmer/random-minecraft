### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ ccf6af68-4bb4-11eb-2b1c-c9edc4b3dc51
begin
	# cd(dir) 
	# environment of notebook file used by default
	import Pkg
	Pkg.activate(".")
	using Gadfly
	using CSV
	using DataFrames
	using PlutoUI
	using Statistics
end


# ╔═╡ 5f8c842c-4f95-11eb-09ff-29fee65451f4
md"""## Mytteri Duper

4 gt delay (because user input is handled different), then torch/40gt delay/piston.

* gt 4: redstone wire actives, TNT is duped and appears with fuse 79, fall distance 0
* gt 5: piston starts moving, TNT is falling with fuse 78
* gt 6: torch turns off
* gt 44: tnt is on piston, fuse=39, not moving, fall distance 0
* gt 45: tnt is on piston, fuse=38, not moving, fall distance 0
* gt 46: last repeater turns off, piston starts retracting, tnt is on piston not moving
* gt 47: piston retracting, fuse=36, not moving, fallDistance=0, onGround=1
* gt 48: piston retracted, fuse=35, moving, falldistance=0.04, onGround=0
* gt 82: tnt still falling, fuse=1, falldistance=20.321312
* gt 83: explosion, blocks destroyed between 74 and 81. piston y=98 so start position was 99.
  total fall distance: 21.5 blocks.

So this tells us:

* TnT is primed the instant the wire turns on, at gt 4 with fuse 79
* The torch adds 2 game ticks, which was expected
* The piston keeps the block from falling for another 2 game ticks.


The fall height formula seems to be close to real life physics, except at the
start of the fall.

Then I found this: [Free fall trajectory of ignited TNT](https://www.reddit.com/r/Minecraft/comments/uesga/free_fall_trajectory_of_ignited_tnt/c4urv6y/)

    w(i) = 0.98000001907348633 * ( w(i-1) - 0.039999999105930328 )

Approximation formula with t in seconds:

	h = 40 t + 100 (exp(-0.4 t) - 1)

Observed Values:

1) v = 0.0392, d = 0.04
2) v = 0.0776159, d = 0.1192
3) v = 0.1152637, d = 0.236816
4) v = 0.1521584064, d = 0.39207698

last tick before explosion: v = 0.9935737, d = 20.321312
"""

# ╔═╡ 9a141ee8-4f95-11eb-1c37-252890b91ff8
function fallspeed(tick)
	v = 0
	for i = 1:tick
		v = 0.98(v + 0.04)
	end
	v
end

# ╔═╡ cfff4c78-4fa2-11eb-0403-b91a9254d8d9
fallspeed(0) + 0.04

# ╔═╡ 71d54792-4fa2-11eb-3f4b-19c943f0716f
0.1192 - fallspeed(1)

# ╔═╡ 09890444-4fa2-11eb-2f82-4362ae15c339
0.236816 - fallspeed(2) - fallspeed(1)

# ╔═╡ 897d2b3e-4fa3-11eb-1732-6d652fb6a0f4
0.39207698 - fallspeed(3) - fallspeed(2) - fallspeed(1)

# ╔═╡ 58028106-4fa5-11eb-0b4d-b1d2c4bb80d5
function falldistance(tick)
	v = 0
	h = 0.04
	for i = 1:tick
		v = 0.98(v + 0.04)
		h = h + v + 0.04
	end
    h
end

# ╔═╡ 1a0f8100-4fa5-11eb-21c6-c133ac52d6d3
falldistance(34)

# ╔═╡ f51f9564-4faa-11eb-3df3-2d69dbb6b7f5
falldistance(35)

# ╔═╡ b43783fc-4fa7-11eb-2621-1dc36cc2d017
md"""
So to get the exact fall distance, we observe the fuse 
timer of the TNT entity at the time it starts moving.

	data get entity @e[type=tnt,sort=nearest,limit=1]

The fallheight must be 0.04 - that is the correct time for the fuse reading.
`falldistance(fuse)` gives the fall distance.

For a push duper with piston and retracting piston the formula seems to be:

	falldistance(79 - 4 - delay)

where `delay` is the delay of the repeaters in game ticks.


For an 2 repeaters at 4 ticks,  the TNT starts moving at fuse timer 59.
The last reading at fuse 1 shows a fall height of 49.75, and the explosion
is centered at 51.5.
"""

# ╔═╡ 89a2b3fe-4faa-11eb-2223-7b22093dfdc9
falldistance(79 - 4 - 17)

# ╔═╡ b6e595e8-4fa8-11eb-2e88-43782f90bd86
falldistance(79 - 4 - 16)

# ╔═╡ 559a7562-5032-11eb-0867-493f01be985f
md"""#### Direct User Activation

If we leave out the initial repeater and power the redstone wire directly
with a lever, we get this:

* gt 0: wire activates but no tnt visible yet
* gt 1: tnt appears with fuse=79, falldistance 0
* gt 2: torch turns off, tnt fuse=78, fallDistance 0.04
* gt 40: tnt on piston, fuse=40, not moving, fallDistance 0
* gt 42: piston starts rectracting, tnt on piston not moving, fuse=38
* gt 44: piston finished retracting, tnt fuse=36, fallDistance 0.04
* gt 79: tnt fuse=1, fallDistance=21.35, fall speed -1.0129
* gt 80: tnt explodes, blocks between 73 and 80 are destroyed, estimated final
  fall distance 22.5 m

So if the user powers the lever directly, the TNT starts to fall with 1
game tick of extra fuse time

	falldistance(80 - 4 - delay)
"""

# ╔═╡ 62d2dcc2-5034-11eb-1d26-35f51a4d4b6a
falldistance(80 - 4 - 40)

# ╔═╡ bab928d4-505b-11eb-1b99-6d2cd0c47eeb
md"""
## Kades Duper with waterlogged trapdoor

A 4gt-signal goes to the duper, and through a 40gt delay to 
a sticky piston pushing an oberver that will trigger the trapdoor.

* gt 0: noteblock is activated by user
* gt 2: observer triggers 4gt repeater
* gt 6: repeater and wire to duper turns on
* gt 8: duper sticky piston has finished extracting
* gt 10: duper wire turns off, duper dupes TNT, fuse=79
* gt 14: first delay repeater turns on ... so 2 ticks of our delay go
  to compensate that the TNT is duped on the pull
* gt 22: tnt rests on trap door, y=97.19 instead of 99, fuse = 67
* gt 45: tnt rests on trap door, fuse = 44
* gt 46: last delay repeater turns on, fuse = 43
* gt 48: piston has pushed observer in place
* gt 50: observer fires, trapdoor opens. TNT fuse = 39, fall distance shows 0
  buy the y position has decreased and the fall speed is the magic -0.0392
* gt 88: tnt falling, fuse=1, fall height = 23.4937, y=72.61
* gt 89: explosion, blocks between 68 and 74 are destroyed, estimated final
  fall distance 26 m.

The fall height display in `data get entity` seems to be confused by
starting from 0.18 up on that trapdoor.  But subtracting the y-positions
gives the expected fall heights.

The edge detector/trap door costs as the same 4 game ticks as the torch/piston,
but the TNT is duped 4 game ticks later because it happens at the end of
the signal.

	falldistance(83 - 4 - delay)
"""

# ╔═╡ 19de1520-5060-11eb-135a-67e34bfeba40
97.19-72.61

# ╔═╡ 784ac918-505f-11eb-0f8d-37e7a01abe97
falldistance(38)

# ╔═╡ 5b054daa-5060-11eb-1d1f-e78a5b059e7d
falldistance(39)

# ╔═╡ 22026f02-505f-11eb-3a2f-99cc98cb86ee
97-middle(68,74)

# ╔═╡ f12b8d08-5060-11eb-038e-fd70a58c34a3
falldistance(83 - 4 - 40)

# ╔═╡ a864e0fa-5048-11eb-2adf-6730f3df2c03
md"""
## Dispenser with rectracting Piston

Again, a 4gt delay (because direct user input is handled differently),
then a torch, 40gt delay, piston.

* gt 4: wire activates
* gt 6: torch turns off
* gt 8: tnt appears, fuse = 79, falldistance 0
* gt 18: tnt on piston, fuse = 69, not moving, fall distance 0
* gt 45: tnt on piston, fuse = 42, not moving, fall distance 0
* gt 46: repeater turns off, piston starts retracting, fuse=41
* gt 48: piston finished retracting, tnt fuse=39, fall distance 0.04
* gt 86: fuse = 1, fall distance 24.57, fall speed 1.06859919
* gt 87: explosion, blocks between 69 and 77 are destroyed, estimated final
  fall distance 26m

So with a dispenser, the TNT appears 4 game ticks later than with
a TNT duper.  This means the TNT starts its final fall with a fuse time
of 39 game ticks.

	falldistance(83 - 4 - delay)
"""

# ╔═╡ cd5bcb62-5054-11eb-2212-29d4a5c144fc
99-middle(69,77)

# ╔═╡ 50f335d0-5055-11eb-0572-b3199c8ba14f
falldistance(38)

# ╔═╡ 746ae09e-5055-11eb-23fc-955f647f73f6
falldistance(39)

# ╔═╡ 790bf71e-5055-11eb-3e03-6b860d16624f
falldistance(83 - 4 - 40)

# ╔═╡ 0f2caa04-5056-11eb-2db7-87938403315e
md"""
#### Direct User Activation

With dispensers, the TNT appears 4gt after the wire activates, same as with a
repeater in between.  So for dispensers, there is no difference between
direct activation by the user vs. by a redstone circuit.

The TNT starts to fall with 39 game ticks fuse time left, resulting in an estimated
fall distance of 26.5m.
"""

# ╔═╡ 4975ce78-5067-11eb-0fe8-59b03f62ef00
md"""
## Dispenser with waterlogged trapdoor

Same timings as the Kades Duper with waterlogged trapdoor.

A dispenser primes TNT 4 game ticks later than a duper,
but the Kades Duper dupes at the end of the 4 gt signal.

Same timings as the dispenser with retracting piston.
"""

# ╔═╡ c6987062-4c7b-11eb-0e6e-07b4b5c61265
md"""## Data

* Set delay and let TNT fall
* Note type, delay, y-coord of TNT when retained, ycoords of remaining blocks
  around the destroyed ones - this is easier to take than the coords of
  the destroyed blocks, and we calculate the average anyway.
"""

# ╔═╡ a933096a-504f-11eb-160c-3fec20bf37fb
md"""
* myt-p: Mytteri Duper using retracting Piston. Delays shorter than 0.2 seconds
  will allow the TNT to fall through. 2.8 seconds or higher the delay circuit and/or
  duper will be damaged.
* kad-td: Kades Duper, delays shorter than 0.7s will allow the TNT to fall through.
  So max fallheight 60m. But you can explode blocks up right to the iron trapdoor.
  Hard to damage the circuit/duper (stay away from 4s delay though)
* disp-p: Dispenser and retracting piston. Delays shorter than 0.4 seconds will
  allow the TNT to fall through. 3.1 seconds or higher the delay circuit will
  be damaged.
* disp-td: Dispenser with water logged trap door. Same timings as dispenser
  with piston.
"""

# ╔═╡ fc7023ea-5049-11eb-06d3-7d28b15bfcd3
"create a function that plots the falldistance in seconds for the given max fuse game ticks"
function falldistance_by_delay(maxfuse)
	seconds -> falldistance(maxfuse - floor(20seconds))
end
	
	

# ╔═╡ dae8975a-5049-11eb-0f74-4f8aadd412fb
function middle_distance(start, min, max)
	start - middle(min, max)
end

# ╔═╡ c132f56a-5049-11eb-19ee-5968ba9ffff0
function add_falldistance!(df) 
	df.falldistance = middle_distance.(df.ystart, df.ymin, df.ymax)
	df
end

# ╔═╡ 0333eff2-4bb8-11eb-1929-417a3d17a089
data = add_falldistance!(CSV.File("tnt-fall-distance.csv") |> DataFrame)

# ╔═╡ 2871c0c6-4bba-11eb-1b14-3dd921964b83
begin
	p = plot(data, x=:delay, y=:falldistance, color=:type, shape=:type,
		# Theme(point_shapes=[Shape.circle, Shape.star1],
		Geom.point)
	push!(p, layer(falldistance_by_delay(79 - 4), 0, 4, color=[colorant"orange"]))
	push!(p, layer(falldistance_by_delay(83 - 4), 0, 4, color=[colorant"red"]))
	# draw(SVG("../assets/tnt-fall-distance/tnt-fall-distance.svg", 6inch, 4inch), p)
	# p
end

# ╔═╡ 240f8ae0-504c-11eb-0e18-1f91e7a50bdd
falldistance_by_delay(79 - 4)(2.0)

# ╔═╡ Cell order:
# ╟─5f8c842c-4f95-11eb-09ff-29fee65451f4
# ╠═9a141ee8-4f95-11eb-1c37-252890b91ff8
# ╠═cfff4c78-4fa2-11eb-0403-b91a9254d8d9
# ╠═71d54792-4fa2-11eb-3f4b-19c943f0716f
# ╠═09890444-4fa2-11eb-2f82-4362ae15c339
# ╠═897d2b3e-4fa3-11eb-1732-6d652fb6a0f4
# ╠═58028106-4fa5-11eb-0b4d-b1d2c4bb80d5
# ╠═1a0f8100-4fa5-11eb-21c6-c133ac52d6d3
# ╠═f51f9564-4faa-11eb-3df3-2d69dbb6b7f5
# ╟─b43783fc-4fa7-11eb-2621-1dc36cc2d017
# ╠═89a2b3fe-4faa-11eb-2223-7b22093dfdc9
# ╠═b6e595e8-4fa8-11eb-2e88-43782f90bd86
# ╟─559a7562-5032-11eb-0867-493f01be985f
# ╠═62d2dcc2-5034-11eb-1d26-35f51a4d4b6a
# ╟─bab928d4-505b-11eb-1b99-6d2cd0c47eeb
# ╠═19de1520-5060-11eb-135a-67e34bfeba40
# ╠═784ac918-505f-11eb-0f8d-37e7a01abe97
# ╠═5b054daa-5060-11eb-1d1f-e78a5b059e7d
# ╠═22026f02-505f-11eb-3a2f-99cc98cb86ee
# ╠═f12b8d08-5060-11eb-038e-fd70a58c34a3
# ╟─a864e0fa-5048-11eb-2adf-6730f3df2c03
# ╠═cd5bcb62-5054-11eb-2212-29d4a5c144fc
# ╠═50f335d0-5055-11eb-0572-b3199c8ba14f
# ╠═746ae09e-5055-11eb-23fc-955f647f73f6
# ╠═790bf71e-5055-11eb-3e03-6b860d16624f
# ╟─0f2caa04-5056-11eb-2db7-87938403315e
# ╟─4975ce78-5067-11eb-0fe8-59b03f62ef00
# ╟─c6987062-4c7b-11eb-0e6e-07b4b5c61265
# ╠═0333eff2-4bb8-11eb-1929-417a3d17a089
# ╠═2871c0c6-4bba-11eb-1b14-3dd921964b83
# ╟─a933096a-504f-11eb-160c-3fec20bf37fb
# ╠═ccf6af68-4bb4-11eb-2b1c-c9edc4b3dc51
# ╠═fc7023ea-5049-11eb-06d3-7d28b15bfcd3
# ╠═c132f56a-5049-11eb-19ee-5968ba9ffff0
# ╠═dae8975a-5049-11eb-0f74-4f8aadd412fb
# ╠═240f8ae0-504c-11eb-0e18-1f91e7a50bdd
