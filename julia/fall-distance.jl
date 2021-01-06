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
md"""
## Push Duper V2

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
	h = 0.04
	for i = 1:tick
		v = 0.98(v + 0.04)
	end
	return v
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
	return h
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
md"""### Direct User Activation

If we leave out the initial repeater and power the redstone wire directly
with a lever, we get this:

* gt 0: wire activates but no tnt visible yet
* gt 1: tnt appears with fuse=79, falldistance 0
* gt 2: torch turns off, tnt fuse=79, fallDistance 0.04
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

# ╔═╡ c6987062-4c7b-11eb-0e6e-07b4b5c61265
md"""## Data

* Set delay and let TNT fall
* Note type, delay, y-coord of TNT when retained, ycoords of remaining blocks
  around the destroyed ones - this is easier to take than the coords of
  the destroyed blocks, and we calculate the average anyway.
"""

# ╔═╡ fc426582-4c45-11eb-2753-49447703d95c
# CSV.write("../_data/tnt_fall_distance.csv", data)

# ╔═╡ 4fb079b8-4bc2-11eb-0635-d5ac22a078d8
function predicted_falldistance(delay)
	t = 4.1 - delay
	a = 9.81
	return a/2*t^2
end

# ╔═╡ 05ac7008-4c6f-11eb-280f-a99751dc7b9a
function predicted_falldistance_dispenser(delay)
	t = 4.4 - delay
	a = 9.81
	return a/2*t^2
end

# ╔═╡ d3ce77da-4c6b-11eb-06f1-3b3fe0336774
xxx = predicted_falldistance_dispenser(2.0)

# ╔═╡ e8dbdde4-4bb8-11eb-2647-75eeb50892c6
function middle_distance(ystart, ymin, ymax)
	min = ystart - ymin
	max = ystart - ymax
	return middle(min, max)
end

# ╔═╡ b1c26158-4bb9-11eb-0d95-1b2e75f55bd0
function add_falldistance!(df)
	df.falldistance = middle_distance.(df.ystart, df.ymin, df.ymax)
	return df
end

# ╔═╡ 0333eff2-4bb8-11eb-1929-417a3d17a089
data = add_falldistance!(CSV.File("tnt-fall-distance.csv") |> DataFrame)

# ╔═╡ 2871c0c6-4bba-11eb-1b14-3dd921964b83
begin
	p = plot(data, x=:delay, y=:falldistance, color=:type, shape=:type,
		# Theme(point_shapes=[Shape.circle, Shape.star1],
		Geom.point, Geom.line)
	push!(p, layer(predicted_falldistance, 0.1, 4, color=[colorant"orange"]))
	push!(p, layer(predicted_falldistance_dispenser, 0.1, 4, color=[colorant"red"]))
	# draw(SVG("../assets/tnt-fall-distance/tnt-fall-distance.svg", 6inch, 4inch), p)
	# p
end

# ╔═╡ Cell order:
# ╠═ccf6af68-4bb4-11eb-2b1c-c9edc4b3dc51
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
# ╠═c6987062-4c7b-11eb-0e6e-07b4b5c61265
# ╠═0333eff2-4bb8-11eb-1929-417a3d17a089
# ╠═d3ce77da-4c6b-11eb-06f1-3b3fe0336774
# ╠═fc426582-4c45-11eb-2753-49447703d95c
# ╠═2871c0c6-4bba-11eb-1b14-3dd921964b83
# ╠═4fb079b8-4bc2-11eb-0635-d5ac22a078d8
# ╠═05ac7008-4c6f-11eb-280f-a99751dc7b9a
# ╠═e8dbdde4-4bb8-11eb-2647-75eeb50892c6
# ╠═b1c26158-4bb9-11eb-0d95-1b2e75f55bd0
