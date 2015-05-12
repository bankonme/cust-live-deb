#!/bin/bash
# Description: Extract chroot/root/scripts/install.log.ran and put logged info in README.md
#   Script name will be the root level list.
#   Logged line in script will be nested to the root level ist.

README=README.md
cp ${README} ${README}.bck

PLACEHOLDER="# What are in ISO"
sed "/${PLACEHOLDER}/,/ISO/d" ${README}.bck > ${README}

echo ${PLACEHOLDER} >> ${README}
grep "CLDS:" chroot/root/scripts/install.log.ran | \
   sed 's/^CLDS: \*/CLDS:    */' |\
   sed 's/^CLDS://' |\
   sed -r 's/^>+ /  * /' >> ${README}
   
rm -f ${README}.bck

echo "${README} updated."