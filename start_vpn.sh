#!/bin/bash

VPNUSER=<your-username-here>
VPNGRP=1-Wireless

# =============================================================================
# you shouldn't have to change anything below here
VPNURL=https://vpn.usc.edu
VPNSCRIPT=/usr/share/vpnc-scripts/vpnc-script

sudo openvpn --mktun --dev tun1 && \
sudo ifconfig tun1 up && \
sudo /usr/sbin/openconnect -s $VPNSCRIPT $VPNURL --user=$VPNUSER --authgroup=$VPNGRP --interface=tun1
sudo ifconfig tun1 down
