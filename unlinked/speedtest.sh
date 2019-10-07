#!/bin/sh
DATE=$(date +%Y-%m-%d:%H:%M:%S)
SPEEDTEST_OUT=$(speedtest-cli)
DOWNLOAD=$(echo "$SPEEDTEST_OUT" | awk '/Download:/ {print $2 " " $3}')
UPLOAD=$(echo "$SPEEDTEST_OUT" | awk '/Upload:/ {print $2 " " $3}')
echo "$DATE $DOWNLOAD $UPLOAD" >> speedtest.log

