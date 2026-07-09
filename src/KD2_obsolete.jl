module KD2 #from ASME pressure vessel code 2025 editiion

Y(OD, ID) = OD / ID

function Kut(σy, σuts)
    if σy / σuts ≤ 0.7
        return 0.95
    elseif 0.7 < σy / σuts ≤ 0.9
        return 1.244 - 0.42 * (σy / σuts)
    else # >0.9
        return 0.866
    end
end

function Pdmax_open(Kut, σy, σuts, Y)
    term1 = 0.0
    term2 = 0.0
    for j in eachindex(Y)
        factor = Y[j]^0.268 - 1
        term1 += 2.986 * Kut[j] * σy[j] * factor
        term2 += 1.0773 * (σy[j] + σuts[j]) * factor
    end
    return min(term1, term2)
end

function Pdmax_closed(Kut, σy, σuts, Y)
    term1 = 0.0
    term2 = 0.0
    for j in eachindex(Y)
        factor = log(Y[j])
        term1 += 0.924 * Kut[j] * σy[j] * factor
        term2 += (1/3) * (σy[j] + σuts[j]) * factor
    end
    return min(term1, term2)
end

"""liner_lbb() finds if the shell qualifies for the leak before burst condition below:
KD-412.2 Vessels with Two or More Layers
(a) For vessels with two or more layers, the final crack depth in the inner layer may be
equal to the layer thickness, provided the theoretical collapse pressure (1.732 times the
value calculated in KD-221.2) of the combined remaining layers is at least 20% higher
than the design pressure of the unflawed vessel. 

Otherwise, the allowable final crack depth shall not exceed 25% of the inner layer thickness.

The theoretical collapse pressure of the combined remaining layers shall be calculated using
the inside diameter of the innermost of the remaining layers as the pressure loading diameter."""
function liner_lbb(user_inputs)
    (; Pd, ODref, OD, σy, σuts, open_end) = user_inputs
    Y_shell = Y(OD, ODref) 
    Kut_shell = Kut.(σy, σuts)
    if open_end
        Pdmax = Pdmax_open(Kut_shell, σy, σuts, Y_shell)
    else
        Pdmax = Pdmax_closed(Kut_shell, σy, σuts, Y_shell)
    end
    return 1.732 * Pdmax > 1.2 * Pd #Boolean
end

end #end of KD2 module