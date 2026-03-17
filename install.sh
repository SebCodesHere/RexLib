#!/bin/bash

VERSION="1.0-1"
GITHUB_URL="https://raw.githubusercontent.com/SebCodesHere/RexLib/1.0-1/rexlib.lua"
INSTALL_DIR="$HOME/.rexlib"

echo "Installing RexLib v$VERSION..."

# Create folder
mkdir -p "$INSTALL_DIR"

# Install LuaRocks if missing
if ! command -v luarocks >/dev/null 2>&1; then
    echo "LuaRocks not found, installing..."
    sudo rpm-ostree install luarocks
fi

# Download RexLib
curl -L -o "$INSTALL_DIR/rexlib.lua" "$GITHUB_URL"

# Generate rockspec on the fly
ROCKSPEC="$INSTALL_DIR/rexlib-$VERSION.rockspec"
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

# Install via LuaRocks
luarocks make "$ROCKSPEC"

echo "RexLib v$VERSION installed! You can now use require('rexlib') anywhere."