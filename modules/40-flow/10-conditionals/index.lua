local function classify(number)
-- BEGIN
    if number == nil then
        return 'missing'
    end

    if number < 0 then
        return 'negative'
    elseif number == 0 then
        return 'zero'
    else
        return 'positive'
    end
-- END
end

return classify
