module Day1
export part1, part2

function read_calory_file(path::AbstractString)
    calories = Vector{Vector{Int}}()
    current_elf_calories = Vector{Int}()

    open(path, "r") do f
        for line in eachline(f)
            if isempty(line)
                push!(calories, copy(current_elf_calories))
                empty!(current_elf_calories)
            else
                push!(current_elf_calories, parse(Int, line))
            end
        end
    end

    calories
end

function part1()
    calories = read_calory_file("data/day1.txt")
    calories = map(sum, calories)
    maximum(calories)
end

function part2()
    calories = read_calory_file("data/day1.txt")
    calories = map(sum, calories)
    sort!(calories, rev=true)
    sum(calories[1:3])
end

end