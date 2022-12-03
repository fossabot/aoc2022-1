module Day3
export part1, part2

function priority(letter::Char)
    if 'a' <= letter <= 'z'
        return Int(letter) - 96
    end

    Int(letter) - 38
end

function part1()
    readlines("data/day3.txt") .|>
        (line -> intersect(first(line, length(line) ÷ 2), last(line, length(line) ÷ 2))) |>
        Iterators.flatten .|>
        priority |>
        sum
end

function part2()
    lines = readlines("data/day3.txt")
    total = 0

    for i in 1:3:length(lines)
        total += intersect(lines[i], lines[i + 1], lines[i + 2]) |>
            Iterators.flatten .|>
            priority |>
            sum
    end

    total
end

end