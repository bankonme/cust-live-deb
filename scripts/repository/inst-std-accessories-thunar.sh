#!/bin/bash
set -e

# Global variables:
# ${GV_LOG}: Prefix this variable in echo to log echoed string.
# ${GV_SETTINGS_DIR}: Hold settings data.
# ${GV_BINARY_DIR}: Hold settings binary data.

SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
echo "${GV_LOG}>>>>>>>>> Running ${SCRIPT_NAME} ..."

PKGS_LIST="thunar thunar-media-tags-plugin thunar-archive-plugin thunar-volman"
apt-get -y --force-yes install ${PKGS_LIST}


# Insert Thunar in Accessories menu.
sed -i "/Accessories\">/ r ${GV_SETTINGS_DIR}/jwmrc-menus-acc-thunar.xml" /root/jwmrc-menus.xml


# Log
echo "${GV_LOG} * Install File Manger: ${PKGS_LIST// /, }."
echo "${GV_LOG} * Insert Thunar in Accessories menu."


