#!/bin/bash

src="/mnt/data/Sync/Musik/Musik_Beets_new"
dst="/media/A8BB-95C3"

command_common="rsync -hvrltDO --delete --modify-window=7200 --stats"
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

