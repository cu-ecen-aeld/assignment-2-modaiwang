#!/bin/bash

# 运行参数：第一个是一个目录路径filesdir，第二个是在这些文件中搜索的文本searchstr

# 如果任一参数没有被设定，则返回错误1，打印语句
# 如果filesdir不存在，返回错误1，打印语句
# 打印语句"The number of files are X and the number of matching lines are Y"，其中X是目录和所有子目录中的文件，Y是在相关文件中找到的匹配的行

# 1. 判断参数
if [[ ! $# -eq 2 ]]; then
    echo 'the number of arguments must be two!!'
    exit 1
fi

# 2. 读取参数
filesdir=$1
searchstr=$2

# 3. 判断目录存在与否
if [[ ! -d $filesdir ]]; then
   echo "$filesdir not exist, please check it then rerun."
   exit 1 
fi

# 统计文件个数，并打印语句
X=$(ls -lR "$1"|grep -c "^-")
Y=$(find "$1" -type f -exec grep "$searchstr" {} \;|wc -l)
echo "The number of files are $X and the number of matching lines are $Y"
exit 0