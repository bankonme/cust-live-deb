# Custom Live Debian System
Set of scripts to create custom Live Debian System.
* Automatically calculate space used of each script. 

# Usage
1. Change `DEB_REPO_URL` variable in `build-live.sh` to point to the Debian repository URL.
1. Run `./build-live.sh`
1. Run `chroot chroot`
1. You are now in the live system(chroot), run the followings:
1. `cd /root/scripts`
1. `chmod +x install.sh`
1. `./install.sh`
1. `exit`
1. You are now out of the live system, run `./mkiso.sh` to create ISO image.

# Quickies
```
# Run these in 1 shot as ROOT to build ALL.
./build-live.sh
chroot chroot/ /bin/bash -c "cd /root/scripts; chmod +x install.sh; ./install.sh all"
./mkiso.sh

# OR
./build-live.sh && chroot chroot/ /bin/bash -c "cd /root/scripts; chmod +x install.sh; ./install.sh all" && ./mkiso.sh
```
http://stackoverflow.com/a/8157973

# Transferring the iso image to USB stick
```
dd if=remaster.iso of=/dev/sdX bs=4M
sync
```
The `sync` bit is important as `dd` can return before the write operation finishes.

# Requirements
* `apt-get -y --force-yes install live-build squashfs-tools syslinux`
* `apt-get -y --force-yes install xorriso` 

# Analyze package sizes
```
sort install-size-history.txt | uniq | grep <script-name>
```

# Packages
* LinuxMint: http://paste.debian.net/182062/

# References
* http://live.debian.net/manual/git/html/live-manual.en.html (Manual)
* http://manpages.ubuntu.com/manpages/natty/de/man1/lb_config.1.html
* http://askubuntu.com/questions/551195/scripting-chroot-how-to
* https://help.ubuntu.com/community/LiveCDCustomizationFromScratch
* https://wiki.debian.org/Openbox/
* http://willhaley.com/willhaley/blog/create-a-custom-debian-live-environment/
* https://l3net.wordpress.com/2013/09/21/how-to-build-a-debian-livecd/
* http://www.opengeeks.me/2015/04/building-an-hybrid-debian-live-iso-with-xorriso/
* https://wiki.ubuntu.com/BootToRAM

# Release checklist
* Can you watch youtube video over wireless connection?

# Dump


