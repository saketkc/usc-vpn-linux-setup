# usc-vpn-linux-setup

## Install dependencies

```bash
sudo apt-get install openconnect lib32ncurses5 lib32tinfo5 lib32z1 libc6-i386\
  libpkcs11-helper1 openvpn vpnc-scripts
```

## start_vpn.sh

```bash
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

```

`VPNGRP` can be 1-Wireless|2-Home|3-OffCampusOther|4-UniversityHospitals|5-DohenyEyeInstitute|6-LAC-USC|7-KUSC|8-USCTrafficOnly|9a-USC-SBL|9b-DUO-test|test

## Run
```bash
$ chmod +x start_vpn.sh
$ ./start_vpn.sh
```
