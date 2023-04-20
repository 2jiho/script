#/bin/bash
# ---------------------------------------------------------------------------------
# install openssh-server, docker, nvidia-docker, wireguard, nomachine, tailscale
# Disable automatic printer search
# ---------------------------------------------------------------------------------

# Disable automatic printer search
sudo systemctl stop cups-browsed
sudo systemctl disable cups-browsed


sudo apt update
sudo apt upgrade -y
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    openssh-server \
    wireguard \
    resolvconf
    
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
wget https://download.nomachine.com/download/8.4/Linux/nomachine_8.4.2_1_x86_64.tar.gz
sudo mv nomachine_8.4.2_1_x86_64.tar.gz /usr
cd /usr
sudo tar zxvf nomachine_8.4.2_1_x86_64.tar.gz
sudo /usr/NX/nxserver --install

# install tailscale
curl -fsSL https://tailscale.com/install.sh | sh
