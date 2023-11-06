@echo off

powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/rk2994329/datas/main/urls.txt' -OutFile '%TEMP%\urls.txt'"

set /a num=%random% %% 10 + 15

for /L %%i in (1,1,%num%) do (
  for /f "tokens=*" %%A in (%TEMP%\urls.txt) do (
    start chrome.exe "%%A"
    timeout /t 5
    powershell -Command "$wshell = New-Object -ComObject WScript.Shell; $wshell.AppActivate('Google Chrome'); $wshell.SendKeys('{END}'); Start-Sleep -Seconds 3; $wshell.SendKeys('{HOME}'); Start-Sleep -Seconds 5; for ($i = 0; $i -lt ((Get-Random -Minimum 15 -Maximum 25)); $i++){$wshell.SendKeys('{DOWN}');Start-Sleep -Seconds (Get-Random -Minimum 1 -Maximum 8);}"
  )
  taskkill /f /im chrome.exe
  if errorlevel 1 (
    echo Chrome not found!
  ) else (
    echo Chrome closed
  )
  timeout /t 5
)
