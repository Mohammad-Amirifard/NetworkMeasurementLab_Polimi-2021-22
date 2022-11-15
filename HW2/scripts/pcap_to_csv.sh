#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# This bash script iterates over all pcap files in the same folder.
# For each one of them, outputs a CSV file with the same name using tshark
for i in *.pcap
do
	/usr/bin/echo "Processing " $i
	/usr/bin/tshark -r $i -T fields -e frame.number -e frame.time -e frame.len \
		-e ip.len -e ip.src -e ip.dst -e ip.proto \
		-e tcp.srcport -e tcp.dstport -e tcp.len -e tcp.option_kind \
			-E header=y -E separator=, -E quote=d > CSV/$i.csv
done
