#!/bin/bash

VERSION="1.0.0"
URL="https://raw.githubusercontent.com/SebCodesHere/RexLib/main/rexlib.lua"
INSTALL_DIR="/RexLib"

clear
echo "=================================="
echo "        RexLib Installer"
echo "=================================="
echo
echo "[*] Installing RexLib v$VERSION..."

# Make folder if it doesn't exist
if [ ! -d "$INSTALL_DIR" ]; then
    sudo mkdir -p "$INSTALL_DIR"
fi

# Animated loading bar for 5 seconds
echo
echo "[*] Downloading..."
BAR="[                    ]"
for i in {1..20}; do
    sleep 0.25
    BAR="["
    for j in $(seq 1 $i); do BAR="${BAR}#"; done
    for j in $(seq $i 19); do BAR="${BAR} "; done
    BAR="${BAR}]"
    PERCENT=$((i*5))
    printf "\r%s %d%%" "$BAR" "$PERCENT"
done
echo
echo "[*] Fetching file..."

# Download the file
sudo curl -sL "$URL" -o "$INSTALL_DIR/rexlib.lua"

if [ $? -eq 0 ]; then
    echo "[✓] Installed RexLib to $INSTALL_DIR/rexlib.lua"
    echo
    echo "Use in Lua scripts with:"
    echo "package.path = package.path .. ';/RexLib/?.lua'"
    echo "require('rexlib')"
else
    echo "[X] Download failed"
fi