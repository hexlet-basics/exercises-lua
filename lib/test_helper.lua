local test = {}

assert(_VERSION == 'Lua 5.5', 'These exercises require Lua 5.5, got ' .. _VERSION)

-- Stop accidental infinite loops in a submitted solution.
debug.sethook(function()
    error('Execution limit exceeded. Check your loop condition.', 0)
end, '', 1000000)

function test.equal(expected, actual)
    assert(expected == actual, string.format(
        'Expected %s (%s), got %s (%s)',
        tostring(expected), type(expected), tostring(actual), type(actual)
    ))
end

function test.load()
    local lines = {}
    local environment = setmetatable({
        print = function(...)
            local values = table.pack(...)
            for index = 1, values.n do
                values[index] = tostring(values[index])
            end
            lines[#lines + 1] = table.concat(values, '\t', 1, values.n) .. '\n'
        end,
    }, { __index = _G })
    local chunk = assert(loadfile('index.lua', 't', environment))
    local result = chunk()
    return result, environment, table.concat(lines)
end

function test.output(expected)
    local _, _, actual = test.load()
    test.equal(expected, actual)
end

function test.load_function()
    local result, environment = test.load()
    assert(type(result) == 'function',
        'Expected a function from index.lua. Keep the final return with the function name.')
    return result, environment
end

return test
