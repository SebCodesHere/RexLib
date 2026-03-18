@echo off
title RexLib Installer
color 0B

REM --- Universal user folder ---
set INSTALL_DIR=%USERPROFILE%\.rexlib

cls
echo ==================================
echo        RexLib Installer
echo ==================================
echo.
echo [*] Installing RexLib v1.0.0...

REM --- Make folder if it doesn't exist ---
if not exist "%INSTALL_DIR%" (
    mkdir "%INSTALL_DIR%"
)

REM --- Simple loading bar for 5 seconds ---
set /a total=20
echo.
for /L %%i in (1,1,%total%) do (
    set /a percent=(%%i*100/%total%)
    set bar=####################
    set "bar=!bar:~0,%%i!                    "
    <nul set /p ="[!bar!] !percent!%%"
    timeout /t 0.25 >nul
    echo.
)
echo.

REM --- Download rexlib.lua ---
powershell -Command "Invoke-WebRequest 'https://raw.githubusercontent.com/SebCodesHere/RexLib/main/rexlib.lua' -OutFile '%INSTALL_DIR%\rexlib.lua'"

if %ERRORLEVEL%==0 (
    echo.
    echo [✓] Installed RexLib to %INSTALL_DIR%\rexlib.lua
    echo.
    echo Use in Lua scripts with:
    echo package.path = package.path .. ';%USERPROFILE%\.rexlib\?.lua'
    echo require('rexlib')
) else (
    echo [X] Download failed
)

pause