#!/bin/bash

# https://l3net.wordpress.com/2013/09/21/how-to-build-a-debian-livecd/
# http://willhaley.com/blog/create-a-custom-debian-live-environment/


# Build live system.
LIVE_SYSTEM_DIR=chroot
DEB_REPO_URL=http://localhost/debian-repo/
#DEB_REPO_URL=http://http.debian.net/debian/

rm -rf ${LIVE_SYSTEM_DIR}
debootstrap --no-check-gpg --arch=amd64 jessie ${LIVE_SYSTEM_DIR} ${DEB_REPO_URL}

# Add repository components(i.e. contrib, non-free)
sed -i 's/ main/ main contrib non-free/' ${LIVE_SYSTEM_DIR}/etc/apt/sources.list

# Copy all scripts to live system.
cp -R scripts ${LIVE_SYSTEM_DIR}/root


# What to do next.
cat <<EOF
============================================
What to do next?
Run the following tolog in the live system:
    chroot chroot
Then, run
  cd /root/scripts
  chmod +x scripts-ls.sh
  ./scripts-ls.sh ${SYSTEM}
  chmod +x install.sh
  ./install.sh
EOF

