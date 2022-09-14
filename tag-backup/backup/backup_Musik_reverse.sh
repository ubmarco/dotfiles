#!/bin/bash

src="/mnt/dlink_nas_home/Musik/"
dst="/mnt/data/Sync/Musik/"


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

/bin/bash "${SCRIPT_DIR}/backup_base.sh" $@ -s $src -d $dst
