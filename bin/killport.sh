#!/bin/bash

if [ "$1" == "" ]; then
  echo -e "usage: killport {portnumber}"
  exit 0
fi

set -euo pipefail
 
portnumber=$1

pid=$(lsof -i:$1 | awk -F " " 'FNR==2 { print $2 }')

if [ "$pid" == "" ]; then
  echo " Port $portnumber was already closed"
  exit 1
fi

kill $pid

Green='\033[0;32m'
echo -e "${Green} Success: port ${portnumber} associated with pid ${pid} closed ✓"


