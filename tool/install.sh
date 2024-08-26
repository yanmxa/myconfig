#!/bin/bash

# install zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
# Add this to the end of your config file (usually ~/.zshrc)
# eval "$(zoxide init zsh)"

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc
