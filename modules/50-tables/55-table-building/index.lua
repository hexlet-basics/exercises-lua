local function count_items(items)
-- BEGIN
    local counts = {}
    for _, name in ipairs(items) do
        counts[name] = (counts[name] or 0) + 1
    end
    return counts
-- END
end

return count_items
