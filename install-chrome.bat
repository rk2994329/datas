set installer_url="https://dl.google.com/chrome/install/latest/chrome_installer.exe"
set installer_path="%TEMP%\chrome_installer.exe"
powershell -Command "(New-Object Net.WebClient).DownloadFile('%installer_url%', '%installer_path%')"
echo Starting installation. Please wait...
start /wait "" %installer_path% /silent /install
del %installer_path%
echo Installation complete.
