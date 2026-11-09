Lua позволяет остановить вычисление ошибкой и перехватить её на выбранной границе. В этом уроке мы сравним результат `nil, message` с ошибкой и обработаем вызов через `pcall`.

Некоторые функции сообщают об ожидаемой неудаче обычными результатами. Например, `tonumber('text')` возвращает `nil`. Собственная функция может дополнительно вернуть сообщение. Вызывающий код сам проверяет такой результат.

```lua
local function parse_price(text)
    local price = tonumber(text)
    if price == nil then
        return nil, 'price must be a number'
    end
    return price
end

local price, message = parse_price('free')
print(price) -- nil
print(message) -- price must be a number
```

`error(message)` прерывает выполнение. По умолчанию в сообщение добавляется расположение вызова. Если нужен заранее определённый текст без префикса, можно указать уровень `0`.

```lua
local function positive(value)
    if value <= 0 then
        error('positive value expected', 0)
    end
    return value
end
```

`assert(condition, message)` тоже вызывает ошибку, если первый аргумент равен `false` или `nil`. Например, `assert(tonumber('text'), 'number expected')` остановит вычисление.

Защищённый вызов `pcall` принимает функцию и её аргументы. При успехе он возвращает `true` и результаты функции. При ошибке он возвращает `false` и значение ошибки.

```lua
local function positive(value)
    if value <= 0 then
        error('positive value expected', 0)
    end
    return value
end

local ok, result = pcall(positive, -1)
print(ok) -- false
print(result) -- positive value expected
```

Значением ошибки бывает не только строка. `error` принимает любое значение, например таблицу, и `pcall` вернёт её без изменений.

```lua
local problem = { code = 404 }
local ok, value = pcall(error, problem)
print(ok) -- false
print(value.code) -- 404
```

Важно передать саму функцию. Запись `pcall(positive(-1))` сначала вызовет `positive` без защиты.

На внешней границе можно перевести ошибку в соглашение `nil, message`, сохранив детали для вызывающего кода. При этом проверяется флаг `ok`, поскольку успешный результат функции сам может быть равен `false` или `nil`.
