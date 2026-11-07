local function total_stock(stock)
-- BEGIN
    local total = 0
    for _, count in pairs(stock) do
        total = total + count
    end
    return total
-- END
end

return total_stock
