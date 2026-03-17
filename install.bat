@echo off
setlocal

set VERSION=1.0-1
set INSTALL_DIR=%USERPROFILE%\.rexlib
set GITHUB_URL=https://raw.githubusercontent.com/SebCodesHere/RexLib/1.0-1/rexlib.lua

echo Installing RexLib %VERSION%...

if not exist "%INSTALL_DIR%" mkdir "%INSTALL_DIR%"

REM Check LuaRocks
where luarocks >nul 2>nul
if errorlevel 1 (
    echo LuaRocks not found. Please install LuaRocks first: https://luarocks.org/
    pause
    exit /b
)

REM Download rexlib.lua
powershell -Command "Invoke-WebRequest '%GITHUB_URL%' -OutFile '%INSTALL_DIR%\rexlib.lua'"

REM Generate rockspec
(
echo package = "rexlib"
echo version = "%VERSION%"
echo source = { url = "%GITHUB_URL%" }
echo description = { summary = "RexLib Lua utility functions", detailed = "RexLib provides utility functions: getTime, inpercent, clonetable", license = "Apache License 2.0" }
echo dependencies = {}
echo build = { type = "builtin", modules = { rexlib = "rexlib.lua" } }
) > "%INSTALL_DIR%\rexlib-%VERSION%.rockspec"

REM Install via LuaRocks
luarocks make "%INSTALL_DIR%\rexlib-%VERSION%.rockspec"

echo RexLib v%VERSION% installed! You can now use require("rexlib") anywhere.
pause