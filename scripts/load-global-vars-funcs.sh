#!/bin/bash

#########################################################
# All export variables and functions
# NOTE: Exporting a variable doesn't make it available to parent processes. Use source.
# Reference: http://stackoverflow.com/a/1158231
#########################################################

# Prefix this variable in echo to log echoed string. CLDS stands for Custom Live Debian System.
export GV_LOG="CLDS:"

# Use to exchange value variables between different script.
export G_VALUES_FILE=load-global-values.txt

# Log total size
GF_LOG_TOTAL_SIZE ()
{
  # Load previous total size.
  . ${G_VALUES_FILE}
  
  # Get current total size.
  CURRENT_TOTAL_SIZE=$(du -s --exclude=/proc / | head -n 1 | cut -f1)
  
  # Calculate space used.
  if [[ -z "${PREV_TOTAL_SIZE}" ]]; then PREV_TOTAL_SIZE=0; fi
  SPACE_USED=$((${CURRENT_TOTAL_SIZE}-${PREV_TOTAL_SIZE}))
  
  # Log total size.
  echo "${GV_LOG} * Total size = ${CURRENT_TOTAL_SIZE}K. Space Used = ${SPACE_USED}K."
  
  # Update previous total size.
  echo "PREV_TOTAL_SIZE=${CURRENT_TOTAL_SIZE}" > ${G_VALUES_FILE}
}

export -f GF_LOG_TOTAL_SIZE

