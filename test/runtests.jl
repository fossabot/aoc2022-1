using Test

using AOC2022.Day1

cd("..")

@testset "Day1" begin
    @test Day1.part1() == 69626
    @test Day1.part2() == 206780
end