begin
	# cd(dir) 
	# environment of notebook file used by default
	import Pkg
	Pkg.activate(".")
	using Gadfly
	using CSV
	using DataFrames
	using PlutoUI
end
