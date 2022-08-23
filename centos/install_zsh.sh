
# autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# syntax highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install autojump
git clone https://github.com/wting/autojump.git
cd autojump
./install.py
cd ..

# update zshrc
cd $HOME/myconfig
mv ~/.zshrc ~/.zshrc.bak
cp $HOME/myconfig/centos/.zshrc ~/.zshrc
source ~/.zshrc


# echo "source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
# echo "source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
# echo '[[ -s /root/.autojump/etc/profile.d/autojump.sh ]] && source /root/.autojump/etc/profile.d/autojump.sh' >> ~/.zshrc
# echo 'autoload -U compinit && compinit -u' >> ~/.zshrc
# sed -i 's/^ZSH_THEME=\(.*\)/ZSH_THEME="lukerandall"/' ~/.zshrc # theme

