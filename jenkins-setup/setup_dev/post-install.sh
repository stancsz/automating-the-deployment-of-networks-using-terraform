#!/bin/bash
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo vi /var/lib/jenkins/secrets/initialAdminPassword