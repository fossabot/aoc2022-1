module Day2
export part1, part2

abstract type Shape end
struct Rock <: Shape end
struct Paper <: Shape end
struct Scissors <: Shape end

Base.Integer(T::Type{<:Shape}) = Integer(T())
Base.Integer(::Rock) = 1
Base.Integer(::Paper) = 2
Base.Integer(::Scissors) = 3

abstract type Move end
struct Lose <: Move end
struct Win <: Move end
struct Draw <: Move end

function read_strategy_file(path::AbstractString)
    strategy = Vector{Tuple{Char, Char}}()

    open(path, "r") do f
        for line in eachline(f)
            m1, m2 = split(line, " ")
            push!(strategy, (m1[1], m2[1]))
        end
    end

    strategy
end

function expand(f)
    fn(args) = f(args...)
    return fn
end

score(::Rock, ::Rock) = 3
score(::Rock, ::Paper) = 6
score(::Rock, ::Scissors) = 0

score(::Paper, ::Rock) = 0
score(::Paper, ::Paper) = 3
score(::Paper, ::Scissors) = 6

score(::Scissors, ::Rock) = 6
score(::Scissors, ::Paper) = 0
score(::Scissors, ::Scissors) = 3

pickmove(::Rock, ::Lose) = Scissors()
pickmove(::Rock, ::Draw) = Rock()
pickmove(::Rock, ::Win) = Paper()

pickmove(::Paper, ::Lose) = Rock()
pickmove(::Paper, ::Draw) = Paper()
pickmove(::Paper, ::Win) = Scissors()

pickmove(::Scissors, ::Lose) = Paper()
pickmove(::Scissors, ::Draw) = Scissors()
pickmove(::Scissors, ::Win) = Rock()

round_score(opponent::Shape, player::Shape) = score(opponent, player) + Integer(player)

function part1_translate_strategy(opponent::Char, player::Char)
    opponent_moves = Dict(
        'A' => Rock(),
        'B' => Paper(),
        'C' => Scissors()
    )

    player_moves = Dict(
        'X' => Rock(),
        'Y' => Paper(),
        'Z' => Scissors()
    )

    (opponent_moves[opponent], player_moves[player])
end

function part1()
    read_strategy_file("data/day2.txt") .|>
        expand(part1_translate_strategy) .|>
        expand(round_score) |>
        sum
end

function part2_translate_strategy(opponent::Char, player::Char)
    opponent_moves = Dict(
        'A' => Rock(),
        'B' => Paper(),
        'C' => Scissors()
    )

    player_moves = Dict(
        'X' => Lose(),
        'Y' => Draw(),
        'Z' => Win()
    )

    (opponent_moves[opponent], player_moves[player])
end

function part2()
    read_strategy_file("data/day2.txt") .|>
        expand(part2_translate_strategy) .|>
        (moves -> (moves[1], pickmove(moves...))) .|>
        expand(round_score) |>
        sum
end

end