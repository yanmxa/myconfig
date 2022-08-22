
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
sudo dnf install bash-completion -y

# source $HOME/myconfig/alias/public
# export GOROOT=/usr/local/go
# export PATH=$PATH:/usr/local/go/bin

echo "source $HOME/myconfig/alias/public" >> ~/.bashrc
echo "export GOROOT=/usr/local/go" >> ~/.bashrc
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc

sudo dnf install util-linux-user -y
sudo chsh -s $(which bash)
source ~/.bashrc
