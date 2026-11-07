local test = require('test_helper')

local find_product = test.load_function()
local tea = { name = 'Tea', price = 250 }
local coffee = { name = 'Coffee', price = 400 }
local other_tea = { name = 'Tea', price = 300 }
local products = { tea, coffee, other_tea }
test.equal(tea, find_product(products, 'Tea'))
test.equal(coffee, find_product(products, 'Coffee'))
test.equal(nil, find_product(products, 'Water'))
test.equal(nil, find_product(products, 'tea'))
test.equal(nil, find_product({}, 'Tea'))
