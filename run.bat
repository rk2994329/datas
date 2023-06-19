@echo off
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/rk2994329/datas/main/urls.txt' -OutFile '%TEMP%\urls.txt'"
for /L %%i in (1,1,20) do (
  for /f "tokens=*" %%A in (%TEMP%\urls.txt) do (
    start msedge.exe -inprivate --start-maximized "%%A"
    timeout /t 5
    powershell -Command "$wshell = New-Object -ComObject WScript.Shell; $wshell.SendKeys('{END}');Start-Sleep -Seconds 5; $wshell.SendKeys('{HOME}'); Start-Sleep -Seconds 5; for ($i = 0; $i -lt 50; $i++){$wshell.SendKeys('{DOWN}');Start-Sleep -Seconds 3;}"
    taskkill /f /im msedge.exe
  )
)
