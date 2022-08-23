#!/bin/bash

# sudo su -
# sudo yum install git vim make -y 
# ssh-keygen -t rsa

# # set root password for aws
# passwd root
# # vim /etc/ssh/sshd_config
# PermitRootLogin yes
# PasswordAuthentication yes
# service sshd reload
# cp ~ec2-user/.ssh/authorized_keys ~root/.ssh/authorized_keys
# # vim /etc/cloud/cloud.cfg
# disable_root false

# git clone git@github.com:yanmxa/myconfig.git


sudo yum install gcc wget jq -y 

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

# git clone git@github.com:yanmxa/myconfig.git $HOME/myconfig
git config --global user.name myan
git config --global user.email "myan@redhat.com"

echo "install golang"
wget https://dl.google.com/go/go1.18.4.linux-amd64.tar.gz
sudo tar -C /usr/local/ -xvf go1.18.4.linux-amd64.tar.gz 
sudo rm go1.18.4.linux-amd64.tar.gz

echo "install kubectl and oc"
wget https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz
tar xvzf oc.tar.gz
mv kubectl /usr/bin/kubectl
mv oc /usr/bin/oc
rm oc.tar.gz -f
rm README.md -f

echo "install succussfully"







