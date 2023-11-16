#!/bin/bash

# from https://stackoverflow.com/a/14203146

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    -c1|--count1)
      COUNT="1"
      shift # past argument
      shift # past value
      ;;
    -c2|--count2)
      COUNT="2"
      shift # past argument
      shift # past value
      ;;
    -c3|--count3)
      COUNT="3"
      shift # past argument
      shift # past value
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

# stop the xfconf deamon so the reloading panel will not override the copied file
killall xfconfd

sleep 1

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# this is the path of the symlinked panel config xml, it is changed in-place
PANEL_PATH="${SCRIPT_DIR}/../../tag-panel/config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml"

# remove all panel lines
sed -i '/^    <value type="int" value="[[:digit:]]"\/>/d' ${PANEL_PATH}

if [ "$COUNT" = "1" ]; then
  sed -i '6i \ \ \ \ <value type="int" value="0"/>' ${PANEL_PATH}
fi

if [ "$COUNT" = "2" ]; then
  sed -i '6i \ \ \ \ <value type="int" value="1"/>' ${PANEL_PATH}
  sed -i '6i \ \ \ \ <value type="int" value="0"/>' ${PANEL_PATH}
fi

if [ "$COUNT" = "3" ]; then
  sed -i '6i \ \ \ \ <value type="int" value="2"/>' ${PANEL_PATH}
  sed -i '6i \ \ \ \ <value type="int" value="1"/>' ${PANEL_PATH}
  sed -i '6i \ \ \ \ <value type="int" value="0"/>' ${PANEL_PATH}
fi

# make sure the panel is currently symlinked as it may get overwritten by xfce
rcup -f -t panel

xfce4-panel -r
