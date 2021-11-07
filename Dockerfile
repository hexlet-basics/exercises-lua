FROM hexletbasics/base-image:latest

RUN apt-get update && apt-get install -y lua5.4 luarocks
RUN rm /usr/bin/lua
RUN ln -s /usr/bin/lua5.4 /usr/bin/lua

RUN luarocks install busted
RUN luarocks install stdlib
RUN luarocks install luacheck

WORKDIR /exercises-lua

COPY . .

ENV PATH /exercises-lua/bin:$PATH
