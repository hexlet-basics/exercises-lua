local test = require('test_helper')

local sum_odds = test.load_function()
test.equal(25, sum_odds(9))
test.equal(25, sum_odds(10))
test.equal(1, sum_odds(1))
test.equal(0, sum_odds(0))
test.equal(9, sum_odds(5))
