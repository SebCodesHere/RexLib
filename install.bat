@echo off
title RexLib Installer
color 0B

REM --- Home folder definition ---
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

REM --- Make folder and hide it ---
mkdir "%INSTALL_DIR%" >nul 2>&1
attrib +h "%INSTALL_DIR%"

echo [*] Downloading components...

REM --- Download rexlib.lua ---
powershell -Command "Invoke-WebRequest 'https://raw.githubusercontent.com/SebCodesHere/RexLib/main/rexlib.lua' -OutFile '%INSTALL_DIR%\rexlib.lua'"

if %ERRORLEVEL%==0 (
    echo [✓] Installed RexLib to %INSTALL_DIR%\rexlib.lua
) else (
    echo.
    echo [X] Download failed. Please check your internet connection. Maybe installed just check idk .bat just lags. 
)

echo.
pause