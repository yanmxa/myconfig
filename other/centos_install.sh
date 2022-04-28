pip3 install yq 

# install go
yum update
yum install wget
wget https://storage.googleapis.com/golang/getgo/installer_linux
chmod +x ./installer_linux
./installer_linux 

# install kind
go install sigs.k8s.io/kind@v0.12.0

# install helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
