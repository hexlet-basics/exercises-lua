local function order_total(price, count, delivery)
-- BEGIN
    local pricing = require('pricing')
    return pricing.total(price, count) + delivery
-- END
end

return order_total
