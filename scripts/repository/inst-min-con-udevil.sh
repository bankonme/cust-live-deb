#!/bin/bash
set -e

# Global variables:
# ${GV_LOG}: Prefix this variable in echo to log echoed string.
# ${GV_SETTINGS_DIR}: Hold settings data.
# ${GV_BINARY_DIR}: Hold settings binary data.

SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
echo "${GV_LOG}>>>>>>>>> Running ${SCRIPT_NAME} ..."


# Install udevil to get devmon.
apt-get -y --force-yes install udevil 


# Insert devmon in startup script.
yes | cp ${GV_SETTINGS_DIR}/startup-devmon.sh /root/
chmod +x /root/startup-devmon.sh
sed -i "/## Insert your script files here ##/a /root/startup-devmon.sh&" /etc/init.d/startup.sh

# Log
echo "${GV_LOG} * Install udevil to auto mount USB devices."
echo "${GV_LOG} * Set devmon to auto start on startup."
echo "${GV_LOG} * You need ntfs-3g driver to be able to write on ntfs partition."

