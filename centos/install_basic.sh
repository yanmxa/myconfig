#!/bin/bash

# create a user with root permission: https://docs.rackspace.com/docs/create-sudo-user-in-centos
# centos server 
adduser newuser
passwd newuser

visudo
## Allow root to run any commands anywhere
root    ALL=(ALL)       ALL
newuser ALL=(ALL)       NOPASSWD:ALL

# Verify permission change
su - newuser
sudo -i

# macos client
# 配置免密登录： ssh-copy-id -i ~/.ssh/id_rsa.pub newuser@host

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

# sudo yum update && sudo yum install cmake git -y 
# git clone https://github.com/yanmxa/myconfig.git

# install basic tool
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  Installing gcc wget jq curl >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
sudo yum install gcc wget jq curl vim cmake git -y 
# yum install gcc wget git yum-utils cmake jq curl vim -y --skip-broken

# yum update

# echo "Installing python3"
# sudo yum install python3 -y
# whereis python # 查看python文件路径
# ln -s /usr/bin/python3.6 /usr/bin/python # 做个软链接 



git clone https://github.com/yanmxa/myconfig.git
cd myconfig

# git clone git@github.com:yanmxa/myconfig.git $HOME/myconfig
# git config --global user.name myan
# git config --global user.email "myan@redhat.com"

# go_version="${GO_VERSION:-go1.21.7}"

# echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  Install golang: $go_version >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
# wget https://dl.google.com/go/${go_version}.linux-amd64.tar.gz
# sudo rm -rf /usr/local/go && sudo tar -C /usr/local/ -xvf ${go_version}.linux-amd64.tar.gz 
# sudo rm ${go_version}.linux-amd64.tar.gz
# sudo echo  "export PATH=$PATH:/usr/local/go/bin" >> ~/.environment
# source ~/.environment

# go version

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  Install kubectl and oc >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
wget https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz
tar xvzf oc.tar.gz
sudo mv ./oc /usr/bin/oc
# sudo mv ./kubectl /usr/bin/kubectl
sudo rm oc.tar.gz -f
sudo rm README.md -f

echo "This script will install kubectl (https://kubernetes.io/docs/tasks/tools/install-kubectl/) on your machine"
if [[ "$(uname)" == "Linux" ]]; then
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.28.1/bin/linux/amd64/kubectl
elif [[ "$(uname)" == "Darwin" ]]; then
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.28.1/bin/darwin/amd64/kubectl
fi
chmod +x ./kubectl
sudo rm /usr/bin/kubectl
sudo mv ./kubectl /usr/bin/kubectl

# echo "installing zsh"
# sudo yum install -y zsh
# sudo dnf install util-linux-user -y
# sudo chsh -s $(which zsh)
# sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

# echo "install pip3 install Pygments"
# sudo pip3 install Pygments

# echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  Install KinD >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
# go install sigs.k8s.io/kind@v0.22.0
# sudo echo  "export PATH=$PATH:$(go env GOPATH)/bin" >> ~/.environment
# source ~/.environment
# kind version

# echo "install succussfully"

# source ~/.environment


# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.26.0/kind-linux-amd64
# For ARM64
[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.26.0/kind-linux-arm64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind