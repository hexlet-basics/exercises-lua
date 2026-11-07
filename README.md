# exercises-lua

[![Github Actions Status](https://github.com/hexlet-basics/exercises-lua/actions/workflows/Docker.yml/badge.svg)](https://github.com/hexlet-basics/exercises-lua/actions)

Lua 5.4 as a second programming language. The Russian course contains 25 lessons and assumes familiarity with functions, conditionals, loops, and collections.

## How to contribute

- Discuss the project on Telegram: <https://t.me/hexletcommunity/12>

## Develop

```bash
# setup
make
# run
make compose
# check
make ci-check

# run tests
make compose-test

# run linters and validators
make compose-code-lint
make compose-description-lint
make compose-schema-validate
```

The exercises use Lua's built-in assertions. To run their tests without Docker, install Lua 5.4 and run the following command from this repository.

```bash
make local-test
```

If another Lua version is the default, select the 5.4 interpreter explicitly.

```bash
make local-test LUA_BIN=/path/to/lua5.4
```

Solutions live in _index.lua_. The platform removes the region between `-- BEGIN` and `-- END` to prepare the learner's starter code. Function exercises keep a final `return` outside that region so the tests can load and call the submitted function. Tests use the shared helper in _lib/test_helper.lua_ through _bin/test.sh_. The modules exercise also includes a ready-to-use _pricing.lua_ fixture.

##

[![Hexlet Ltd. logo](https://raw.githubusercontent.com/Hexlet/assets/master/images/hexlet_logo128.png)](https://hexlet.io/?utm_source=github&utm_medium=link&utm_campaign=exercises-lua)

This repository is created and maintained by the team and the community of Hexlet, an educational project. [Read more about Hexlet](https://hexlet.io/?utm_source=github&utm_medium=link&utm_campaign=exercises-lua).
