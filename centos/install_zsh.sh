sudo yum remove zsh
sudo yum install zsh -y

# install chsh
# cat /etc/shells        -> deduplicated
sudo yum install util-linux-user -y
sudo chsh -s $(which zsh) $(whoami)
# sudo -u $(whoami) chsh -s $(which zsh)
echo $SHELL
#OR Logout and re-login

# install zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
echo "source ~/.bash_profile" >> ~/.zshrc


# install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i 's/plugins=(.*)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# change theme
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="cloud"/' ~/.zshrc
# give 
sudo echo  "source ~/.environment" >> ~/.zshrc

source ~/.zshrc

