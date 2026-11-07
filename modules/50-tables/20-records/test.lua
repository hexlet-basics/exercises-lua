local test = require('test_helper')

local rename_user = test.load_function()
local user = { name = 'Mira', score = 12 }
local renamed = rename_user(user, 'Ada')
test.equal(user, renamed)
test.equal('Ada', user.name)
test.equal(12, user.score)
local another = { name = 'Old', active = false }
test.equal(another, rename_user(another, ''))
test.equal('', another.name)
test.equal(false, another.active)
