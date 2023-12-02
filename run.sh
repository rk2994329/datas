#!/bin/bash
sudo apt-get update -y
sudo apt-get install xdotool -y

# Download urls.txt from GitHub raw data
wget -O urls.txt https://raw.githubusercontent.com/rk2994329/datas/main/urls.txt

# Read each URL from urls.txt and open it in Firefox
while read url; do
  firefox --private-window "$url"
  firefox_window=$(wmctrl -l | grep "Mozilla Firefox" | awk '{print \$1}')
  wmctrl -i -a "$firefox_window"
  sleep 5 
  xdotool key End
  sleep 5
  xdotool key Home
  sleep 3
  for i in {1..20}
  do
    echo "Loop : $i"
    xdotool key Down
    sleep 5
  done
  pkill firefox
done < urls.txt
