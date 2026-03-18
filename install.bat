@echo off
title RexLib Installer
color 0B
setlocal enabledelayedexpansion

cls
echo ==================================
echo        RexLib Installer
echo ==================================
echo.

echo [*] Installing RexLib v1.0.0...
echo.

if not exist "%USERPROFILE%\.rexlib" (
    mkdir "%USERPROFILE%\.rexlib"
)

echo [*] Downloading RexLib...
echo.

set bar=
set count=0

for /L %%i in (1,1,20) do (
    set /a count+=5
    set bar=!bar!#

    cls
    echo ==================================
    echo        RexLib Installer
    echo ==================================
    echo.
    echo [*] Installing RexLib v1.0.0...
    echo.
    echo [*] Downloading RexLib...
    echo.
    echo [!bar!                    ] !count!%%
    
    timeout /t 0 >nul
    ping -n 2 localhost >nul
)

echo.

powershell -Command "try { Invoke-WebRequest 'https://raw.githubusercontent.com/SebCodesHere/RexLib/1.0.0/rexlib.lua' -OutFile $env:USERPROFILE\.rexlib\rexlib.lua -ErrorAction Stop; exit 0 } catch { exit 1 }"

if %errorlevel%==0 (
    echo [✓] Download complete
    echo [✓] Installed to %USERPROFILE%\.rexlib
    echo.
    echo RexLib is ready to use!
) else (
    echo [X] Download failed
)

echo.
pause