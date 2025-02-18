# Configuration for the CentOS

## install basic tool

```bash
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  Installing gcc wget jq curl >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
sudo yum install gcc wget jq curl vim cmake git -y 
```

## Change into the zsh

```bash
# Check if zsh is already installed
if ! command -v zsh &> /dev/null
then
    echo "Zsh not found, installing..."
    
    # Install dependencies for building zsh
    sudo yum groupinstall "Development Tools" -y
    sudo yum install -y ncurses-devel wget

    # Download and extract zsh source
    wget http://www.zsh.org/pub/zsh-5.9.tar.xz
    tar -xf zsh-5.9.tar.xz
    cd zsh-5.9

    # Configure and install zsh
    ./configure --prefix=/usr/local
    make
    sudo make install

    echo "Zsh installed successfully."
else
    echo "Zsh is already installed."
fi

# Add zsh to /etc/shells if it's not already listed
if ! grep -q "/usr/local/bin/zsh" /etc/shells; then
    echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
    echo "Zsh added to /etc/shells."
fi

# Change the default shell to zsh
sudo chsh -s $(command -v zsh) $(whoami)

# Verify the shell has been changed
echo "Your default shell is now $(echo $SHELL)"

# If the user needs to restart the shell
echo "Please logout and login again or run 'exec zsh' to start using zsh now."
```


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