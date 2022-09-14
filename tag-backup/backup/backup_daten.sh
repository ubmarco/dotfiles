#!/bin/bash

src="/mnt/data/Sync/Daten/"
dst="/mnt/dlink_nas_home/Sicherungen/daten_fat32/Daten/"


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

/bin/bash "${SCRIPT_DIR}/backup_base.sh" $@ -s $src -d $dst
