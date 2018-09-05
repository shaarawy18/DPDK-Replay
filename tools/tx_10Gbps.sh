#./build/dpdk-dump -c COREMASK -n NUM [-w PCI_ADDR] -- -f file [-s sum] [-R rate] [-B buffer_size] [-C max_pkt] [-t times] [-T timeout]
#./build/dpdk-replay -c 0X03 -n 2  -- -f /data/sunshangwei/http_00058_20150119155550.cap  -t 1 -r 10
./build/dpdk-replay -c 0X03 -n 2  -- -f ./hds_test3.pcap  -t 1 -r 10
#./build/dpdk-replay -c 0X03 -n 2  -- -f /data/ttt.pcap  -t 10 -r 1
#./build/dpdk-replay -c 0X03 -n 2  -- -f /data/sunshangwei/sunshangwei_offline_test_1G.pcap  -t 1000 -r 10

