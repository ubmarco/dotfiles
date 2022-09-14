#!/bin/bash
echo Syncing from /media/marco/daten_fat32/music_mobile/ to /mnt/dlink_nas_home/Musikarchiv/ via USB cable
adb root
#adb remount
adb -d forward tcp:8090 tcp:8090
adb shell /system/bin/sshd -D -p 8090 &
rsync -e 'ssh -p 8090' -hvrl --size-only --delete --stats /media/marco/daten_fat32/music_mobile/ shell@127.0.0.1:/storage/sdcard1/Music/
