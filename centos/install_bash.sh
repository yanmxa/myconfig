sudo dnf install util-linux-user -y
sudo chsh -s $(which bash)
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"


git clone https://github.com/zsh-users/zsh-autosuggestions ${OSH:-~/.oh-my-bash/custom}/plugins/zsh-autosuggestions



git clone git://github.com/wting/autojump.git
cd autojump
./install.py


# echo "source $HOME/myconfig/alias/public" >> ~/.bashrc
# echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
# echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc

# update zshrc
cd $HOME/myconfig
mv ~/.bashrc ~/.bashrc.bak
cp $HOME/myconfig/centos/.bashrc ~/.bashrc
source ~/.bashrc
