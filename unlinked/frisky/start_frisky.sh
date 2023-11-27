#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# this is the path of the symlinked panel config xml, it is changed in-place
M3U_PATH="${SCRIPT_DIR}/../../tag-desk-music/Desktop/frisky.m3u"

mpv --player-operation-mode=pseudo-gui -- ${M3U_PATH}
