#!/bin/bash

######################################################################
# nginx
######################################################################

# Allows us to create an nginx build
echo Y | sudo apt install build-essentials

echo Y | sudo apt install libpcre3 libpcre3-dev zlib1g zlib1g-dev libssl-dev

# Download nginx
wget http://nginx.org/download/nginx-1.17.9.tar.gz

# untar nginx
tar -zxvf nginx-1.17.9.tar.gz

# configure
cd nginx-1.17.9

# build nginx
./configure \
  --sbin-path=/usr/bin/nginx \
  --conf-path=/etc/nginx/nginx.conf \
  --error-log-path=/var/log/nginx/error.log \
  --http-log-path=/var/log/nginx/access.log \
  --pid-path=/var/run/nginx.pid \
  --with-pcre \
  --with-http_ssl_module

# compile the configuration
make

# Install the compiled nginx service
sudo make install

# remove installation files
rm -rf nginx-1.17.9

# Create the systemd files for sending signals to our service.
echo "Description=The NGINX HTTP and reverse proxy server
After=syslog.target network.target remote-fs.target nss-lookup.target

[Service]
Type=forking
PIDFile=/run/nginx.pid
ExecStartPre=/usr/sbin/nginx -t
ExecStart=/usr/sbin/nginx
ExecReload=/usr/sbin/nginx -s reload
ExecStop=/bin/kill -s QUIT $MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target" > sudo /lib/systemd/system/nginx.service

