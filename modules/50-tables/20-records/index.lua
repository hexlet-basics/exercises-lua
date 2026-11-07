local function rename_user(user, name)
-- BEGIN
    user.name = name
    return user
-- END
end

return rename_user
