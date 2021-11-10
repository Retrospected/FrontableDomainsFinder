#!/bin/bash
#

scriptname=`basename "$0"`

if [ $# -ne 3 ]; then
	echo "Usage: ./$scriptname <input file of domains> <part of the CNAME to look for> <outputfile>"
	echo ""
	echo "List of CNAMES for popular CDN providers:"
	echo "Fastly: fastly.net"
	echo "Azure: azureedge.net, msecnd.net and/or v0cdn.net"
	exit 1
fi

file="$1"
tempfile="$1.temp"

#removing carriage return for input file
cat $file | tr -d '\r' >$tempfile
mv $tempfile $file

cname="$2"
outputfile="$3"

LINES=$(cat $file)
counter=1
totallines=$(cat $file | wc -l)
for LINE in $LINES
do
	echo "[$counter/$totallines] Looking up $LINE"
  result=`dig $LINE | grep -i $cname | grep -i cname`
	if [ -n "$result" ]; then
		echo "$LINE: $result" | tee -a $outputfile
	fi
	counter=$(($counter+1))
	sleep 1
done
