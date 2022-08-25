#! /bin/bash
sudo apt-get update
sudo apt-get remove docker docker.io containerd runc
sudo apt install -y  apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt update
sudo apt -y install docker-ce
sudo adduser ubuntu docker
