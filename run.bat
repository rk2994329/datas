@echo off
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/yourusername/yourrepo/master/urls.txt' -OutFile '%TEMP%\urls.txt'"
for /f "tokens=*" %%A in (%TEMP%\urls.txt) do (
    start chrome "%%A"
    timeout /t 5
    cscript //nologo %TEMP%\scroll.vbs
)
