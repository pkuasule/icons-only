#!/bin/bash

# 检查是否安装了 svglib
if ! command -v svg2pdf &> /dev/null; then
  echo "svglib not found. Installing..."
  pip install svglib
fi

# 复制当前文件夹下的所有内容到 ../icons-pdf 中，并进入该文件夹
mkdir -p ../icons-pdf
cp -r ./* ../icons-pdf/
cd ../icons-pdf

# 删除 gen-svgicon-list.py 文件
rm gen-svgicon-list.py

# 获取当前目录及其子目录下所有的 .svg 文件总数
total=$(find . -type f -name "*.svg" | wc -l)
count=0

# 递归遍历当前目录及其子目录下所有的 .svg 文件，并将其转换为 .pdf 格式
find . -type f -name "*.svg" | while read file; do
  # 对于每个 .svg 文件，运行 svg2pdf 命令将其转换为 .pdf 格式
  svg2pdf "$file"

  # 删除当前文件夹中以及所有子文件夹中的每一个 .svg 文件
  rm "$file"

  # 更新进度计数器
  ((count++))

  # 计算进度百分比并输出进度信息
  progress=$(echo "scale=2; $count * 100 / $total" | bc)
  echo -ne "Progress: $progress% ($count/$total)\r"
done

# 更改终端文本颜色为绿色，并显示 "Done."
echo -e "\n\033[32mDone.\033[0m"
