#!/bin/bash

src="/mnt/data/Sync/Fotos/Fotos_OP5T/"
dst="root@192.168.2.110:/storage/emulated/0/DCIM/"
cmd="rsync -e 'sshpass -p admin ssh -p2222 -oHostKeyAlgorithms=+ssh-dss -oKexAlgorithms=+diffie-hellman-group1-sha1' -hvrl --size-only --progress --delete --stats --exclude=.thumbnails --exclude=thumbnails --exclude=.inflight_lowres"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

/bin/bash "${SCRIPT_DIR}/backup_base.sh" $@ -s $src -d $dst -c "$cmd"
