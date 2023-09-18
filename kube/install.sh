

# kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.28.1/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin

# KinD
# go install sigs.k8s.io/kind@v0.20.0
# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
# For ARM64
[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-arm64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# OC
tar xvzf openshift-client-linux.tar.gz
chmod +x ./oc
sudo mv ./oc /usr/local/bin
rm openshift-client-linux.tar.gz
rm kubectl
rm oc
rm README.md

# clusteradm
curl -L https://raw.githubusercontent.com/open-cluster-management-io/clusteradm/main/install.sh | bash
