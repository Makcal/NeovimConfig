#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

sleep 1
if $SCRIPT_DIR/vpn_check.sh; then
    echo 
else
    echo 
fi
exit 0

