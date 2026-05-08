### A Pluto.jl notebook ###
# v0.20.24

using Markdown
using InteractiveUtils

# ╔═╡ 619c6125-0c6b-4e77-a18d-2c968e33037c
# ╠═╡ show_logs = false
# ╠═╡ skip_as_script = true
#=╠═╡
begin
	import Pkg
	Pkg.activate(Base.current_project(@__DIR__))
	Pkg.instantiate()
	Text("Project environment is active.")
end
  ╠═╡ =#

# ╔═╡ ef4910c0-a5c8-11ef-0e00-67a503735431
begin
	using Latexify, LaTeXStrings, DataFrames, CSV, PrettyTables, HypertextLiteral
	Text("Packages are loaded.")
end

# ╔═╡ e2e76d7e-4f29-455e-af81-07fe6cf85a5a
md"""
### Verification
These equations last checked to ASME BPVC **2023 Edition**.  \
*Nathan Boyer -- 11/18/2024*
"""

# ╔═╡ 4285f1b7-e25a-448c-bae0-c6bc46a17ee4
md"""
The below Division 3 equations are confirmed identical to those of Division 2 Annex 3-D.3,
so the resulting stress-strain curves may be used for material definitions in either division.
"""

# ╔═╡ 8bc6ee92-c578-4b2e-a20b-43ed649948b5
md"# KM-620 Equations"

# ╔═╡ f0835c74-19ee-4f61-a404-609f276ca4a4
md"### KM-620.1 & KM-620.2"

# ╔═╡ 5fbeed8f-4279-424c-bff1-8960959d2f6f
md"### KM-620.3"

# ╔═╡ ed1d2741-baed-4198-82d8-64555f05644d
md"### KM-620.4"

# ╔═╡ 23812ed3-866e-46ed-b48c-d4f67c41649c
md"### KM-620.5"

# ╔═╡ 8a35c22a-549b-4ec7-87c1-692f773d2068
md"### KM-620.6"

# ╔═╡ 76f93bf0-8ca3-4d64-bbe6-2d3006514aca
md"### KM-620.7"

# ╔═╡ b8e933ad-9680-4a1e-a249-cf91b6b0e373
md"### KM-620.8"

# ╔═╡ 85c844ba-4f27-412a-bca8-6738e1867c47
md"### KM-620.9"

# ╔═╡ 01a856b5-3ba0-4b16-94a4-a7adeb8acaac
md"### KM-620.10"

# ╔═╡ 7fef3dfd-448d-4c6f-a8e4-a249ad5525ac
md"### KM-620.11"

# ╔═╡ 2e8b892a-9d42-4553-910e-80c5c2eddc0d
md"### KM-620.12"

# ╔═╡ c7bcff9e-6bb9-4d38-8445-ed72abbdae5b
md"### KM-620.13"

# ╔═╡ 0f093f85-ef1d-4821-bdfe-a16260a0a3a6
md"### KM-620.14"

# ╔═╡ 93102e28-4501-4193-ade0-fb072ef86b46
md"# Table KM-620"

# ╔═╡ d939d0b7-e7c8-454c-93e7-8bf45e7f62a4
md"# Nomenclature"

# ╔═╡ 47820a10-9b8c-44a6-a82a-2c45cfef835a
md"""
### Mandatory Appendix 1

``A_1`` = curve fitting constant for the elastic region of the stress-strain curve (KM-620)

``A_2`` = curve fitting constant for the plastic region of the stress-strain curve (KM-620)

``E_y`` = modulus of elasticity evaluated at the temperature of interest, see ASME Section II Part D

``El`` = minimum specified elongation, %

``H`` = undefined

``K`` = undefined

``m_1`` = undefined

``m_2`` = value calculated from Table KM-620

``m_3`` = value calculated from Table KM-620

``m_4`` = value calculated from Table KM-620

``m_5`` = value listed in Table KM-620

``R`` = Sy/Su

``RA`` = minimum specified reduction of area, %

``γ_1`` = true strain in the micro-strain region of the stress-strain curve (KM-620)

``γ_2`` = true strain in the macro-strain region of the stress-strain curve (KM-620)

``ϵ_p`` = stress-strain curve fitting parameter (KM-620)

``ϵ_{ts}`` = true total strain (KM-620)

``ϵ_{ys}`` = 0.2% engineering offset strain (KM-620)

``ϵ_1`` = true plastic strain in the micro-strain region of the stress-strain curve (KM-620)

``ϵ_2`` = true plastic strain in the macro-strain region of the stress-strain curve (KM-620)

``σ_t`` = true stress at which the true strain will be evaluated (KM-620)

``σ_{uts}`` = engineering ultimate tensile stress evaluated at the temperature of interest (KM-620)

``σ_{ys}`` = engineering yield stress evaluated at the temperature of interest (KM-620)

``σ_{utst}`` = true ultimate tensile stress evaluated at the true ultimate tensile strain
"""

