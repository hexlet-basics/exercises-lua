local function sum_prices(prices)
-- BEGIN
    local total = 0
    for _, price in ipairs(prices) do
        total = total + price
    end
    return total
-- END
end

return sum_prices
