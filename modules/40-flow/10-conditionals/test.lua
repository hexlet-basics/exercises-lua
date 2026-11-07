local test = require('test_helper')

local classify = test.load_function()
test.equal('negative', classify(-4))
test.equal('zero', classify(0))
test.equal('positive', classify(7))
test.equal('negative', classify(-0.5))