# ╔═╡ 1e41aea5-2635-4a56-89bd-29f0d6e25b78
md"# Appendix"

# ╔═╡ a383af0b-ffa0-4789-9f2b-62fcd8040c18
Text("Document is widened.")

# ╔═╡ 412c95b6-6067-46c4-ab61-406e0cce7cba
# ╠═╡ skip_as_script = true
#=╠═╡
# Reference: https://discourse.julialang.org/t/pluto-pdf-and-printing/65055/5
html"""
<style>
body:not(.fake_class) main {
	max-width: 54%;
	margin-right: 0px;
	align-self: center;
}
</style>
"""
  ╠═╡ =#

# ╔═╡ 93572273-f1c1-4076-8dec-e9275cec3c05
md"### Function Definitions"

# ╔═╡ f4d3823d-9b6f-4a42-b39a-dc1bb78be91c
"Removes the function argument list from the latex equation,
so equations are shorter and better match the source text."
function remove_arguments(s::LaTeXString)
    r = r"\\left\(.*?\\right\)|\(\)"
    return LaTeXString(replace(s, r=>"", count=1))
end

# ╔═╡ 66f1020d-4491-4540-b07f-5c11c183e503
remove_arguments(
	@latexrun ϵ_ts(σ_t, E_y, γ_1, γ_2, ϵ_p) = begin
	    if (γ_1 + γ_2) <= ϵ_p
	        return σ_t / E_y
	    else
	        return σ_t / E_y + γ_1 + γ_2
	    end
	end
)

# ╔═╡ faaaaeb0-e798-4869-9a6d-cca959e0401c
remove_arguments(
	@latexrun γ_1(ϵ_1, H) = ϵ_1 / 2 * (1 - tanh(H))
)

# ╔═╡ 9b5401a3-cb5e-42c1-9c17-b0086cdcc60a
remove_arguments(
	@latexrun γ_2(ϵ_2, H) = ϵ_2 / 2 * (1 + tanh(H))
)

# ╔═╡ 47c29b41-3382-4cd8-b165-91903139b16c
remove_arguments(
	@latexrun ϵ_1(σ_t, A_1, m_1) = (σ_t / A_1)^(1 / m_1)
)

# ╔═╡ 2a7b5561-91ba-40d0-ad0f-8ea1ea9a2fcb
remove_arguments(
	@latexrun A_1(σ_ys, ϵ_ys, m_1) = σ_ys * (1 + ϵ_ys) / (log(1 + ϵ_ys))^m_1
)

# ╔═╡ fb8e0ead-43ee-4a9d-88d5-363a23b5162a
remove_arguments(
	@latexrun m_1(R, ϵ_p, ϵ_ys) = (log(R) + (ϵ_p - ϵ_ys)) / log(log(1+ϵ_p)/log(1+ϵ_ys))
)

# ╔═╡ d8614d40-c361-4277-8821-cf28f94137bc
remove_arguments(
	@latexrun ϵ_2(σ_t, A_2, m_2) = (σ_t / A_2)^(1 / m_2)
)

# ╔═╡ 167fce64-c40e-4509-b591-1329559c498e
remove_arguments(
	@latexrun A_2(σ_uts, m_2) = (σ_uts * exp(m_2)) / (m_2^m_2)
)

# ╔═╡ b30a4bc4-fc99-45ee-b930-07d510f7a7fd
remove_arguments(
	@latexrun H(σ_t, σ_ys, σ_uts, K) = 2 * (σ_t - (σ_ys + K * (σ_uts - σ_ys))) / (K * (σ_uts - σ_ys))
)

