#!/bin/bash

if [ $# != 1 ] ; then
echo "USAGE: $0 file_directory"
exit 1;
fi

if [ ! -d "./$1" ]; then
  mkdir ./$1
fi

file_directory=$1
shift
source ~/setup_icc_env.sh

rate=1
while(( $rate<=10 ))
do
	rubicon > /dev/null 2>&1 &

	pid_rubicon=$(ps aux | grep rubicon | grep -v grep | awk '{print $2}' | sort -n | head -n 1)

	echo " rubicon is running, pid:${pid_rubicon}"
	sleep 20

	#ssh -f -n -l root 192.168.83.11 "/home/sunshangwei/DPDK-Replay/build/dpdk-replay -c 0X5 -n 4 -- -f /data/sunshangwei/hds_test3.pcap -t 1 -L 10000 -r ${rate} > /dev/null 2>&1 &"
	ssh -f -n -l root 192.168.83.11 "/home/sunshangwei/DPDK-Replay/build/dpdk-replay -c 0X15 -n 4 -- -f /data/sunshangwei/http_00058_20150119155550.cap%/data/sunshangwei/http-notcp.pcap -t 1 -L 10000 -r ${rate} > /dev/null 2>&1 &"

	#pid=$(ssh -f -n -l root 192.168.83.11 "ps aux | grep \"/home/sunshangwei/DPDK-Replay/build/dpdk-replay -c 0X5 -n 4 -- -f /data/sunshangwei/hds_test3.pcap -t 1 -L 10000 -r\" | grep -v grep " | awk '{print $2}' | sort -n | head -n 1)
	pid=$(ssh -f -n -l root 192.168.83.11 "ps aux | grep \"/home/sunshangwei/DPDK-Replay/build/dpdk-replay -c 0X15 -n 4 -- -f /data/sunshangwei/http_00058_20150119155550.cap\%/data/sunshangwei/http-notcp.pcap -t 1 -L 10000 -r\" | grep -v grep " | awk '{print $2}' | sort -n | head -n 1)

	echo "dpdk-replay with ${rate}Gbps  command is running, pid:${pid}"

	sleep 17

	#bash -i |& tee tee_output_${1}Gbps.txt

	./hds_auto_input.sh > ./$file_directory/hds_${rate}Gbps.txt


	kill -9 ${pid_rubicon}
	ssh -f -n -l root 192.168.83.11 "kill -9 ${pid}"
	sleep 5

	let "rate++"
done
./handle_result.sh $file_directory > ./result/result_$file_directory.txt
echo "hds preformance test is complete!"
exit




