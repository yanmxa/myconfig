# MyConfig

## Install Basic

```bash
yum update
yum install gcc wget zsh yum-utils zlib-devel python-tools cmake git pkgconfig -y jq curl python3 vim --skip-broken
yum groupinstall -y "Development Tools" --skip-broken
# whereis python 
# 做个软链接 
# ln -s /usr/bin/python3.6 /usr/bin/python 
```
## Install ohmyzsh

```bash
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
```

## Install Docker

```bash
```