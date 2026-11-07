local test = require('test_helper')

local total_stock = test.load_function()
test.equal(5, total_stock({ apples = 3, pears = 2 }))
test.equal(0, total_stock({}))
test.equal(0, total_stock({ apples = 0 }))
test.equal(17, total_stock({ ['green apples'] = 7, pears = 4, plums = 6 }))
