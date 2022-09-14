#!/bin/bash

src="/mnt/data/Sync/Fotos/"
dst="/run/media/marco/mobil_1TB/backup_Fotos/Fotos/"


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

/bin/bash "${SCRIPT_DIR}/backup_base.sh" $@ -s $src -d $dst
