#!/bin/sh

# activate all monitors
# eDP1 laptop
# DP1 middle monitor
# HDMI2 right right
xrandr --output eDP1 --mode 1920x1080 --pos 1920x437 --output DP1 --mode 1920x1200 --pos 0x0 --primary --output HDMI2 --off 

# Set panel to primary monitor
sh ~/Desktop/pan_prim