# Customizations Performed
  * Running install.sh ...
    * Running on SHELL=/bin/bash VER=4.3.30(1)-release
    * Total size = 320488K. Space Used = 320488K.
  * Running inst-min-con-00-linux-image.sh ...
    * After this operation, 3145 kB of additional disk space will be used.
    * After this operation, 224 MB of additional disk space will be used.
    * Mount /proc, /sys and /dev/pts.
    * Generate dbus-uuidgen to /var/lib/dbus/machine-id.
    * Install Linux image.
    * Set APT to skip installing recommended packages.
    * Total size = 612064K. Space Used = 291576K.
  * Running inst-min-con-01-locale.sh ...
    * After this operation, 16.3 MB of additional disk space will be used.
    * After this operation, 334 kB of additional disk space will be used.
    * Install locale and set it to use en_US.UTF-8.
    * Install localepurge to purge non-UTF-8.
    * Total size = 635620K. Space Used = 23556K.
  * Running inst-min-con-auto-log-root.sh ...
    * Total size = 635628K. Space Used = 8K.
  * Running inst-min-con-automount-udev.sh ...
    * Install udev to auto mount all devices.
    * Total size = 635632K. Space Used = 4K.
  * Running inst-min-con-bashrc.sh ...
    * Set common settings for /root/.bashrc.
    * Set dircolors to use dircolors-gnu-ls-colors.txt to make ls more beautiful.
    * Total size = 635640K. Space Used = 8K.
  * Running inst-min-con-compressors.sh ...
    * After this operation, 122 kB of additional disk space will be used.
    * Install bzip2 compressor.
    * Total size = 635836K. Space Used = 196K.
  * Running inst-min-con-firmware.sh ...
    * After this operation, 41.7 MB of additional disk space will be used.
    * Install firmwares: atmel-firmware, bluez-firmware, firmware-atheros, firmware-bnx2, firmware-bnx2x, firmware-brcm80211, firmware-intelwimax, firmware-ipw2x00, firmware-ivtv, firmware-iwlwifi, firmware-libertas, firmware-linux, firmware-linux-free, firmware-linux-nonfree, firmware-qlogic, firmware-ralink, firmware-realtek, zd1211-firmware.
    * Total size = 689536K. Space Used = 53700K.
  * Running inst-min-con-live-build-tools.sh ...
    * After this operation, 151 kB of additional disk space will be used.
    * After this operation, 1,789 kB of additional disk space will be used.
    * Install xorriso to create isohybrid.
    * Install isolinux to get isohdpfx.bin and isolinux.bin in order to create isohybrid.
    * Note: boot.cat is automatically created.
    * Total size = 692492K. Space Used = 2956K.
  * Running inst-min-con-numlock.sh ...
    * After this operation, 4,381 kB of additional disk space will be used.
    * Install numlockx to turn on NumLock on boot.
    * Total size = 699024K. Space Used = 6532K.
  * Running inst-min-con-pciutils.sh ...
    * After this operation, 1,181 kB of additional disk space will be used.
    * Install pciutils to troubleshoot pci devices(i.e. lspci).
    * Total size = 700588K. Space Used = 1564K.
  * Running inst-min-con-snd-alsa.sh ...
    * After this operation, 5,270 kB of additional disk space will be used.
    * Install ALSA sound.
    * Test sound: aplay /usr/share/sounds/alsa/*.
    * Total size = 708436K. Space Used = 7848K.
  * Running inst-min-con-xtra-eject.sh ...
    * After this operation, 349 kB of additional disk space will be used.
    * Install eject to eject media disc(e.g. CD-ROM, DVD, etc).
    * Total size = 708608K. Space Used = 172K.
  * Running inst-min-con-xtra-fonts-asian.sh ...
    * After this operation, 48.2 MB of additional disk space will be used.
    * Install fonts-hanazono to display Asian characters correctly.
    * Test it by opening website http://ctext.org/zh.
    * Total size = 774584K. Space Used = 65976K.
  * Running inst-min-con-xtra-locate.sh ...
    * After this operation, 324 kB of additional disk space will be used.
    * Install locate to generate an index of files and directories.
    * You can updatedb and then locate files faster.
    * Total size = 775152K. Space Used = 568K.
  * Running inst-min-con-xtra-timezone.sh ...
    * Set time zone to EST (America/Montreal).
    * Total size = 775152K. Space Used = 0K.
  * Running inst-min-win-00-xorg.sh ...
    * After this operation, 73.0 MB of additional disk space will be used.
    * Set keyboard to use US international.
    * Install minimum Xorg X server.
    * Install xinit so you can run startx.
    * Add auto start window manager(i.e startx).
    * Total size = 869652K. Space Used = 94500K.
  * Running inst-min-win-01-wm-jwm.sh ...
    * After this operation, 6,665 kB of additional disk space will be used.
    * Install Window Manager: JWM.
    * Set jwmrc.
    * Total size = 879316K. Space Used = 9664K.
  * Running inst-min-win-menu.sh ...
    * After this operation, 1,829 kB of additional disk space will be used.
    * Install menu, an easy way to get installed programs in the menu automatically.
    * Total size = 880584K. Space Used = 1268K.
  * Running inst-min-win-systray-volumeicon-alsa.sh ...
    * After this operation, 41.8 MB of additional disk space will be used.
    * Install volume controller in system tray.
    * Set left-click to display volume slider: lmb_slider=true.
    * Total size = 909320K. Space Used = 28736K.
  * Running inst-std-accessories-galculator.sh ...
    * After this operation, 60.2 MB of additional disk space will be used.
    * Install Calculator: galculator.
    * Total size = 967528K. Space Used = 58208K.
  * Running inst-std-accessories-geeqie.sh ...
    * After this operation, 8,414 kB of additional disk space will be used.
    * Install Image Viewer: geeqie.
    * Total size = 976272K. Space Used = 8744K.
  * Running inst-std-accessories-gpicview.sh ...
    * After this operation, 876 kB of additional disk space will be used.
    * Install Image Viewer: gpicview.
    * Total size = 976612K. Space Used = 340K.
  * Running inst-std-accessories-mupdf.sh ...
    * After this operation, 12.0 MB of additional disk space will be used.
    * Install PDF reader: Mupdf.
    * Total size = 991956K. Space Used = 15344K.
  * Running inst-std-accessories-scite.sh ...
    * After this operation, 4,829 kB of additional disk space will be used.
    * After this operation, 221 kB of additional disk space will be used.
    * Install Text Editor: SciTE.
    * Install at-spi2-core to shut up Accessibility warning message.
    * Total size = 998500K. Space Used = 6544K.
  * Running inst-std-accessories-terminal-xfce.sh ...
    * After this operation, 11.1 MB of additional disk space will be used.
    * Install terminal: xfce4-terminal.
    * Total size = 1007828K. Space Used = 9328K.
  * Running inst-std-accessories-thunar.sh ...
    * After this operation, 12.2 MB of additional disk space will be used.
    * Install File Manger: thunar, thunar-media-tags-plugin, thunar-archive-plugin, thunar-volman.
    * Total size = 1014852K. Space Used = 7024K.
  * Running inst-std-accessories-xarchiver.sh ...
    * After this operation, 1,211 kB of additional disk space will be used.
    * Install Archive Manager: xarchiver.
    * Total size = 1016084K. Space Used = 1232K.
  * Running inst-std-graphic-pinta.sh ...
    * After this operation, 36.5 MB of additional disk space will be used.
    * Install Image Editor: Pinta.
    * Total size = 1077712K. Space Used = 61628K.
  * Running inst-std-internet-iceweseal.sh ...
    * After this operation, 82.4 MB of additional disk space will be used.
    * Total size = 1190852K. Space Used = 113140K.
  * Running inst-std-multimedia-mpv.sh ...
    * After this operation, 35.3 MB of additional disk space will be used.
    * Install Media Player: MPV.
    * Total size = 1238636K. Space Used = 47784K.
  * Running inst-std-office-libreoffice.sh ...
    * After this operation, 272 MB of additional disk space will be used.
    * After this operation, 42.3 MB of additional disk space will be used.
    * After this operation, 17.8 MB of additional disk space will be used.
    * Install Office Suite: Word processor - libreoffice-writer.
    * Install Office Suite: Spreadsheet - libreoffice-calc.
    * Install Office Suite: Presentation - libreoffice-impress.
    * Install Office Suite: Drawing - libreoffice-draw.
    * NOT install Office Suite: Database - libreoffice-base.
    * NOT install Office Suite: Equation - libreoffice-math.
    * Total size = 1657512K. Space Used = 418876K.
  * Running inst-std-system-conky.sh ...
    * After this operation, 967 kB of additional disk space will be used.
    * Install System Monitor: conky.
    * Set conkyrc.
    * Total size = 1658832K. Space Used = 1320K.
  * Running inst-std-system-disk-manager.sh ...
    * After this operation, 30.6 MB of additional disk space will be used.
    * Install Auto Mount Partition Manager: Disk Manager.
    * Total size = 1713504K. Space Used = 54672K.
  * Running inst-std-system-gnome-disk-utility.sh ...
    * After this operation, 11.4 MB of additional disk space will be used.
    * Install Partition Manager: gnome-disk-utility.
    * Total size = 1720316K. Space Used = 6812K.
  * Running inst-std-system-gparted.sh ...
    * After this operation, 17.3 MB of additional disk space will be used.
    * Install Partition Manager: gparted.
    * Total size = 1736256K. Space Used = 15940K.
  * Running inst-std-system-network-wicd.sh ...
    * After this operation, 8,474 kB of additional disk space will be used.
    * Install Network Manager: wicd.
    * For wireless, you have to type in the wireless interface(e.g. wlan0) in the Preferences.
    * Total size = 1749204K. Space Used = 12948K.
  * Running inst-xtra-dev-tools.sh ...
    * After this operation, 157 kB of additional disk space will be used.
    * After this operation, 884 kB of additional disk space will be used.
    * Install debconf-utils to use debconf-set-selections.
    * Install debtree to view dependencies of packages. Better package selections.
    * Total size = 1750240K. Space Used = 1036K.
  * Running inst-xtra-fuse.sh ...
    * After this operation, 567 kB of additional disk space will be used.
    * Install fuse(fusermount) to run TMSU.
    * Total size = 1751008K. Space Used = 768K.
  * Running inst-xtra-proxy.sh ...
    * Add proxy to /etc/environment and /etc/apt/apt.conf.d/proxy.
    * Total size = 1751016K. Space Used = 8K.
  * Running inst-xtra-sqlite.sh ...
    * After this operation, 143 kB of additional disk space will be used.
    * Install Database: sqlite3.
    * Total size = 1751288K. Space Used = 272K.
  * Running inst-xtra-virtualbox-guest-from-scratch.sh ...
    * After this operation, 201 MB of additional disk space will be used.
    * After this operation, 2,696 kB disk space will be freed.
    * After this operation, 69.3 MB disk space will be freed.
    * Install VirtualBox guest additions to Shared folder/clipboard, auto window scaling, etc.
    * Assumed packages installed: bzip2 & Xserver installed.
    * Install dkms, build-essential, linux-headers-3.16.0-4-amd64 to compile VirtualBox guest additions.
    * VirtualBox guest additions version:        4.3.20 installed.
    * Delete ./settings/binary/VBoxGuestAdditions.iso[56976K]. Space used could be negative due to this deletion.
    * Total size = 1898848K. Space Used = 147560K.
  * Running inst-xtra-wifite.sh ...
    * After this operation, 80.3 MB of additional disk space will be used.
    * Install wifite.
    * Total size = 1992192K. Space Used = 93344K.
  * Running inst-xtra-zfs.sh ...
    * After this operation, 99.3 kB of additional disk space will be used.
    * After this operation, 43.0 MB of additional disk space will be used.
    * Install lsb-release.
    * Add zfsonlinux repository to /etc/apt/sources.list.d/zfsonlinux.list.
    * Add GPG key to /etc/apt/trusted.gpg.d/zfsonlinux.gpg.
    * Install debian-zfs.
    * Delete ./settings/binary/zfsonlinux_6_all.deb[1992K].
    * Total size = 2078596K. Space Used = 86404K.
  * Running inst-zclean-00-zerosizing-docs.sh ...
    * Zero size all documents in /usr/share/.
    * Total size = 2001120K. Space Used = -77476K.
  * Running inst-zclean-99-end-cleanup.sh ...
    * Clean apt-get cache.
    * rm -rf /tmp/*.
    * Umount /sys, /dev/pts and /proc.
    * Add http://http.debian.net/debian/ in sources.list.
    * Total size = 1547052K. Space Used = -454068K.
