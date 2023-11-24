@echo off
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/rk2994329/datas/main/urls.txt' -OutFile '%TEMP%\urls.txt'"
set /a num=%random% %% 10 + 15
for /L %%i in (1,1,%num%) do (
  for /f "tokens=*" %%A in (%TEMP%\urls.txt) do (
    start msedge.exe --start-maximized -inprivate "%%A"
    timeout /t 5
    powershell -Command "$wshell = New-Object -ComObject WScript.Shell; $wshell.AppActivate('Microsoft Edge'); $wshell.SendKeys('{END}'); Start-Sleep -Seconds 3; $wshell.SendKeys('{HOME}'); Start-Sleep -Seconds 5; for ($i = 0; $i -lt ((Get-Random -Minimum 10 -Maximum 20)); $i++){$wshell.SendKeys('{DOWN}');Start-Sleep -Seconds (Get-Random -Minimum 1 -Maximum 5);}"
  )
  taskkill /f /im msedge.exe
  if errorlevel 1 (
    echo Edge not found!.
  ) else ( echo Edge closed )
  timeout /t 5
)
