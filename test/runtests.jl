using Test

using AOC2022.Day1
using AOC2022.Day2
using AOC2022.Day3

cd("..")

@testset "Day1" begin
    @test Day1.part1() == 69626
    @test Day1.part2() == 206780
end

@testset "Day2" begin
    @test Day2.part1() == 11767
    @test Day2.part2() == 13886
end

@testset "Day3" begin
    @test Day3.part1() == 7727
    @test Day3.part2() == 2609
end