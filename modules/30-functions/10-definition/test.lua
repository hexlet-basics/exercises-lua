local test = require('test_helper')

local total_price = test.load_function()
test.equal(30, total_price(10, 3))
test.equal(0, total_price(15, 0))
test.equal(0, total_price(0, 4))
test.equal(12.5, total_price(2.5, 5))
