local test = require('test_helper')

local order_total = test.load_function()
test.equal(75, order_total(20, 3, 15))
test.equal(0, order_total(0, 0, 0))
test.equal(10, order_total(30, 0, 10))
test.equal(26, order_total(12, 2, 2))

local original = package.loaded.pricing
package.loaded.pricing = { total = function() return 1000 end }
local with_module = test.load_function()
test.equal(1005, with_module(3, 4, 5))
package.loaded.pricing = original
