#!/bin/bash
# Create folder if it doesn't exist
mkdir -p ~/.rexlib

# Download the version-specific RexLib
curl -sL https://raw.githubusercontent.com/SebCodesHere/RexLib/1.0-1/rexlib.lua -o ~/.rexlib/rexlib.lua

echo "RexLib 1.0-1 installed to ~/.rexlib"