# ╔═╡ 9dbde7d9-67e9-4f0f-ac75-a8291df094d1
remove_arguments(
	@latexrun R(σ_ys, σ_uts) = σ_ys / σ_uts
)

# ╔═╡ 81b456bc-d721-40d2-bf5e-3deaccc9bd8e
remove_arguments(
	@latexrun ϵ_ys() = 0.002
)

# ╔═╡ 36f0a2bc-2cda-44ef-85ed-5bf5296005ea
remove_arguments(
	@latexrun K(R) = 1.5*R^1.5 - 0.5*R^2.5 - R^3.5
)

# ╔═╡ 1ea3bc14-bdb0-4153-9029-bfc4b7e04042
remove_arguments(
	@latexrun σ_utst(σ_uts, m_2) = σ_uts * exp(m_2)
)

# ╔═╡ dd643d77-994f-4fa0-85b4-6f7d82acc6db
"""
    plasticity(u, p)

A function in the form required to construct NonlinearSolve.jl's `IntervalNonlinearProblem`.
It will be used to find the value of `σ_t` which yields `(γ_1 + γ_2) == ϵ_p`.
This is the point defining the proportional limit and the start of plasticity `(ϵ_p, σ_p)`.

The return value is the difference between the calculated plastic strain `γ_total`
and the proportional limit `ϵ_p`.
The root (zero-crossing) of this function will be solved for in the [ASME_Materials.jl](https://github.com/nathanrboyer/ASME_Materials.jl) package
to determine the start of the plastic stress-strain curve as defined by KM-620.
Note that the proportional limit `σ_p` determined with this method
is usually significantly lower than the material yield stress `σ_ys`
and is a more accurate starting point for the plastic stress-strain curve.

# Arguments
- `u`: some value of `σ_t`
- `p`: material parameters; must contain the following fields (which do not depend on `σ_t`):
    - `σ_ys`
    - `σ_uts`
    - `K`
    - `m_1`
    - `m_2`
    - `A_1`
    - `A_2`
    - `ϵ_p`
"""
function plasticity(u, p)
    σ_t = u                                          # Solution Variable
    (; σ_ys, σ_uts, K, m_1, m_2, A_1, A_2, ϵ_p) = p  # Parameters
    H_value   = H(σ_t, σ_ys, σ_uts, K)               # KM-620.10
    ϵ_1_value = ϵ_1(σ_t, A_1, m_1)                   # KM-620.5
    ϵ_2_value = ϵ_2(σ_t, A_2, m_2)                   # KM-620.8
    γ_1_value = γ_1(ϵ_1_value, H_value)              # KM-620.3
    γ_2_value = γ_2(ϵ_2_value, H_value)              # KM-620.4
    return γ_1_value + γ_2_value - ϵ_p  # (<= 0)     # KM-620.2
end

# ╔═╡ 1610beb1-974e-4e60-85b6-274a3b6ffb5f
"""
    expr2func(expr::Expr, var::Symbol) -> func::Function

Creates an anonymous function from an expression `expr`.
`var` must match the variable used in `expr`
and be the only variable used in `expr`.

# Examples
```julia-repl
julia> f = expr2func(:(z + 2), :z)
#1 (generic function with 1 method)

julia> f(3)
5
```
"""
function expr2func(expr::Expr, var::Symbol)
    func = eval(:($var -> $expr))
end

# ╔═╡ 9fcd1dba-86ab-49d1-b7e7-260c77c4558b
"""
	print_table_notes(df; keyleft="", keyright="")

Return the data frame metadata as a markdown string.
Optional `keyleft`, `keyright`, `valleft`, and `valright` parameters allow markdown
format characters to be placed to the left and right of the header and metadata.
"""
function print_table_notes(df; keyleft = "*", keyright = ":*", valleft = "*", valright = "*")
	io = IOBuffer()
	for (key, value) in metadata(df)
		print(io, keyleft)
		print(io, key)
		println(io, keyright)
		println(io, "")
		if typeof(value) <: AbstractVector
			for element in value
				print(io, valleft)
				print(io, element)
				println(io, valright)
			end
		else
			print(io, valleft)
			print(io, value)
			println(io, valright)
		end
	end
	return Markdown.parse(seekstart(io))
end

