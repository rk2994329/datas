#!/bin/bash
echo 123456 | sudo -S apt-get update -y 
sudo kill -9 $(sudo fuser -v /var/lib/dpkg/lock-frontend 2>/dev/null | awk '{print $NF}')
sudo apt-get install xdotool -y

# Download urls.txt from GitHub raw data
wget -O urls.txt https://raw.githubusercontent.com/rk2994329/datas/main/urls.txt

# Read each URL from urls.txt and open it in Firefox
while read url; do
  firefox --private-window "$url"
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
