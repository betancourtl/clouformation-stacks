#!/bin/bash

######################################################################
# create user with ssh key
######################################################################

USER_NAME="luis"

# admin - Create jenkins user
sudo adduser --disabled-password --gecos "" $USER_NAME

sudo usermod -aG sudo $USER_NAME

# admin - Change to jenkins user
sudo su $USER_NAME

# jenkins - Change to home
cd ~

# jenkins - Generate ssh keys
ssh-keygen -t rsa -C "$USER_NAME@$HOSTNAME" -f ~/.ssh/id_rsa -q -P ""

# Create files to enable ssh access to this and other hosts.
touch ~/.ssh/authorized_keys ~/.ssh/known_hosts

# Only rw permissions for owner
cd ~/.ssh && chmod 600 *

# jenkins
exit
