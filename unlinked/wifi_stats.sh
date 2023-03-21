#!/bin/sh
WIFI_DEVS=$(nmcli dev | rg 'wifi +connected' | awk '{print $1}')
for WIFI_DEV in $WIFI_DEVS; do
    iwlist $WIFI_DEV channel | rg Current | sed 's/^[[:space:]]*//'
    iw dev $WIFI_DEV link
    echo
done
