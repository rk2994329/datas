@echo off
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/rk2994329/datas/main/urls.txt' -OutFile '%TEMP%\urls.txt'"
for /f "tokens=*" %%A in (%TEMP%\urls.txt) do (
    start chrome --incognito "%%A"
    timeout /t 5
    powershell -Command "$wshell = New-Object -ComObject WScript.Shell; for ($i = 0; $i -lt 10; $i++) { $wshell.SendKeys('{DOWN}'); Start-Sleep -Seconds 1; } for ($i = 0; $i -lt 5; $i++) { $wshell.SendKeys('{PGDN}'); Start-Sleep -Seconds 1; $wshell.SendKeys('{END}'); }"
)
