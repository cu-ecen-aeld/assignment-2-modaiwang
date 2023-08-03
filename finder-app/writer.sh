#!/bin/bash

# 允许以下参数：第一个参数是一个文件的全路径writefile，第二个参数是要写入文件的字符串writestr

# 当任一参数没有设定的时候返回错误1，并输出提示
# 创建一个新文件writefile，并写入内容writestr，覆写任意存在的文件
# 如果文件无法被创建返回错误1，并输出提示

# 1. 校验参数
if [[ ! $# -eq 2 ]]; then
    echo "the number of arguments must be two!"
    exit 1
fi

writefile=$1
writestr=$2

# 2. 创建文件并写入内容
if [[ ! -d $(dirname "$writefile") ]]; then
    mkdir -p "$(dirname "$writefile")"
fi
if [[ ! -e $writefile ]]; then
    touch "$writefile"
fi
if [[ $? -eq 1 ]]; then
    echo "$writefile create error, please check it."
    exit 1
fi
echo "$writestr" > "$writefile"
exit 0