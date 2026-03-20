#!/bin/bash

VERSION="1.0.0"
URL="https://raw.githubusercontent.com/SebCodesHere/RexLib/main/rexlib.lua"
# Use $HOME for a local, non-root installation
INSTALL_DIR="$HOME/.rexlib"

clear
echo "=================================="
echo "        RexLib Installer"
echo "=================================="
echo

# --- Clean up existing installation ---
if [ -d "$INSTALL_DIR" ]; then
    echo "[*] Cleaning up old version at $INSTALL_DIR..."
    rm -rf "$INSTALL_DIR"
fi

echo "[*] Installing RexLib v$VERSION..."

# Create the directory (no sudo needed now!)
mkdir -p "$INSTALL_DIR"

# --- Animated loading bar ---
for i in {1..20}; do
    PERCENT=$((i * 5))
    BAR=$(printf "%${i}s" | tr ' ' '#')
    printf "\r[*] Progress: [%-20s] %d%%" "$BAR" "$PERCENT"
    sleep 0.05
done
echo -e "\n[*] Fetching file..."

# --- Download the file ---
curl -sL "$URL" -o "$INSTALL_DIR/rexlib.lua"

if [ $? -eq 0 ]; then
    echo -e "\n[✓] Installed RexLib to $INSTALL_DIR/rexlib.lua"
    echo
    echo "Use in Lua scripts with:"
    echo "package.path = package.path .. ';$HOME/.rexlib/?.lua'"
    echo "local rex = require('rexlib')"
else
    echo -e "\n[X] Download failed. Please check your connection."
fi