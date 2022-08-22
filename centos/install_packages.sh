#!/bin/bash

# sudo su -
# sudo yum install make vim gcc git wget jq -y 
# ssh-keygen -t rsa
# git clone git@github.com:yanmxa/myconfig.git

echo "Installing python3"
sudo dnf install python3 -y
whereis python # 查看python文件路径
ln -s /usr/bin/python3.6 /usr/bin/python # 做个软链接 

echo "Installing docker"
# sudo yum remove -y docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux  docker-engine-selinux docker-engine 
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sleep 5
sudo systemctl start docker
sudo systemctl enable docker

echo "Installing zsh"
sudo yum install -y zsh
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# autojump
cd $ZSH_CUSTOM/plugins
git clone https://github.com/joelthelion/autojump.git
cd autojump
python3 install.py 

echo "source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
echo "source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
echo '[[ -s /root/.autojump/etc/profile.d/autojump.sh ]] && source /root/.autojump/etc/profile.d/autojump.sh' >> ~/.zshrc
echo 'autoload -U compinit && compinit -u' >> ~/.zshrc
sed -i 's/^ZSH_THEME=\(.*\)/ZSH_THEME="lukerandall"/' ~/.zshrc # theme

sudo dnf install util-linux-user -y
chsh -s $(which zsh)

# sed -i 's/^plugins=(\(.*\)/plugins=(autojump zsh-autosuggestions zsh-syntax-highlighting \1/' ~/.zshrc
# [[ -s /root/.autojump/etc/profile.d/autojump.sh ]] && source /root/.autojump/etc/profile.d/autojump.sh
# autoload -U compinit && compinit -u
# test: j --stat 

# install myconfig
echo "Installing myconfig alias"
cd $HOME
# git clone git@github.com:yanmxa/myconfig.git $HOME/myconfig
echo "source $HOME/myconfig/alias/public" >> ~/.zshrc

git config --global user.name myan
git config --global user.email "myan@redhat.com"

echo "install succussfully"



# # set root password
# passwd root

# # update /etc/ssh/sshd_config
# PermitRootLogin yes
# PasswordAuthentication yes

# service sshd reload

# cp ~ec2-user/.ssh/authorized_keys ~root/.ssh/authorized_keys

# # update /etc/cloud/cloud.cfg
# disable_root false




