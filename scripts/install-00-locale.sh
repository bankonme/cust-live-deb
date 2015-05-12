SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
LOG="CLDS:" 
echo "${LOG}>>>>>>>>> Running ${SCRIPT_NAME} ..."

SETTINGS_DIR=settings

### Setup debconf parameters
export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true DEBCONF_DEBUG=developer

#### Install locale
# -http://stackoverflow.com/a/20693661
apt-get -y --force-yes install locales

LOCALE_GEN=/etc/locale.gen
cp -n ${LOCALE_GEN} ${LOCALE_GEN}.bck
echo "en_US.UTF-8 UTF-8" >> ${LOCALE_GEN}
/usr/sbin/locale-gen

# So that `cat /etc/default/locale` gives LANG=en_US.UTF-8. 
update-locale LANG=en_US.UTF-8

# Add locale environment variables
cat ${SETTINGS_DIR}/locale-env-vars.txt >> /root/.bashrc
source /root/.bashrc

### Gave up on these:
# debconf-set-selections ${SETTINGS_DIR}/locale-config.seed
# dpkg-reconfigure locales

### Install localepurge to keep locale small
apt-get -y --force-yes install localepurge
debconf-set-selections ${SETTINGS_DIR}/localepurge-config.seed
dpkg-reconfigure localepurge


# Log
echo "${LOG} * Setup locale to use en_US.UTF-8."
echo "${LOG} * Install localepurge to purge non-UTF-8."

### Test

# Debug
# cat /etc/default/locale
# cat /etc/locale.nopurge
# cat /etc/locale.gen


# References:
# -https://people.debian.org/~schultmc/locales.html
# -http://perlgeek.de/en/article/set-up-a-clean-utf8-environment
# /etc/default/locale
# -http://superuser.com/questions/715722/how-to-do-dpkg-reconfigure-dash-as-bash-automatically
# -http://blog.nutsfactory.net/2008/03/06/noninteractive-dpkg-installation-on-debian-system/

# update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 LC_TIME=en_US.UTF-8 LC_CTYPE=en_US.UTF-8
#   Explained: https://wiki.gentoo.org/wiki/Localization/HOWTO#Environment_variables_for_locales