FROM hexletbasics/base-image:latest

# Luacheck runs on Debian's Lua 5.4; learner code runs on Lua 5.5 below.
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
        lua5.4 liblua5.4-dev luarocks build-essential \
  && rm -rf /var/lib/apt/lists/*

RUN luarocks --lua-version=5.4 install luacheck 1.2.0-1 LUA_INCDIR=/usr/include/lua5.4

# Lua 5.5.1 from the official repository, pinned to its release commit.
ARG LUA_COMMIT=7579fc9d7ed90240487251dfb69168f8e64e9294
RUN curl -fsSL --retry 3 "https://api.github.com/repos/lua/lua/tarball/${LUA_COMMIT}" -o /tmp/lua.tar.gz \
  && echo '0191415994d9e6a9852b48016b9692ecd3bc3f951f03f95dfff581ab747dd370  /tmp/lua.tar.gz' | sha256sum --check \
  && mkdir /tmp/lua \
  && tar -xzf /tmp/lua.tar.gz -C /tmp/lua --strip-components=1 \
  && make -C /tmp/lua -j2 \
  && install -m 755 /tmp/lua/lua /usr/local/bin/lua5.5 \
  && ln -s lua5.5 /usr/local/bin/lua \
  && lua -v \
  && rm -rf /tmp/lua /tmp/lua.tar.gz

WORKDIR /exercises-lua

COPY . .

ENV PATH=/exercises-lua/bin:$PATH
