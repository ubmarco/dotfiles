#!/bin/bash

src="/mnt/data/Sync/Musik/Musik_Beets_new/"
dst="volumio@192.168.2.102:/media/A8BB-95C3/Musik_Beets_new/"
cmd="rsync -hvrltDO --delete --modify-window=7200 --stats -e 'sshpass -p 'volumio' ssh'"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

/bin/bash "${SCRIPT_DIR}/backup_base.sh" $@ -s $src -d $dst -c "$cmd"
