#!/bin/bash

# Global variables:
# ${GV_LOG}: Prefix this variable in echo to log echoed string.
# ${GV_SETTINGS_DIR}: Hold settings data.
# ${GV_BINARY_DIR}: Hold settings binary data.

SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
echo "${GV_LOG}>>>>>>>>> Running ${SCRIPT_NAME} ..."

apt-get -y --force-yes install wicd

# Log
echo "${GV_LOG} * Install Network Manager: wicd."
echo "${GV_LOG} * For wireless, you have to type in the wireless interface(e.g. wlan0) in the Preferences."

# Note:
# Command Line:
#   ip link set wlan0 up
#   iwlist wlan0 scan