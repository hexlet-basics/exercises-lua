local function sum_arguments(...)
-- BEGIN
    local arguments = table.pack(...)
    local total = 0
    for index = 1, arguments.n do
        local value = arguments[index]
        if value ~= nil then
            total = total + value
        end
    end
    return total, arguments.n
-- END
end

return sum_arguments
