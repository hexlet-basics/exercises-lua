local test = require('test_helper')

local apply_twice = test.load_function()
test.equal(12, apply_twice(function(value) return value + 1 end, 10))
test.equal(12, apply_twice(function(value) return value * 2 end, 3))
test.equal(-4, apply_twice(function(value) return value end, -4))
