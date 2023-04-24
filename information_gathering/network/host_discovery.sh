#!/bin/bash

## https://security.stackexchange.com/questions/36198/how-to-find-live-hosts-on-my-network

# Standard
nmap -sn 192.168.2.1/24 -oN host_discovery_standard.txt
sudo nmap -sn -PS22,3389 192.168.2.1/24 -oN host_discovery_tcp_syn.txt #custom TCP SYN scan
sudo nmap -sn -PU161 192.168.2.1/24 -oN host_discovery_tcp_syn.txt #custom UDP scan


# Check more ports
nmap -sn -PA21,22,25,3389 192.168.2.1/24 -oN host_discovery_extended.txt #custom ack scan