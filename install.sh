#!/bin/bash

# Colors
GREEN="\033[1;32m"
CYAN="\033[1;36m"
RESET="\033[0m"

clear

echo -e "${CYAN}"
echo "=================================="
echo "        RexLib Installer"
echo "=================================="
echo -e "${RESET}"

echo -e "${CYAN}[*] Installing RexLib v1.0.0...${RESET}"
echo

mkdir -p ~/.rexlib

echo -e "${CYAN}[*] Downloading RexLib...${RESET}"
echo

# Loading bar (5 sec, animated)
bar=""
for i in {1..20}; do
    percent=$((i * 5))
    bar="${bar}#"
    
    printf "\r[%-20s] %d%%" "$bar" "$percent"
    sleep 0.25
done

echo
echo

# Actual download
if curl -sL https://raw.githubusercontent.com/SebCodesHere/RexLib/1.0.0/rexlib.lua -o ~/.rexlib/rexlib.lua; then
    echo -e "${GREEN}[✓] Download complete${RESET}"
    echo -e "${GREEN}[✓] Installed to ~/.rexlib${RESET}"
    echo
    echo -e "${GREEN}RexLib is ready to use!${RESET}"
else
    echo "[X] Download failed"
fi