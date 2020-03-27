#!/bin/sh

# need to run that after suspend/standby to get Thunderbolt dock working
lspci

# activate all monitors
# eDP1 laptop
# DP1 middle monitor
# HDMI2 right monitor
xrandr --output eDP1 --mode 1920x1080 --pos 0x977 --output DP1 --mode 2560x1440 --primary --pos 1920x0 --output HDMI2 --mode 2560x1440 --pos 4480x0

# Set panel to primary monitor (right)
sh ~/Desktop/pan_prim.sh

# Wait a while until dock sound device is ready
sleep 15s

# Set default audio sink to the dock station
sh ~/.dotfiles/unlinked/set_audio_dock.sh
