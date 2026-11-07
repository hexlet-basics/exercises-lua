local function count_doublings(limit)
-- BEGIN
    local value, steps = 1, 0
    while value < limit do
        value = value * 2
        steps = steps + 1
    end
    return value, steps
-- END
end

return count_doublings
