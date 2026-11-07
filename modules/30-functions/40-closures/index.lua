local function make_counter(start)
-- BEGIN
    local count = start
    return function()
        count = count + 1
        return count
    end
-- END
end

return make_counter
