#!/bin/bash

VPN_NAME=homevpn
SCRIPT_DIT=~/.config/scripts

if ! $SCRIPT_DIT/vpn_check.sh; then
    openvpn3 session-start -c homevpn
else
    openvpn3 session-manage -D -c homevpn
fi
