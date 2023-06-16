$wshell = New-Object -ComObject WScript.Shell
$wshell.SendKeys('{PGDN}')
Start-Sleep -Seconds 1
$wshell.SendKeys('{PGDN}')
