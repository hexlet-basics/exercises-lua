local function sum_odds(limit)
-- BEGIN
    local total = 0
    for number = 1, limit, 2 do
        total = total + number
    end
    return total
-- END
end

return sum_odds
