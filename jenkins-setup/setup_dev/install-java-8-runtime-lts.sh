#!/bin/bash
# https://stackoverflow.com/questions/49937743/install-jenkins-in-ubuntu-18-04-lts-failed-failed-to-start-lsb-start-jenkins-a
sudo apt update
sudo apt search openjdk
sudo apt install openjdk-8-jdk

echo "===== NOTE ====="
echo "make sure java version match: "
echo openjdk version "1.8.0_252"
echo "OpenJDK Runtime Environment (build 1.8.0_252-8u252-b09-1ubuntu1-b09)"
echo "OpenJDK 64-Bit Server VM (build 25.252-b09, mixed mode)"
echo "===== Check: ====="
java -version
read -p "Press enter to continue"