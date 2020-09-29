################################################################################
# Swap Memory
################################################################################

# Create the swapfile (2048MB)
sudo dd if=/dev/zero of=/swapfile bs=128M count=32

# Set permissions
sudo chmod 600 /swapfile

# Make the swap file
sudo mkswap /swapfile

# mount the swap file
sudo swapon /swapfile

# idk what this is
sudo swapon -s

# set the swap memory every time OS boots up.
sudo su -c "echo /swapfile swap swap defaults 0 0 >> /etc/fstab"
