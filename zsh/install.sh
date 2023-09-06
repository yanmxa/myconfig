# zsh
sudo yum install -y zsh
# switch to zsh
chsh -s `which zsh`
# install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install autojump
git clone https://github.com/wting/autojump.git
cd autojump
./install.py
cd ..

# update zshrc
mv ~/.zshrc ~/.zshrc.bak
cp $HOME/myconfig/zsh/.zshrc ~/.zshrc
source ~/.zshrc


# echo "source /root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
# echo 'source /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc


# install myconfig
# git clone https://github.com/yanmxa/myconfig.git $HOME/myconfig
# echo "source ~/myconfig/alias/public" >> ~/.zshrc

# theme
# ZSH_THEME="lukerandall"
# sed -i 's/^ZSH_THEME=\(.*\)/ZSH_THEME="lukerandall"/' ~/.zshrc


