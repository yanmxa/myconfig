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

# 配置免密登录： ssh-copy-id -i ~/.ssh/id_rsa.pub user@ip

# before:

# sudo yum update && sudo yum install cmake git -y 
# git clone https://github.com/yanmxa/myconfig.git

# install basic tool
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  Installing gcc wget jq curl >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
sudo yum install gcc wget jq curl vim -y 
# yum install gcc wget git yum-utils cmake jq curl vim -y --skip-broken

# yum update

# echo "Installing python3"
# sudo yum install python3 -y
# whereis python # 查看python文件路径
# ln -s /usr/bin/python3.6 /usr/bin/python # 做个软链接 

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  Installing docker >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
# sudo yum remove -y docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux  docker-engine-selinux docker-engine 
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sleep 5
sudo systemctl start docker
sudo systemctl enable docker
sudo chmod 666 /var/run/docker.sock

# git clone git@github.com:yanmxa/myconfig.git $HOME/myconfig
# git config --global user.name myan
# git config --global user.email "myan@redhat.com"

go_version="${GO_VERSION:-go1.20.11}"

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  Install golang: $go_version >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
wget https://dl.google.com/go/${go_version}.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local/ -xvf ${go_version}.linux-amd64.tar.gz 
sudo rm ${go_version}.linux-amd64.tar.gz
sudo echo  "export PATH=$PATH:/usr/local/go/bin" >> ~/.environment
source ~/.environment

go version

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  Install kubectl and oc >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
wget https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz
tar xvzf oc.tar.gz
sudo rm /usr/bin/oc
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

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  Install KinD >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
go install sigs.k8s.io/kind@v0.20.0
sudo echo  "export PATH=$PATH:$(go env GOPATH)/bin" >> ~/.environment
srouce ~/.environment
kind version

echo "install succussfully"

# add environemt to bash_profile
sudo echo  "source ~/.environment" >> ~/.bash_profile

source ~/.environment
