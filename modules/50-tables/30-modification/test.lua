local test = require('test_helper')

local prepare_names = test.load_function()
local names = { 'Mira', 'Leo', 'Ada' }
test.equal('Ada, Bob, Leo', prepare_names(names, 'Bob'))
test.equal(3, #names)
test.equal('Ada', names[1])
test.equal('Bob', names[2])
test.equal('Leo', names[3])
test.equal('Zoe', prepare_names({ 'Ada' }, 'Zoe'))
test.equal('Ada, Ada', prepare_names({ 'Old', 'Ada' }, 'Ada'))
