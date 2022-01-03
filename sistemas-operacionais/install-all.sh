#!/bin/bash

# Basicos
sudo apt update
sudo apt upgrade -y
sudo apt install build-essential default-jdk-headless maven python3 python-is-python3 python3-pip git htop curl wget -y

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source /home/$USER/.bashrc
nvm install --lts=Dubnium
nvm install --lts=Erbium
nvm install --lts=Fermium
nvm install --lts

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh ./get-docker.sh
sudo groupadd docker
sudo usermod -aG docker $USER
echo "sudo service docker start" | tee -a ~/.bashrc
echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee -a "/etc/sudoers.d/$USER"
alias dockerps="docker ps -a"

# Limpeza
sudo apt autoremove
sudo apt autoclean
sudo apt clean
sudo apt clean cache
exit