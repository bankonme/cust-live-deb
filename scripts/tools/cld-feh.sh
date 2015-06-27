#!/bin/bash
# Description: Play slideshow of pictures and continue where you left off.
#              You have to press ENTER to mark your position.

FILELIST=$1
if [ -e ${FILELIST}.last ];
then
  LAST_LINE=$(tail -n 1 ${FILELIST}.last)
  sed -i "1,${LAST_LINE}d" ${FILELIST}.tmp
else
  if [ ! -e ${FILELIST}.tmp ];
  then
    cp ${FILELIST} ${FILELIST}.tmp
  fi
fi

# If ENTER is not pressed, then ${FILELIST}.tmp will not shrink.
rm -f ${FILELIST}.last


feh -d -Y -F -D 1.5 -f ${FILELIST}.tmp -A "echo %u > ${FILELIST}.last"
