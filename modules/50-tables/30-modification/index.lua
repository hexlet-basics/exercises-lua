local function prepare_names(names, new_name)
-- BEGIN
    table.remove(names, 1)
    table.insert(names, new_name)
    table.sort(names)
    return table.concat(names, ', ')
-- END
end

return prepare_names
