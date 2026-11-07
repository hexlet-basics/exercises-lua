local function scoped_value(start)
-- BEGIN
    local value = start
    local inner
    do
        local value = value + 5 -- luacheck: ignore 421
        inner = value
    end
    return inner, value
-- END
end

return scoped_value
