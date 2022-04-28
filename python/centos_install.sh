sudo dnf install python3

# 查看python文件路径
whereis python 
# python: /usr/bin/python3.6 /usr/bin/python3.6m /usr/bin/python3.6-config /usr/bin/python3.6m-config /usr/bin/python3.6m-x86_64-config /usr/bin/python /usr/lib/python3.6 /usr/lib64/python3.6 /usr/local/lib/python3.6 /usr/include/python3.6m /usr/share/man/man1/python.1.gz

# 做个软链接 
ln -s /usr/bin/python3.6 /usr/bin/python 