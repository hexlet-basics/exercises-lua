local function find_product(products, name)
-- BEGIN
    for _, product in ipairs(products) do
        if product.name == name then
            return product
        end
    end
    return nil
-- END
end

return find_product
