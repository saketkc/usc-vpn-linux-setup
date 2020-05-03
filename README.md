# usc-vpn-linux-setup - One command setup for running USC VPN on linux systems

Because nobody cared to put a client for linux [here](https://itservices.usc.edu/vpn/).
**Update**: This script no longer works. From a first pass reading it seems DUO push
is not enabled for OpenVPN upstream. However, AnyConnect now has a supported client
for linux that works (See next section).

## Recent DUO change

This script no longer works after the recent DUO change. A quick fix is to use AnyConnect from Cisco:

1. Go to https://vpn.usc.edu/+CSCOE+/portal.html
2. Download linux client from the 'AnyConnect' tab
3. Run AnyConnect with vpn.usc.edu


## Installing dependencies

```bash
sudo apt-get install openconnect lib32ncurses5 lib32tinfo5 lib32z1 libc6-i386\
  libpkcs11-helper1 openvpn vpnc-scripts
```

## start_vpn.sh

The only thing you will need to edit ideally is `VPNUSER`:

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

`VPNGRP` can be :

- 1-Wireless
- 2-Home 
- 3-OffCampusOther
- 4-UniversityHospitals
- 5-DohenyEyeInstitute
- 6-LAC-USC
- 7-KUSC
- 8-USCTrafficOnly
- 9a-USC-SBL
- 9b-DUO-test
- test

## Execution

```bash
$ chmod +x start_vpn.sh
$ ./start_vpn.sh
```
