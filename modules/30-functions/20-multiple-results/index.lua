local function split_minutes(minutes)
-- BEGIN
    return minutes // 60, minutes % 60
-- END
end

return split_minutes
