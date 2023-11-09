#!/bin/bash

# from https://stackoverflow.com/a/14203146

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    -u|--up)
      VALUE="+5%"
      shift # past argument
      shift # past value
      ;;
    -d|--down)
      VALUE="5%-"
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

brightnessctl -n1 -e s ${VALUE} && brightnessctl -e g | xargs -I _ notify-send --expire-time=2000 "_"
