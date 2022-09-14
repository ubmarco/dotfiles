#!/bin/bash

src="/mnt/data/Sync/Musik/Musik_Beets_new"
dst="/media/A8BB-95C3"


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

/bin/bash "${SCRIPT_DIR}/backup_base.sh" $@ -s $src -d $dst
