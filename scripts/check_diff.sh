#!/bin/bash

# 0. Get full path of this script file √
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
echo -e "\033[34m【ICONS-ONLY】\033[0mDetected script path as ${SCRIPTPATH}."

cd ${SCRIPTPATH}

# output increments
diff index_fetch.txt index.txt > increments.txt