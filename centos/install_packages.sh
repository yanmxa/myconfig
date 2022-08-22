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




