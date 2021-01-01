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
# ╟─c6987062-4c7b-11eb-0e6e-07b4b5c61265
# ╠═0333eff2-4bb8-11eb-1929-417a3d17a089
# ╠═d3ce77da-4c6b-11eb-06f1-3b3fe0336774
# ╠═fc426582-4c45-11eb-2753-49447703d95c
# ╠═2871c0c6-4bba-11eb-1b14-3dd921964b83
# ╠═4fb079b8-4bc2-11eb-0635-d5ac22a078d8
# ╠═05ac7008-4c6f-11eb-280f-a99751dc7b9a
# ╠═e8dbdde4-4bb8-11eb-2647-75eeb50892c6
# ╠═b1c26158-4bb9-11eb-0d95-1b2e75f55bd0
