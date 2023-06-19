#!/bin/bash

# 0. Get full path of this script file √
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
echo -e "\033[34m【ICONS-ONLY】\033[0mDetected script path as ${SCRIPTPATH}."

cd ${SCRIPTPATH}

cd ..

cd icons-pdf

# Create the index.txt file
cat <<EOF > index_new.txt  
EOF

# Write the directory listing 
for file in $(find . -type f -and -not -name "*.html" -and -not -name "*.sh" -and -not -name "*.py" | sort | grep -v -e ".DS_Store"); do
    if [[ -d "$file" ]]; then
        # Write the directory name as a line
        echo "$file/" >> index_new.txt
else   
         # Write the file name as a line
        echo "$file" >> index_new.txt
    fi    
done   

# Write the footer
cat <<EOF >> index_new.txt
EOF

if cmp -s index_new.txt index.txt
then
    # 代码块 A
    echo -e "\033[34m【ICONS-ONLY】\033[32m../icons-pdf/index_new.txt and ../icons-pdf/index.txt has the same content.\033[0m"
    rm index_new.txt
else
    # 代码块 B
    echo -e "\033[34m【ICONS-ONLY】\033[0m../icons-pdf/index_new.txt and ../icons-pdf/index.txt DOES NOT have the same content."
    rm index.txt
    mv index_new.txt index.txt
    cd ..
    # 获取当前日期和时间，格式为yyyyMMddhhmmss
    DATE=$(date +%Y%m%d%H%M%S)

    # 读取第一行并打印,随后删除第一行
    FIRST_LINE=$(head -1 README.md)  
    sed '1d' README.md > README.md_tmp

    # 将README.md_tmp重命名为README.md  
    mv README.md_tmp README.md  

    # 在README.md第一行插入新内容
    echo "Version: $DATE" | cat - README.md > README.md_tmp 
    mv README.md_tmp README.md


    echo -e "\033[34m【ICONS-ONLY】\033[0mOld index succussfully updated."
fi
