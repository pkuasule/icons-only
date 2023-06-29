#!/bin/bash

function convert_svg() {
    # 重命名扩展名为.vue
    mv "$1" "${1%.svg}.vue"  

    # 读取.vue文件内容
    content=$(cat "${1%.svg}.vue")

    # 删除<svg>标签前的所有内容
    content="${content#*<svg}"
    
    # 补充<svg标签
    content="<svg $content"

    # 在开头添加<template>
    content="<template>$content"

    # 在末尾添加</template>
    content="$content</template>"

    # 使用 sed 命令删除文件中的 width 属性
    content=$(echo "$content" | sed 's/width="[^"]*"//g')

    # 将修改后的内容写入文件
    echo "$content" > "${1%.svg}.vue"
}

# 遍历所有文件,包括子目录
for file in $(find . -type f); do
  
  # 检查是否为svg文件
  if [[ $file == *.svg ]]; then
    
    # 传递文件路径参数
    convert_svg "$file" 
    
  fi  
done