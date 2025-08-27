FROM hexletbasics/base-image:latest

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
        lua5.4 luarocks \
  && rm -f /usr/bin/lua \
  && ln -s /usr/bin/lua5.4 /usr/bin/lua \
  && rm -rf /var/lib/apt/lists/*

  # Установка необходимых luarocks-пакетов
  RUN luarocks install busted \
  && luarocks install stdlib \
  && luarocks install luacheck

WORKDIR /exercises-lua

COPY . .

ENV PATH=/exercises-lua/bin:$PATH
