#!/bin/bash

echo "Installing zsh"

sudo yum install -y zsh
sudo dnf install util-linux-user -y
sudo chsh -s $(which zsh)






# echo "source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
# echo "source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
# echo '[[ -s /root/.autojump/etc/profile.d/autojump.sh ]] && source /root/.autojump/etc/profile.d/autojump.sh' >> ~/.zshrc
# echo 'autoload -U compinit && compinit -u' >> ~/.zshrc
# sed -i 's/^ZSH_THEME=\(.*\)/ZSH_THEME="lukerandall"/' ~/.zshrc # theme

