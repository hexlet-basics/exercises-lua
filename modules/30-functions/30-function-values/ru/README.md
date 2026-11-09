В Lua функцию можно сохранить в переменную и передать другой функции. В этом уроке мы отделим выбор операции от её применения.

```lua
local function double(value)
    return value * 2
end

local operation = double
print(operation(4)) -- 8
```

Присваивание `operation = double` копирует ссылку на функцию. Скобок после `double` нет, поэтому вычисление пока не выполняется. Позже вызов `operation(4)` запускает ту же функцию.

Функцию можно получить через параметр.

```lua
local function apply(operation, value)
    return operation(value)
end

print(apply(math.abs, -5)) -- 5
```

`apply` не знает, что именно делает операция. Она отвечает только за вызов с переданным значением. Такой параметр помогает использовать общий порядок действий с разными вычислениями.

Для короткой операции подходит анонимная функция. Выражение `function(value) return value + 3 end` создаёт функцию без отдельного имени.

```lua
local function apply(operation, value)
    return operation(value)
end

local result = apply(function(value)
    return value + 3
end, 7)
print(result) -- 10
```

Если передать `math.abs(-5)`, вызывающий код сначала вычислит результат `5`. Тогда `apply` получит число вместо функции.

```text
lua: index.lua:2: attempt to call a number value (local 'operation')
```

Передавайте имя без вызова, когда другая функция должна сама выбрать момент выполнения.
