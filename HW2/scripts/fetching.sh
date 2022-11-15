#!/bin/bash

list=( "https://www.indiatimes.com" "https://www.ndtv.com" "https://www.cnbc.com" "https://www.timesofindia.com" "https://www.express.co.uk" "https://www.news18.com" "https://www.nypost.com" "https://www.abc.net.au" "https://www.bbc.co.uk" "https://www.msn.com" "https://www.cnn.com" "https://www.news.google.com" "https://www.dailymail.co.uk" "https://www.nytimes.com" "https://www.theguardian.com" "https://www.foxnews.com" "https://www.finance.yahoo.com" "https://www.news.yahoo.com" )

. /etc/profile

for i in "${list[@]}"
do
	a=$(echo $i|cut -d "." -f2,3,4)
	echo $a
	/usr/sbin/tcpdump -i eth0 -w /root/$a-$(date +%Y-%m-%d_%H-%M-%S).pcap portrange 2000-2100 &
	sleep 2
	curl -L -4 $i --local-port 2000-2100
	#killall curl
	sleep 5
	pkill tcpdump
done
