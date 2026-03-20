@echo off
setlocal enabledelayedexpansion
title RexLib Installer
color 0B

REM --- Universal user folder ---
set "INSTALL_DIR=%USERPROFILE%\.rexlib"

cls
echo ==================================
echo        RexLib Installer
echo ==================================
echo.

REM --- Clean up existing installation ---
if exist "%INSTALL_DIR%" (
    echo [*] Removing previous installation...
    rd /s /q "%INSTALL_DIR%"
)

echo [*] Installing RexLib v1.0.0...

REM --- Make folder ---
mkdir "%INSTALL_DIR%"

REM --- Simple loading bar ---
set /a total=20
for /L %%i in (1,1,%total%) do (
    set /a percent=(%%i*100/%total%)
    set "bar=####################"
    set "display_bar=!bar:~0,%%i!"
    cls
    echo ==================================
    echo        RexLib Installer
    echo ==================================
    echo.
    echo [*] Installing RexLib v1.0.0...
    echo.
    echo [!display_bar!] !percent!%%
    timeout /t 1 >nul
)

echo.
echo [*] Downloading components...

REM --- Download rexlib.lua ---
powershell -Command "Invoke-WebRequest 'https://raw.githubusercontent.com/SebCodesHere/RexLib/main/rexlib.lua' -OutFile '%INSTALL_DIR%\rexlib.lua'"

if %ERRORLEVEL%==0 (
    echo.
    echo [OK] Installed RexLib to %INSTALL_DIR%\rexlib.lua
    echo.
    echo Use in Lua scripts with:
    echo package.path = package.path .. ';%USERPROFILE%\.rexlib\?.lua'
    echo local rex = require('rexlib')
) else (
    echo.
    echo [ERROR] Download failed. Please check your internet connection.
)

pause