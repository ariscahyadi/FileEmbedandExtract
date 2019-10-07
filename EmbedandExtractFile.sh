#!/bin/bash 

# Embedding File

# Convert python file into hex
hexdump -C decodexorpayload.py > decodexorpayload.txt

# Convert hexdump to pcap
text2pcap -T 5,6 decodexorpayload.txt xor.pcap

# Merge the packets 
# Merge packets in multiples files based on their timestamps
mergecap -w merge.pcap xor.pcap final.pcap

# Merge the packets
# Append the packets
# mergecap -a -w merge.pcap xor.pcap final.pcap

# Extracting File

# Export Specified Packets
tshark -r merge.pcap -Y "frame.number==2" -w output.pcap

# Export Packet Bytes
tshark -r output.pcap -T fields -e data > xor.txt
python convert.py
