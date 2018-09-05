#!/bin/bash
if [ $# != 1 ] ; then 
echo "USAGE: $0 file_directory" 
exit 1; 
fi 

for file_name in ./$1/*
do
	if test -f $file_name
	then
		echo $file_name
		grep "Up pps" ${file_name} | awk '{print $4}'
		grep "Up bps" ${file_name} | awk '{print $4}'
		grep "Flow Online" ${file_name} | awk '{print $9}'
		grep "Xdr Second Object Rate" ${file_name} | awk '{print $6}'
		ipacket=$(grep "ipackets" ${file_name}|sed -n '2p'|awk '{print $2}') 
		imissed=$(grep "imissed" ${file_name}|sed -n '2p'|awk '{print $2}')
		echo "scale=5;$imissed/($ipacket+$imissed)*100"|bc
		grep "Up Avg Len" ${file_name} | awk '{print $5}'
		grep "Flow CreateRate" ${file_name} | awk '{print $4}'
		grep "Percentage" ${file_name} | awk '{print $5}'
		echo "========================="
	fi
done
