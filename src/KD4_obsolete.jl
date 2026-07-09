module KD4 #from ASME pressure vessel code 2025 editiion

"""thickness target from KD-412(b)"""
thickness_target(Ai, Acr, t) = min(0.25 * t , Ai + 0.25 * (Acr - Ai))

"""KD-430 stress intensity factor ratio"""
Rk(K1min, K1max, K1res) = (K1min + K1res) / (K1max + K1res)

"""Table KD-430 Room-Temperature Crack Growth Rate Factors,
assuming yield greater than 90 ksi"""
function crack_growth_constants()
C0 = 1.95e-10 # in/cycle (ksi*in^1/2)^-m
m = 3.26 
G = 6.4
H = 0.85
I = 5.5
return (; C0, m, G, H, I)
end

"""KD-430(d) C must be corrected when not at room temperature"""
temp_correction(C0, E0, Eop, m) = C0 * (E0 / Eop) ^ m

"""Table KD-431 Crack Growth Rate Factors, assuming yield greater than 90 ksi"""
function frk(Rk, m)
    C2 = 1.5
    C3 = 3.53
    if 0 ≤ Rk < 1
        return 1 + C3 * Rk
    elseif Rk < 0
        return (C2 / (C2 - Rk)) ^ m
    end
end

"""KD-430 Crack growth rate, in/cycle, applicable to da/dN & dc/dN, not dl/dN"""
dxdn(C, frk, ΔK, m) = C * frk * ΔK ^ m

"""KD-430(b) ΔKth to check for zero growth condition"""
ΔKth(G, H, Rk, I) = max(2, min(G * (1 - H * Rk), I))

end #end module KD4