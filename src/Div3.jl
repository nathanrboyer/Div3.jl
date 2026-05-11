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

module KM620

include("KM620_notebook.jl")

end #module

module KD232

include("KD232_notebook.jl")

end #module

include("KD4.jl")

end
