#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

list=( "https://www.indiatimes.com" "https://www.ndtv.com" "https://www.cnbc.com" "https://www.timesofindia.com" "https://www.express.co.uk" "https://www.news18.com" "https://www.nypost.com" "https://www.abc.net.au" "https://www.bbc.co.uk" "https://www.msn.com" "https://www.cnn.com" "https://www.news.google.com" "https://www.dailymail.co.uk" "https://www.nytimes.com" "https://www.theguardian.com" "https://www.foxnews.com" "https://www.finance.yahoo.com" "https://www.news.yahoo.com" )

. /etc/profile

for i in "${list[@]}"
do
	a=$(echo $i|cut -d "." -f2,3,4)
	echo $a
	/usr/bin/tcpdump -i enp0s3 -w /home/stefano/DATASET_HW2/$a-$(date +%Y-%m-%d_%H-%M-%S).pcap port 443 &
	sleep 2
	/usr/bin/firefox $i &
	sleep 20
	wmctrl -c "Firefox" -x "Navigator.Firefox"
	sleep 2
	pkill firefox
	pkill tcpdump
done

