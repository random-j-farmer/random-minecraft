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


# ╔═╡ 4fb079b8-4bc2-11eb-0635-d5ac22a078d8
function predicted_fallheight(delay)
	t = 4.1 - delay
	a = 9.81
	return a/2*t^2
end

# ╔═╡ e8dbdde4-4bb8-11eb-2647-75eeb50892c6
function fallHeight(yStart, yMin, yMax)
	min = yStart - yMin
	max = yStart - yMax
	return Statistics.middle(min, max)
end

# ╔═╡ b1c26158-4bb9-11eb-0d95-1b2e75f55bd0
function withFallHeight(df)
	df2 = DataFrame(df)
	df2.fallHeight = fallHeight.(df.yStart, df.yMin, df.yMax)
	return df2
end

# ╔═╡ 0333eff2-4bb8-11eb-1929-417a3d17a089
data = withFallHeight(CSV.File("tnt_fallheight.csv") |> DataFrame)

# ╔═╡ 2871c0c6-4bba-11eb-1b14-3dd921964b83
begin
	p = plot(data, x=:delay, y=:fallHeight, color=:type, Geom.point, Geom.line)
	push!(p, layer(predicted_fallheight, 0.1, 2.8, color=[colorant"red"]))
	# draw(SVG("fallheight.svg", 6inch, 4inch), p)
end

# ╔═╡ Cell order:
# ╠═ccf6af68-4bb4-11eb-2b1c-c9edc4b3dc51
# ╠═0333eff2-4bb8-11eb-1929-417a3d17a089
# ╠═2871c0c6-4bba-11eb-1b14-3dd921964b83
# ╠═4fb079b8-4bc2-11eb-0635-d5ac22a078d8
# ╠═e8dbdde4-4bb8-11eb-2647-75eeb50892c6
# ╠═b1c26158-4bb9-11eb-0d95-1b2e75f55bd0
