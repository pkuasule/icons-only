#!/bin/bash

# 0. Get full path of this script file √
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
echo -e "\033[34m【ICONS-ONLY】\033[0mDetected script path as ${SCRIPTPATH}."

# 1. clean up √
if [ -d "${SCRIPTPATH}/icons-pdf" ]; then
  rm -r "${SCRIPTPATH}/icons-pdf"
  echo -e "\033[34m【ICONS-ONLY】\033[0mRemoved old /icons-pdf folder."
else
  echo -e "\033[34m【ICONS-ONLY】\033[0mNo old /icons-pdf folder found."
  echo -e "\033[34m【ICONS-ONLY】\033[0mNow create a new one."
fi

# 2. 用curl下载zip文件 √
echo -e "\033[34m【ICONS-ONLY】\033[0mDownload zip file from https://github.com/pkuasule/icons-only/archive/refs/heads/main.zip"
curl -L https://github.com/pkuasule/icons-only/archive/refs/heads/main.zip -o ${SCRIPTPATH}/icons-only-main.zip
echo -e "\033[34m【ICONS-ONLY】\033[0mDownload complete."


# 3. 解压zip文件
echo -e "\033[34m【ICONS-ONLY】\033[0mUnziping..."
echo -e 'A' | unzip -qq ${SCRIPTPATH}/icons-only-main.zip -d ${SCRIPTPATH}

# 4. 移动icons-pdf文件夹
echo -e "\033[34m【ICONS-ONLY】\033[0mMove the downloaded /icons-pdf into the same folder as the current script."
mv ${SCRIPTPATH}/icons-only-main/icons-pdf ${SCRIPTPATH}/icons-pdf

# 5. 删除icons-only-main文件夹
echo -e "\033[34m【ICONS-ONLY】\033[0mRemove the unused folder and zip file."
rm -r ${SCRIPTPATH}/icons-only-main

# 6. 删除zip文件 
rm ${SCRIPTPATH}/icons-only-main.zip

echo -e "\033[34m【ICONS-ONLY】\033[32mScript successfully exetuted.\033[0m"