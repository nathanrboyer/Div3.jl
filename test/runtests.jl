using Div3
using Test

@testset "Div3.jl" begin
    @test Div3.KD2.D_ϵt(1, 2) == 3
    @test Div3.KD2.R(1, 2) == 0.5
    @test Div3.KD4.a_final(1, 2, 1) == 0.25
    @test Div3.KD4.a_final(0.1, 0.2, 1) == 0.125
    @test Div3.KM6.R(1, 2) == 0.5
    @test Div3.KM6.coefficients_table[1, 1] == "Ferritic steel"
end
