#!/bin/bash

src="/media/daten_fat32/Musik/music_mobile/"
dst="root@192.168.2.101:/storage/0000-0000/Music"

command_common="rsync -e 'sshpass -p admin ssh' -hvrl --size-only --progress --delete --stats"
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

