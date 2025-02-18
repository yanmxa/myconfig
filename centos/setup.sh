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
echo ">>>>>>>>>>>>>>>>>> Verifying default shell >>>>>>>>>>>>>>>>>"
echo $SHELL

echo ">>>>>>>>>>>>>>>>>> Installing oh-my-zsh >>>>>>>>>>>>>>>>>"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

echo ">>>>>>>>>>>>>>>>>> Configuring zsh >>>>>>>>>>>>>>>>>"
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

echo ">>>>>>>>>>>>>>>>>> Installing zsh plugins >>>>>>>>>>>>>>>>>"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i 's/plugins=(.*)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

echo ">>>>>>>>>>>>>>>>>> Changing theme to cloud >>>>>>>>>>>>>>>>>"
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="robbyrussell"/' ~/.zshrc

echo ">>>>>>>>>>>>>>>>>> Applying changes >>>>>>>>>>>>>>>>>"
source ~/.zshrc

echo ">>>>>>>>>>>>>>>>>> Zsh setup completed! >>>>>>>>>>>>>>>>>"

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
