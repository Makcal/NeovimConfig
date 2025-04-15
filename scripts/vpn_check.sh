#!/bin/bash

VPN_NAME=homevpn

openvpn3 session-stats -c $VPN_NAME | grep -I 'Connected' > /dev/null
# 0 on found
exit $?
