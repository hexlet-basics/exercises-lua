local function apply_twice(operation, value)
-- BEGIN
    return operation(operation(value))
-- END
end

return apply_twice
