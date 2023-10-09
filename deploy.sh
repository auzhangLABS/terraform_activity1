#!/bin/bash
# This script will download Jenkins, unzip, Python 3.10, the Python 3.10 environment, the Python package installer, and the Java Run time environment.

# Getting the latest update
sudo apt-get update

# installing python 3.10 and unzip 
sudo apt-get install -y python3.10 unzip

# installing python 3.10 environment and python package installer
sudo apt-get install -y python3.10-venv python3-pip

# Getting the Jenkins key and storing it, then outputing the command
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \/usr/share/keyrings/jenkins-keyring.asc >/dev/null

# reading the key and allowing you to install Jenkins
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \https://pkg.jenkins.io/debian binary/ | sudo tee \/etc/apt/sources.list.d/jenkins.list > /dev/null

# getting updates after getting Jenkins keys
sudo apt-get update

# installing Java Runtime Environment 
sudo apt-get -y install fontconfig openjdk-17-jre

# installing Jenkins
sudo apt-get -y install jenkins
