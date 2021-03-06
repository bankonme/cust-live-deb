#!/bin/bash

# Global variables:
# ${GV_LOG}: Prefix this variable in echo to log echoed string.


SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
echo "${GV_LOG}>>>>>>>>> Running ${SCRIPT_NAME} ..."


# Install required packages to compile VirtualBox guest additions.
PKGS_LIST="dkms libc6-dev linux-headers-$(uname -r)"
apt-get -y --force-yes install ${PKGS_LIST}


# Install VBoxGuestAdditions
VBOXGUEST_ADD_ISO=${GV_BINARY_DIR}/VBoxGuestAdditions.iso
VBOXGUEST_ADD_ISO_SIZE=$(GF_SIZE_OF ${VBOXGUEST_ADD_ISO})
VBOXGUEST_ADD_MNT_DIR=/tmp/VBoxGuestAdditions
if [ -f ${VBOXGUEST_ADD_ISO} ]
then
  rm -rf ${VBOXGUEST_ADD_MNT_DIR}
  mkdir ${VBOXGUEST_ADD_MNT_DIR}
  mount -o loop,ro ${VBOXGUEST_ADD_ISO} ${VBOXGUEST_ADD_MNT_DIR}
  cd ${VBOXGUEST_ADD_MNT_DIR}
  ./VBoxLinuxAdditions.run
  cd -
  umount ${VBOXGUEST_ADD_MNT_DIR}
  rm -f ${VBOXGUEST_ADD_ISO}
else
  echo "${GV_LOG} * ERROR: ${VBOXGUEST_ADD_ISO} is missing. Get it from virtualbox.org."
fi


# Clean up
apt-get -y --force-yes purge ${PKGS_LIST}
apt-get -y --force-yes autoremove


# Log
VBOXGUEST_ADD_VERSION=$(modinfo vboxguest | grep ^version | tr -s ' ')
if [ -z "${VBOXGUEST_ADD_VERSION}" ]; then
	VBOXGUEST_ADD_VERSION="ERROR: VirtualBox guest additions installation failed!"
fi
echo "${GV_LOG} * Install VirtualBox guest additions to Shared folder/clipboard, auto window scaling, etc."
echo "${GV_LOG} * Assumed packages installed: bzip2 & Xserver installed."
echo "${GV_LOG} * Install ${PKGS_LIST// /, } to compile VirtualBox guest additions."
echo "${GV_LOG} * VirtualBox guest additions installed: ${VBOXGUEST_ADD_VERSION}."
echo "${GV_LOG} * Delete ${VBOXGUEST_ADD_ISO}[${VBOXGUEST_ADD_ISO_SIZE}K]. Space used could be negative due to this deletion."


# Reference:
# Tried packages from big to small:
#	apt-get -y --force-yes install dkms build-essential linux-headers-$(uname -r)
#	apt-get -y --force-yes install dkms libc6-dev linux-headers-$(uname -r)
