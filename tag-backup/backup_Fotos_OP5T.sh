#!/bin/bash

src="root@192.168.3.159:/storage/emulated/0/DCIM/"
dst="/media/daten_fat32/Fotos/Fotos_OP5T/"

command_common="rsync -e 'sshpass -p admin ssh -p2222 -oHostKeyAlgorithms=+ssh-dss -oKexAlgorithms=+diffie-hellman-group1-sha1' -hvrl --size-only --progress --delete --stats --exclude=.thumbnails --exclude=thumbnails --exclude=.inflight_lowres"
command_dirs="${src} ${dst}"
command_dry="${command_common} -n ${command_dirs}"
command="${command_common} ${command_dirs}"

if [ $# -eq 0 ];
then
    echo "Syncing from $src to $dst"
    eval $command

else
    while getopts ":n" opt; do
      case $opt in
        n)
            echo "[DRY] Syncing from $src to $dst"
            eval $command_dry
          ;;
        \?)
          echo "Invalid option: -$OPTARG" >&2
          ;;
      esac
    done
fi

