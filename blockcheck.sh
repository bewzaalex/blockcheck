#!/usr/bin/env bash

# Colors
NC='\033[0m'
RED='\033[0;31m'
GREEN='\033[1;32m'

# Get domain list
script_path=$(dirname $0)
domains_file=${script_path}'/domains.txt'
domains=$(grep -v ^# ${domains_file})

# Run main loop
for domain in ${domains[@]}; do
    ip_count=$(host ${domain} | grep -c "has address")
    if [ ${ip_count} -gt 0 ]; then
        echo -e "${GREEN}${domain} is open${NC}"
    else
        echo -e "${RED}${domain} is blocked${NC}"
    fi
done
