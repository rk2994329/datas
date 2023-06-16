@echo off
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/rk2994329/datas/main/scroll.vbs' -OutFile '%TEMP%\scroll.vbs'"
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/rk2994329/datas/main/ruls.txt' -OutFile '%TEMP%\urls.txt'"
for /f "tokens=*" %%A in (%TEMP%\urls.txt) do (
    start chrome "%%A"
    timeout /t 5
    cscript //nologo %TEMP%\scroll.vbs
)
