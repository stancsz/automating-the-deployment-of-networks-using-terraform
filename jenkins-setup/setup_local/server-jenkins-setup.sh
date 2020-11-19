#!/bin/bash
# This shell script is intended for ubuntu/debian https://pkg.jenkins.io/debian-stable/
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo "" | sudo tee -a /etc/apt/sources.list
echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee -a /etc/apt/sources.list
sudo apt-get update
# configure runtime required by jenkins
source install-java-8-runtime.sh
sudo apt-get install -y jenkins