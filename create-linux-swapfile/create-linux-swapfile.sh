#!/bin/bash
sudo dd if=/dev/zero of=/swapfile bs=128M count=32
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo swapon -s
echo "add the next line to : /etc/fstab "
echo "/swapfile swap swap defaults 0 0"
# sudo vi /etc/fstab
echo "" | sudo tee -a /etc/fstab
echo "/swapfile swap swap defaults 0 0" | sudo tee -a /etc/fstab