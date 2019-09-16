#!/bin/sh
DATE=$(date +%Y-%m-%d:%H:%M:%S)
STATE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/state/ {print $2}')
PERCENTAGE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/percentage/ {print $2}')
TTE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/time to empty/ {print $4}')
TTE_UNIT=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/time to empty/ {print $5}')
TTF=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/time to full/ {print $4}')
TTF_UNIT=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/time to full/ {print $5}')
echo "$DATE $STATE $PERCENTAGE $TTE $TTE_UNIT $TTF $TTF_UNIT" >> battery_status.log

