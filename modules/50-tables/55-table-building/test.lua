local test = require('test_helper')

local count_items = test.load_function()
local items = { 'Tea', 'Coffee', 'Tea' }
local counts = count_items(items)
test.equal(2, counts.Tea)
test.equal(1, counts.Coffee)
test.equal(nil, counts.Water)
test.equal(3, #items)
test.equal('Tea', items[1])
test.equal('Coffee', items[2])
test.equal('Tea', items[3])

local empty = {}
local result = count_items(empty)
test.equal('table', type(result))
test.equal(false, result == empty)
local field_count = 0
for _ in pairs(result) do
    field_count = field_count + 1
end
test.equal(0, field_count)

counts = count_items({ 'Tea', 'tea', '', 'green apples', '' })
test.equal(1, counts.Tea)
test.equal(1, counts.tea)
test.equal(2, counts[''])
test.equal(1, counts['green apples'])
field_count = 0
for _ in pairs(counts) do
    field_count = field_count + 1
end
test.equal(4, field_count)
