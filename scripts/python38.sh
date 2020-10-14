# !/bin/bash

######################################################################
# python3.8 - (Install this as root user)
######################################################################

sudo apt update -y
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev -y

# download latest
curl -O https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tar.xz

# untar
tar -xf Python-3.8.2.tar.xz

cd Python-3.8.2
./configure --enable-optimizations

make -j $(nproc)

# Do not use the standard make install as it will overwrite the default system python3 binary.
sudo make altinstall

# cleanup
cd ..
sudo rm -rf Python-3.8.2
sudo rm -rf Python-3.8.2.tar.xz
