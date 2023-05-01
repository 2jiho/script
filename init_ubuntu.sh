#!/bin/bash
# ---------------------------------------------------------------------------------
# install openssh-server, docker, nvidia-docker, wireguard, nomachine, tailscale
# Disable automatic printer search
# Disable apport (ubuntu error report)
# ---------------------------------------------------------------------------------

# Disable automatic printer search
sudo systemctl stop cups-browsed
sudo systemctl disable cups-browsed

# Disable apport
sudo sed -i 's/enabled=1/enabled=0/' /etc/default/apport

sudo apt update
sudo apt upgrade -y
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    openssh-server \
    wireguard \
    resolvconf \
    vlc
    
# install docker
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER

# install nvidia-docker
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
      && curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
      && curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
            sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
            sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt update
sudo apt install -y nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker

# install nomachine
wget https://www.nomachine.com/free/linux/64/tar -O nomachine.tar.gz
sudo mv nomachine.tar.gz /usr
cd /usr
sudo tar zxvf nomachine.tar.gz
sudo /usr/NX/nxserver --install

# install tailscale
curl -fsSL https://tailscale.com/install.sh | sh
