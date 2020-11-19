#!/bin/bash
# https://www.jenkins.io/doc/book/installing/linux/
# calls script to install java runtime
source install-java-8-runtime-lts.sh
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins
# calls post install script
source post-install.sh