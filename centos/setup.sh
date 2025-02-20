#!/bin/bash

# Install docker
if ! command -v docker &>/dev/null; then
  echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  Installing Docker >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

  # Install necessary dependencies
  sudo yum install -y yum-utils device-mapper-persistent-data lvm2

  # Add Docker repo to yum
  sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

  # Install Docker
  sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

  # Start Docker service and enable it on boot
  sudo systemctl start docker
  sudo systemctl enable docker

  # Adjust permissions for Docker socket
  sudo chmod 666 /var/run/docker.sock

  echo "Docker installation complete."
else
  echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  Docker is already installed >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
fi

# oh-my-zsh
echo ">>>>>>>>>>>>>>>>>> Install oh-my-zsh >>>>>>>>>>>>>>>>>"
echo $SHELL

echo "Installing oh-my-zsh"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

echo "Configuring zsh"
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

echo "Installing zsh plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i 's/plugins=(.*)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

sed -i 's/ZSH_THEME=".*"/ZSH_THEME="robbyrussell"/' ~/.zshrc

source ~/.zshrc

echo ">>>>>>>>>>>>>>>>>> Install tmux >>>>>>>>>>>>>>>>>"

# tmux
sudo yum install libevent-devel -y
sudo yum install ncurses-devel -y
sudo yum install byacc -y

wget https://github.com/tmux/tmux/releases/download/3.5/tmux-3.5.tar.gz
tar xzvf tmux-3.5.tar.gz
cd tmux-3.5
./configure
make && sudo make install
cd ..
rm tmux-3.5.tar.gz

# after installing
mv ~/.tmux.conf ~/.tmux.conf.bak
cp tmux/tmux.conf ~/.tmux.conf

# clone tmux plugin
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Reload TMUX environment so TPM is sourced:
# type this in terminal if tmux is already running
# tmux source ~/.tmux.conf

# Installing plugins
# Add new plugin to ~/.tmux.conf with set -g @plugin '...'
# Press `prefix + I`

# Uninstalling plugins
# Remove (or comment out) plugin from the list.
# Press `prefix + alt + u` (lowercase u as in uninstall) to remove the plugin.
# All the plugins are installed to ~/.tmux/plugins/ so alternatively you can find plugin directory there and remove it.

echo ">>>>>>>>>>>>>>>>>> Install golang >>>>>>>>>>>>>>>>>"

wget https://dl.google.com/go/go1.24.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.24.0.linux-amd64.tar.gz
sudo rm go1.24.0.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >>~/.zshrc
source ~/.zshrc

echo ">>>>>>>>>>>>>>>>>> Install KinD >>>>>>>>>>>>>>>>>"
# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.27.0/kind-linux-amd64
# For ARM64
[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.27.0/kind-linux-arm64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
