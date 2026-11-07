local test = require('test_helper')

local sum_prices = test.load_function()
local prices = { 10, 20, 30 }
test.equal(60, sum_prices(prices))
test.equal(3, #prices)
test.equal(10, prices[1])
test.equal(20, prices[2])
test.equal(30, prices[3])
test.equal(0, sum_prices({}))
test.equal(0, sum_prices({ 0, 0 }))
test.equal(4, sum_prices({ 1.5, 2.5 }))
