#!/bin/bash

SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
echo "${GV_LOG}>>>>>>>>> Running ${SCRIPT_NAME} ..."

SETTINGS_DIR=settings

#export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true DEBCONF_DEBUG=developer
export DEBCONF_DEBUG=developer

# Install X-Windows=xorg, Window Manager=openbox
debconf-set-selections ${SETTINGS_DIR}/keyboard.seed
apt-get -y --force-yes install xorg
#apt-get -y --force-yes install xserver-xorg-core xserver-xorg-input-all xserver-xorg-video-all xinit 


# Log
echo "${GV_LOG} * Set keyboard to use US international."
echo "${GV_LOG} * Install Xorg X server."

# Note:
# xinit for startx.
