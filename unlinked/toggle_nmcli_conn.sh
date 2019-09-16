#!/bin/bash

if nmcli con show --active | grep "$1"; then
    nmcli con down id "$1"
else
    nmcli con up id "$1"
fi
