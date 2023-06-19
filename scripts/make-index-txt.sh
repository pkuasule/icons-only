#!/bin/bash
# find命令的参数设定至关重要。如果find命令的检测范围太广,后续的grep过滤器将无法完全排除某些文件,导致最终结果不尽人意。必须加深对find各参数和作用的理解。
# 多个grep过滤器的串联使用以实现排除多种模式的文件。

# 0. Get full path of this script file √
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
echo -e "\033[34m【ICONS-ONLY】\033[0mDetected script path as ${SCRIPTPATH}."

cd ${SCRIPTPATH}

# Create the index.txt file
cat <<EOF > index.txt  
EOF

# Write the directory listing 
for file in $(find . -type f -and -not -name "*.html" -and -not -name "*.sh" -and -not -name "*.py" | sort | grep -v -e ".DS_Store"); do
    if [[ -d "$file" ]]; then
        # Write the directory name as a line
        echo "$file/" >> index.txt
    else   
         # Write the file name as a line
        echo "$file" >> index.txt
    fi    
done   

# Write the footer
cat <<EOF >> index.txt
EOF