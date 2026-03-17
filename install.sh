#!/bin/bash

VERSION="1.0-1"
GITHUB_TAG="1.0-1"
INSTALL_DIR="$HOME/.rexlib"
GITHUB_URL="https://raw.githubusercontent.com/SebCodesHere/RexLib/$GITHUB_TAG/rexlib.lua"

echo "Installing RexLib v$VERSION..."

# create and go into install dir
mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR" || exit 1

# download rexlib.lua
curl -L -O "$GITHUB_URL"

# generate rockspec with exact name LuaRocks expects
ROCKSPEC="rexlib-$VERSION.rockspec"
cat > "$ROCKSPEC" <<EOL
package = "rexlib"
version = "$VERSION"
source = { url = "$GITHUB_URL" }
description = {
  summary = "RexLib Lua utility functions",
  detailed = [[
      RexLib provides utility functions:
      - getTime()
      - inpercent(value,maxvalue)
      - clonetable(TableName)
  ]],
  license = "Apache License 2.0"
}
dependencies = {}
build = {
  type = "builtin",
  modules = { rexlib = "rexlib.lua" }
}
EOL

# install via LuaRocks locally
luarocks make "$ROCKSPEC" --local

echo "RexLib v$VERSION installed locally! You can now use require('rexlib') anywhere."