module Day1
export part1, part2

function read_calory_file(path::AbstractString)
    calories = Vector{Vector{Int}}()
    current_elf_calories = Vector{Int}()

    open(path, "r") do f
        for line in eachline(f)
            if isempty(line)
                push!(calories, current_elf_calories)
                current_elf_calories = Vector{Int}()
            else
                push!(current_elf_calories, parse(Int, line))
            end
        end
    end

    calories
end

function part1()
    read_calory_file("data/day1.txt") .|>
        sum |>
        maximum
end

function part2()
    calories = read_calory_file("data/day1.txt") .|>
        sum |>
        sort

    sum(calories[end - 2:end])
end

end