#!/bin/bash
set -e
set -x

# wait for the dock state to change
sleep .5

username=armando

#export IFS=$"\n"

if [[ "$ACTION" == "add" ]]; then
  DOCKED=1
  logger -t DOCKING "Detected condition: docked"
elif [[ "$ACTION" == "remove" ]]; then
  DOCKED=0
  logger -t DOCKING "Detected condition: un-docked"
else
  logger -t DOCKING "Detected condition: unknown"
  echo Please set env var \$ACTION to 'add' or 'remove'
  exit 1
fi

# invoke from XSetup with NO_KDM_REBOOT otherwise you'll end up in a KDM reboot loop
NO_KDM_REBOOT=0
for p in $*; do
  case "$p" in
  "NO_KDM_REBOOT") NO_KDM_REBOOT=1 ;;
  "SWITCH_TO_LOCAL") DOCKED=0 ;;
  esac
done

function switch_to_local {
  export DISPLAY=$1
  export XAUTHORITY=/home/$username/.Xauthority
  logger -t DOCKING "Switching off all inputs but laptop"
  su $username -c '
    /usr/bin/xrandr \
      --output eDP1 --auto \
      --output DP1 --off \
      --output DP2 --off \
      --output DP2-1 --off \
      --output DP2-2 --off \
      --output DP2-3 --off \
      --output HDMI1 --off \
      --output HDMI2 --off \
      --output VIRTUAL1 --off \
    '
}

function switch_to_external {
  export DISPLAY=$1
  export XAUTHORITY=/home/$username/.Xauthority

  # The Display port on the docking station is on HDMI2 - let's use it and turn off local display
  logger -t DOCKING "Switching off LVDS1 and switching on HDMI2/3"

  su $username -c '
    /usr/bin/xrandr \
      --output eDP1 --auto --pos 0x1080 --primary \
      --output DP1 --off \
      --output DP2 --off \
      --output DP2-1 --auto --pos 0x0 \
      --output DP2-2 --off \
      --output DP2-3 --off \
      --output HDMI1 --off \
      --output HDMI2 --off \
      --output VIRTUAL1 --off \
    '
}

case "$DOCKED" in
  "0")
    #undocked event
    switch_to_local :0 ;;
  "1")
    #docked event
    switch_to_external :0 ;;
esac

