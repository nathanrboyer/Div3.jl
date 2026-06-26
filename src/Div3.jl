"""
    Package Div3 v$(pkgversion(Div3))

A collection of equations from The American Society of Mechanical Engineers (ASME)
Boiler and Pressure Vessel Code (BPVC) Section VIII Division 3 (Div3).
This package is intended to be used as a dependency of other data processing packages.
Equations are organized into modules named by their source location in Division 3.
The equations may be viewed in rendered form by opening their `src/*_notebook.jl` file with Pluto.jl
or by opening their exported `*_notebook.html` file in your web browser.
"""
module Div3

module KM6
include("KM6.plutojl")
end  # module KM6

module KD2
include("KD2.plutojl")
end  # module KD2

module KD4
include("KD4.plutojl")
end  # module KD4
include("KD4.jl")
include("KD2.jl")

end  # module Div3
