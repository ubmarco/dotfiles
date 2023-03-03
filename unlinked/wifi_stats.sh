#!/bin/sh
WIFI_DEV=$(nmcli | rg Stockmann | awk -F ':' '{print $1}' | head -1)
if [ -n "$WIFI_DEV" ]; then
    iwlist $WIFI_DEV channel | rg Current | sed 's/^[[:space:]]*//'
    echo
    iw dev $WIFI_DEV link
fi
