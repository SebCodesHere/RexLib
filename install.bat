@echo off
echo ============================
echo       RexLib Installer
echo ============================
echo [i] Install v1.0.0 (stable)
echo [u] Update to latest version
set /p choice=Choose (i/u): 

set INSTALL_DIR=%USERPROFILE%\.rexlib
mkdir "%INSTALL_DIR%"

:: TAG-specific stable
set STABLE_URL=https://raw.githubusercontent.com/SebCodesHere/RexLib/v1.0.0/rexlib.lua
set LATEST_URL=https://raw.githubusercontent.com/SebCodesHere/RexLib/main/rexlib.lua

if "%choice%"=="i" (
    echo Installing RexLib v1.0.0...
    powershell -Command "Invoke-WebRequest -Uri %STABLE_URL% -OutFile '%INSTALL_DIR%\rexlib.lua'"
) else if "%choice%"=="u" (
    echo Updating RexLib to latest from main...
    powershell -Command "Invoke-WebRequest -Uri %LATEST_URL% -OutFile '%INSTALL_DIR%\rexlib.lua'"
) else (
    echo Invalid option.
    pause
    exit /b
)

:: Add INSTALL_DIR to LUA_PATH
setx LUA_PATH "%INSTALL_DIR%\?.lua;%LUA_PATH%"
echo Done! Restart your terminal or editor to use RexLib everywhere.
pause