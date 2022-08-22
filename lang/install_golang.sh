#!/bin/bash

# wget https://storage.googleapis.com/golang/getgo/installer_linux
# chmod +x ./installer_linux
# ./installer_linux 

# echo "# Golang" >> ~/.zshrc
# echo "export PATH=$PATH:/root/.go/bin" >> ~/.zshrc
# echo "export GOPATH=/root/go" >> ~/.zshrc
# echo "export PATH=$PATH:/root/go/bin" >> ~/.zshrc
# echo ""  >> ~/.zshrc

# or install golang
echo "install golang"
wget https://dl.google.com/go/go1.18.4.linux-amd64.tar.gz
sudo tar -C /usr/local/ -xvf go1.18.4.linux-amd64.tar.gz 
sudo rm go1.18.4.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.zshrc

echo "install kubectl and oc"
wget https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz
tar xvzf oc.tar.gz
mv kubectl /usr/bin/kubectl
mv oc /usr/bin/oc
rm oc.tar.gz -f
rm README.md -f

echo "install KinD"
go install sigs.k8s.io/kind@v0.12.0