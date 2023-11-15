yum install gcc yum-utils zlib-devel python-tools cmake git pkgconfig -y --skip-broken
yum groupinstall -y "Development Tools" --skip-broken

yum install libffi-devel bzip2-devel -y

wget https://www.python.org/ftp/python/3.11.3/Python-3.11.3.tgz
tar xzf Python-3.11.3.tgz
./configure

make
make install
python3 --version

# whereis python 
# 做个软链接 
# ln -s /usr/bin/python3.6 /usr/bin/python 