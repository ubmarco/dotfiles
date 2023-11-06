#!/bin/sh
inotifywait -mrq -e create -e modify -e delete $HOME/share_c_level $HOME/share_p_level $HOME/share_project_files $HOME/share_ub_int | grep -v -x -F -f $HOME/.dotfiles/unlinked/inotify_shares/ignore_list.txt | while read file; do (notify-send "File udated" "$file"&) done
