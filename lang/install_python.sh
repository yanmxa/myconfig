yum install gcc yum-utils zlib-devel python-tools cmake git pkgconfig -y --skip-broken
yum groupinstall -y "Development Tools" --skip-broken

wget https://www.python.org/ftp/python/3.11.3/Python-3.11.3.tgz
tar xzf Python-3.11.3.tgz
./configure

make
make install
python3 --version