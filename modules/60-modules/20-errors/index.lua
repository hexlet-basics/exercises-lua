local function safe_call(operation, value)
-- BEGIN
    local ok, result = pcall(operation, value)
    if not ok then
        return nil, result
    end
    return result
-- END
end

return safe_call
