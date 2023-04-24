#!/bin/bash

# Check if the user has provided an IP address.
if [ $# -eq 0 ]; then
    echo "Please provide an IP address."
    exit 1
fi

nmap -vv -Pn -sC -sV -p0-65535 $1 -oA "{$1}_version_script"