# ╔═╡ 93e8f1a6-adc5-4938-8d6a-c1d3a0ac6939
begin
	ln_to_log(s::AbstractString) = replace(s, "ln(" => "log(")
	ln_to_log(s) = s;  # Do nothing if not a string.

	"""
	    ln_to_log(s)
	
	Julia uses log(x) for natural logarithm.
	There is no `ln` function, so must transform strings containing ln() to use log() instead.
	If input is not a string, then input is returned as is.
	"""
	ln_to_log
end

# ╔═╡ 3f247fd9-d3b0-4405-8e16-0d4230afd3aa
"""
    parse_table_KM620(path::AbstractString)

Read Table KM-620 from CSV file `path` into a DataFrame and parse the functions into expressions.
"""
function parse_table_KM620(path::AbstractString)
    df = DataFrame(CSV.File(path))
    transform!(df, All() .=> ByRow(ln_to_log), renamecols=false)
    transform!(df, "m₂" => ByRow(Meta.parse), renamecols=false)
    transform!(df, "m₃" => ByRow(Meta.parse), renamecols=false)
    transform!(df, "m₄" => ByRow(Meta.parse), renamecols=false)
    metadata!(
		df,
		"NOTES",
		[
			"1. Ferritic steel includes carbon, low alloy, and alloy steels, and ferritic, martensitic, and iron-based age-hardening stainless steels.",
		],
		style=:note,
	)
    return df
end

# ╔═╡ 9ff5d8bb-f266-4783-ab6e-fc19580f5a56
begin
	const katex_imports = @htl """
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/katex.min.css" integrity="sha384-nB0miv6/jRmo5UMMR1wu3Gz6NLsoTkbqJghGIsx//Rlm+ZU03BU6SQNC66uf4l5+" crossorigin="anonymous">
		<script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/katex.min.js" integrity="sha384-7zkQWkzuo3B5mTepMUcHkMB5jZaolc2xDwL6VFqjFALcbeS9Ggm/Yr2r3Dy4lfFg" crossorigin="anonymous"></script>
		<script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/contrib/auto-render.min.js" integrity="sha384-43gviWU0YVjaDtb/GhzOouOXtZMP/7XUzwPTstBeZFe/+rCMvRwr4yROQP43s0Xk" crossorigin="anonymous"
		onload="renderMathInElement(document.body);"></script>
	"""
	
	"""
		render_math(html_showable_object)
	
	Uses [KaTeX](https://katex.org/) to render `LatexString`'s within an HTML object.
	Function was provided by `fonsp` [here](https://github.com/ronisbr/PrettyTables.jl/issues/251#issuecomment-2488540185).
	"""
	function render_math(html_showable_object)
		@htl """
		$(katex_imports)
		<div>
		$(html_showable_object)
	
		<script>
		console.log(currentScript.parentElement)
		window.renderMathInElement(currentScript.parentElement, {
			delimiters: [
	              {left: '\$', right: '\$', display: true},
			],
			preProcess: str => str.replaceAll("\\\\\\\\", "\\\\"),
		})
		</script>
		</div>
		"""
	end
end

# ╔═╡ 77a3138d-3703-4f07-a6c1-d8e7fdb86273
"""
    beautify(df::DataFrame)

Improve readability of Table KM-620.
"""
function beautify(df::DataFrame)
    bdf = copy(df)
    for col in names(bdf) # latexify all expressions
        if eltype(bdf[!, col]) === Expr
			transform!(bdf, col => ByRow(latexify), renamecols=false)
        end
    end
    header = [L"Material", L"Max.\ Temp.", L"m_2", L"m_3", L"m_4", L"m_5", L"\epsilon_p"]
	pt = pretty_table(
		HTML,
		bdf,
		header = header,
		alignment = [:l, :r, :r, :c, :c, :c, :c],
	)
    return render_math(pt)
end

# ╔═╡ e15c132b-6fc9-44a1-9cc6-aa0e5dab86a4
begin
	const coefficients_table_for_printing = parse_table_KM620(normpath(@__FILE__, "..", "..", "data", "Table KM-620.csv"))
	beautify(coefficients_table_for_printing)
end

# ╔═╡ bdf3cbcd-aa2f-45de-ab10-746b793052d9
print_table_notes(coefficients_table_for_printing)

