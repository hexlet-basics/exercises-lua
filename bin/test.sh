#!/usr/bin/env bash
set -euo pipefail

test_bin_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
export LUA_PATH="$test_bin_dir/../lib/?.lua;;"
exec "${LUA_BIN:-lua}" test.lua
