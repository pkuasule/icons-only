#!/bin/bash

# 0. Get full path of this script file √
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

cd ${SCRIPTPATH}

# output increments
diff index_fetch.txt index.txt > increments.txt

cat <<EOF >> index.txt
EOF