local code = 'lua.2026'

-- BEGIN
local position = string.find(code, '.', 1, true)
print(position)
local normalized = string.gsub(code, '%.', '-')
print(string.upper(normalized))
-- END
