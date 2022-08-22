#!/bin/bash

echo "Installing zsh"

sudo yum install -y zsh
sudo dnf install util-linux-user -y
sudo chsh -s $(which zsh)


# oh-my-zsh
sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp ~/.zshrc ~/.zshrc.orig

# autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/joelthelion/autojump.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/autojump
cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/autojump
python3 install.py

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp $currentDir/.zshrc ~/.zshrc
source ~/.zshrc



# echo "source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
# echo "source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
# echo '[[ -s /root/.autojump/etc/profile.d/autojump.sh ]] && source /root/.autojump/etc/profile.d/autojump.sh' >> ~/.zshrc
# echo 'autoload -U compinit && compinit -u' >> ~/.zshrc
# sed -i 's/^ZSH_THEME=\(.*\)/ZSH_THEME="lukerandall"/' ~/.zshrc # theme

