В этом уроке мы изучим ошибки и защищённый вызов через `pcall`. Сравним прерывание вычисления с возвратом `nil` и сообщения. Научимся обрабатывать неудачный вызов и сохранять успешные результаты `false` и `nil`.

Ошибка прерывает выполнение функции. Защищённый вызов позволяет перехватить её и вернуть управление вызывающему коду. Он нужен на границе операции, после неудачи которой программа должна продолжить работу.

`pcall` принимает саму функцию и её аргументы. При ошибке он возвращает `false` и значение ошибки. Если вычисление успешно, он возвращает `true` и результаты функции.

Предположим, программа получает операцию проверки числа. Операция вызывает `error`, если число не положительное. Вызывающий код хочет получить сообщение об ошибке и обработать его.

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

`error(message)` прерывает выполнение. По умолчанию в сообщение добавляется расположение вызова. Уровень `0` оставляет заранее определённый текст без префикса, как в примере.

```lua
local function positive(value)
    if value <= 0 then
        error('positive value expected', 0)
    end
    return value
end

local ok, result = pcall(positive, 5)
print(ok) -- true
print(result) -- 5
```

Запись `pcall(positive(-1))` сначала вызовет `positive` без защиты. Поэтому первым аргументом передаётся имя функции без вызова.

Значением ошибки бывает не только строка. Например, операция может вернуть через ошибку таблицу с кодом проблемы. `pcall` сохранит эту таблицу.

```lua
local problem = { code = 404 }
local ok, value = pcall(error, problem)
print(ok) -- false
print(value.code) -- 404
```

Вызов `error` передаёт таблицу `problem` как значение ошибки. `pcall` возвращает `false` в `ok` и ту же таблицу в `value`, поэтому поле `value.code` содержит `404`. При обработке ошибки можно прочитать её поля без преобразования в строку.

Вспомогательная функция `assert(condition, message)` тоже вызывает ошибку, если первый аргумент равен `false` или `nil`. Она подходит для короткой проверки обязательного условия. Например, проверим, что вход удалось преобразовать в число.

```lua
local ok, message = pcall(assert, tonumber('text'), 'number expected')
print(ok) -- false
print(message) -- number expected
```

В этом примере `pcall` вызывает саму `assert` в защищённом режиме. Сообщение об ошибке возвращается в `message`.

## Ожидаемая неудача как результат

Некоторые функции сообщают об ожидаемой неудаче обычными результатами. Например, `tonumber('text')` возвращает `nil`. Собственная функция может дополнительно вернуть сообщение, которое проверит вызывающий код.

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

Здесь `parse_price` завершилась обычным возвратом. Для такой проверки `pcall` не требуется. Соглашение `nil, message` удобно, когда неудача ожидаема и вызывающий код готов её разобрать.

На внешней границе можно перевести ошибку в это соглашение, сохранив детали для вызывающего кода. При этом проверяется флаг `ok`, поскольку успешный результат функции сам может быть равен `false` или `nil`.

```lua
local function disabled()
    return false
end

local ok, result = pcall(disabled)
print(ok) -- true
print(result) -- false
```

Вызов `disabled` завершился успешно. Отрицательное значение `result` относится к результату операции и не заменяет флаг `ok`.
