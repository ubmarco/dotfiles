#!/bin/bash

command_dirs="${src} ${dst}"
command_dry="${command_common} -n ${command_dirs}"
command="${command_common} ${command_dirs}"

src=""
dst=""
cmd="rsync -hvrltDO --delete --modify-window=7200 --stats"  # default
dry=""

while getopts "s:d:c:n" opt; do
    case $opt in
    n)
        dry="-n"
        ;;
    s)
        src="${OPTARG}"
        ;;
    d)
        dst="${OPTARG}"
        ;;
    c)
        cmd="${OPTARG}"
        ;;
    \?)
        echo "Invalid option: -$OPTARG" >&2
        exit 1
        ;;
    esac
done

full_cmd="$cmd $dry $src $dst"

# echo what will be done
if [ "$dry" = "-n" ]; then
  echo "[DRY RUN]"
fi
echo "$full_cmd"

# run it
eval $full_cmd