# ╔═╡ 299fcd18-4463-41b9-a316-82668202a3d5
const coefficients_table = transform(
    coefficients_table_for_printing,
    "m₂" => ByRow(x->expr2func(x,:R)),
    "m₃" => ByRow(x->expr2func(x,:El)),
    "m₄" => ByRow(x->expr2func(x,:RA)),
    renamecols=false,
);

# ╔═╡ Cell order:
# ╟─e2e76d7e-4f29-455e-af81-07fe6cf85a5a
# ╟─4285f1b7-e25a-448c-bae0-c6bc46a17ee4
# ╟─8bc6ee92-c578-4b2e-a20b-43ed649948b5
# ╟─f0835c74-19ee-4f61-a404-609f276ca4a4
# ╟─66f1020d-4491-4540-b07f-5c11c183e503
# ╟─5fbeed8f-4279-424c-bff1-8960959d2f6f
# ╟─faaaaeb0-e798-4869-9a6d-cca959e0401c
# ╟─ed1d2741-baed-4198-82d8-64555f05644d
# ╟─9b5401a3-cb5e-42c1-9c17-b0086cdcc60a
# ╟─23812ed3-866e-46ed-b48c-d4f67c41649c
# ╟─47c29b41-3382-4cd8-b165-91903139b16c
# ╟─8a35c22a-549b-4ec7-87c1-692f773d2068
# ╟─2a7b5561-91ba-40d0-ad0f-8ea1ea9a2fcb
# ╟─76f93bf0-8ca3-4d64-bbe6-2d3006514aca
# ╟─fb8e0ead-43ee-4a9d-88d5-363a23b5162a
# ╟─b8e933ad-9680-4a1e-a249-cf91b6b0e373
# ╟─d8614d40-c361-4277-8821-cf28f94137bc
# ╟─85c844ba-4f27-412a-bca8-6738e1867c47
# ╟─167fce64-c40e-4509-b591-1329559c498e
# ╟─01a856b5-3ba0-4b16-94a4-a7adeb8acaac
# ╟─b30a4bc4-fc99-45ee-b930-07d510f7a7fd
# ╟─7fef3dfd-448d-4c6f-a8e4-a249ad5525ac
# ╟─9dbde7d9-67e9-4f0f-ac75-a8291df094d1
# ╟─2e8b892a-9d42-4553-910e-80c5c2eddc0d
# ╟─81b456bc-d721-40d2-bf5e-3deaccc9bd8e
# ╟─c7bcff9e-6bb9-4d38-8445-ed72abbdae5b
# ╟─36f0a2bc-2cda-44ef-85ed-5bf5296005ea
# ╟─0f093f85-ef1d-4821-bdfe-a16260a0a3a6
# ╟─1ea3bc14-bdb0-4153-9029-bfc4b7e04042
# ╟─93102e28-4501-4193-ade0-fb072ef86b46
# ╟─e15c132b-6fc9-44a1-9cc6-aa0e5dab86a4
# ╟─bdf3cbcd-aa2f-45de-ab10-746b793052d9
# ╟─299fcd18-4463-41b9-a316-82668202a3d5
# ╟─d939d0b7-e7c8-454c-93e7-8bf45e7f62a4
# ╟─47820a10-9b8c-44a6-a82a-2c45cfef835a
# ╟─1e41aea5-2635-4a56-89bd-29f0d6e25b78
# ╟─619c6125-0c6b-4e77-a18d-2c968e33037c
# ╟─ef4910c0-a5c8-11ef-0e00-67a503735431
# ╟─a383af0b-ffa0-4789-9f2b-62fcd8040c18
# ╟─412c95b6-6067-46c4-ab61-406e0cce7cba
# ╟─93572273-f1c1-4076-8dec-e9275cec3c05
# ╟─f4d3823d-9b6f-4a42-b39a-dc1bb78be91c
# ╟─dd643d77-994f-4fa0-85b4-6f7d82acc6db
# ╟─1610beb1-974e-4e60-85b6-274a3b6ffb5f
# ╟─3f247fd9-d3b0-4405-8e16-0d4230afd3aa
# ╟─77a3138d-3703-4f07-a6c1-d8e7fdb86273
# ╟─9fcd1dba-86ab-49d1-b7e7-260c77c4558b
# ╟─93e8f1a6-adc5-4938-8d6a-c1d3a0ac6939
# ╟─9ff5d8bb-f266-4783-ab6e-fc19580f5a56
