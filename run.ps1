# Add reference to System.Windows.Forms.dll
Add-Type -AssemblyName System.Windows.Forms

# Download the URLs list
$urlsList = Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/rk2994329/datas/main/urls.txt' -OutFile "$env:TEMP\urls.txt" -UseBasicParsing

# Read the URLs from the file
$urls = Get-Content "$env:TEMP\urls.txt"

# Loop through each URL
foreach ($url in $urls) {
    # Open Chrome in a new window and incognito mode
    Start-Process "chrome.exe" "--new-window --incognito $url"

    # Wait for 5 seconds
    Start-Sleep -Seconds 5

    # Scroll down 10 times
    for ($i = 0; $i -lt 10; $i++) {
        [System.Windows.Forms.SendKeys]::SendWait('{DOWN}')
        Start-Sleep -Seconds 1
    }
}
