#!/bin/bash

# Check if the user has provided an IP address.
if [ $# -eq 0 ]; then
    echo "Please provide an IP address."
    exit 1
fi

# Check if the user has provided a valid IP address.
if ! [[ $argv[1] =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Please provide a valid IP address."
    exit 1
fi

echo "Starting TCP SYN scan"
nmap -vv -Pn -sS -T3 -p0 -65535 $argv[1] -oA $argv[1]_tcp_syn
echo "Commencing SCTP INIT scan"
nmap -vv -Pn -sY -T3 -p0 -65535 $argv[1] -oA $argv[1]_sctp_init
echo "Commencing UDP scan"
nmap -vv -Pn -sU -T3 -p0 -65535 $argv[1] -oA $argv[1]_udp