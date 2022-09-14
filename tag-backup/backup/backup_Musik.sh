#!/bin/bash

src="/mnt/data/Sync/Musik/"
dst="/mnt/dlink_nas_home/Musik/"


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

/bin/bash "${SCRIPT_DIR}/backup_base.sh" $@ -s $src -d $dst
