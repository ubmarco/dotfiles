#!/bin/bash

src="root@192.168.2.114:/storage/emulated/0/Download/"
dst="/mnt/data/Sync/Daten/Backup_OP5T/Download/"
cmd="rsync -e 'sshpass -p admin ssh -p2222 -oKexAlgorithms=+diffie-hellman-group1-sha1' -hvrl --size-only --progress --delete --stats --exclude=.thumbnails --exclude=thumbnails --exclude=.inflight_lowres"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

/bin/bash "${SCRIPT_DIR}/backup_base.sh" $@ -s $src -d $dst -c "$cmd"
