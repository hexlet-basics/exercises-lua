FROM hexletbasics/base-image:latest

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
        lua5.4 liblua5.4-dev luarocks build-essential \
  && rm -f /usr/bin/lua \
  && ln -s /usr/bin/lua5.4 /usr/bin/lua \
  && rm -rf /var/lib/apt/lists/*

RUN luarocks --lua-version=5.4 install luacheck

WORKDIR /exercises-lua

COPY . .

ENV PATH=/exercises-lua/bin:$PATH
