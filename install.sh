#!/bin/bash
echo "============================"
echo "      RexLib Installer       "
echo "============================"
echo "[i] Install v1.0.0 (stable)"
echo "[u] Update to latest version"
read -p "Choose (i/u): " choice

INSTALL_DIR="$HOME/.rexlib"
mkdir -p "$INSTALL_DIR"

# TAG-specific stable
STABLE_URL="https://raw.githubusercontent.com/SebCodesHere/RexLib/v1.0.0/rexlib.lua"
LATEST_URL="https://raw.githubusercontent.com/SebCodesHere/RexLib/main/rexlib.lua"

if [ "$choice" == "i" ]; then
    echo "Installing RexLib v1.0.0..."
    curl -sL "$STABLE_URL" -o "$INSTALL_DIR/rexlib.lua"
elif [ "$choice" == "u" ]; then
    echo "Updating RexLib to latest from main..."
    curl -sL "$LATEST_URL" -o "$INSTALL_DIR/rexlib.lua"
else
    echo "Invalid option."
    exit 1
fi

# Add INSTALL_DIR to LUA_PATH if not already there
if ! grep -q "$INSTALL_DIR/?.lua" "$HOME/.bashrc"; then
    echo "export LUA_PATH=\"$INSTALL_DIR/?.lua;;\"" >> "$HOME/.bashrc"
    echo "Added $INSTALL_DIR to LUA_PATH"
fi

echo "Done! Restart terminal or run 'source ~/.bashrc' to use RexLib everywhere."