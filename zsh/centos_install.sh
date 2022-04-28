# zsh
sudo yum install -y zsh
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions


# zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# autojump
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/joelthelion/autojump.git
cd autojump
python3 install.py 


echo "source /root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
echo 'source /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
echo '[[ -s /root/.autojump/etc/profile.d/autojump.sh ]] && source /root/.autojump/etc/profile.d/autojump.sh' >> ~/.zshrc
echo 'autoload -U compinit && compinit -u' >> ~/.zshrc



# sed -i 's/^plugins=(\(.*\)/plugins=(autojump zsh-autosuggestions zsh-syntax-highlighting \1/' ~/.zshrc
# [[ -s /root/.autojump/etc/profile.d/autojump.sh ]] && source /root/.autojump/etc/profile.d/autojump.sh
# autoload -U compinit && compinit -u
# test: j --stat 


# install myconfig
git clone git@github.com:yanmxa/myconfig.git $HOME/myconfig
echo "source ~/myconfig/alias/public" >> ~/.zshrc

# theme
# ZSH_THEME="lukerandall"
sed -i 's/^ZSH_THEME=\(.*\)/ZSH_THEME="lukerandall"/' ~/.zshrc
