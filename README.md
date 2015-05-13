# Custom Live Debian System
Set of scripts to create custom Live Debian System.

# Usage
1. Change `DEB_REPO_URL` variable in `build-live.sh` to point to the Debian repository URL.
1. Run `./build-live.sh`
1. Run `chroot chroot`
1. You are now in the live system(chroot), run the followings:
1. `cd /root/scripts`
1. `sh install.sh`
1. `exit`
1. You are now out of the live system, run `./mkiso.sh` to create ISO image.

# Requirements
* `apt-get -y --force-yes install live-build squashfs-tools syslinux`
* `apt-get -y --force-yes install genisoimage` 

# References
* http://live.debian.net/manual/git/html/live-manual.en.html (Manual)
* http://manpages.ubuntu.com/manpages/natty/de/man1/lb_config.1.html
* http://askubuntu.com/questions/551195/scripting-chroot-how-to
* https://help.ubuntu.com/community/LiveCDCustomizationFromScratch
* https://wiki.debian.org/Openbox/

# Release checklist
* /etc/sources.list has correct URL.


# Customizations Performed
  * Running install-00-00.sh ...
  * Running install-00-base.sh ...
    * Mount /proc, /sys and /dev/pts.
    * Generate dbus-uuidgen to /var/lib/dbus/machine-id.
    * Install Linux image.
    * Set APT to skip installing recommended packages.
  * Running install-00-locale.sh ...
    * Setup locale to use en_US.UTF-8.
    * Install localepurge to purge non-UTF-8.
  * Running install-auto-login-root.sh ...
  * Running install-bashrc.sh ...
  * Running install-dev-tools.sh ...
  * Running install-proxy.sh ...
    * Add proxy to /etc/environment and /etc/apt/apt.conf.d/proxy.
  * Running install-timezone.sh ...
    * Set time zone to EST (America/Montreal).
  * Running install-xwin-00-openbox.sh ...
    * Set keyboard to use US international.
    * Install xorg and openbox.
    * Add auto start openbox on boot.
  * Running install-xwin-chromium.sh ...
  * Running install-xwin-iceweasel.sh ...
  * Running install-zz-00-zerosizing-docs.sh ...
    * Zero size all documents in /usr/share/.
  * Running install-zz-cleanup.sh ...
    * Clean apt-get cache.
    * rm -rf /tmp/*.
    * Umount /sys, /dev/pts and /proc.
    * Add http://http.debian.net/debian/ in sources.list.
