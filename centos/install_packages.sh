

# echo "Installing gcc git wget jq"
# sudo yum install gcc git wget jq -y 

echo "Installing python3"
sudo dnf install python3
whereis python # 查看python文件路径
# python: /usr/bin/python3.6 /usr/bin/python3.6m /usr/bin/python3.6-config /usr/bin/python3.6m-config /usr/bin/python3.6m-x86_64-config /usr/bin/python /usr/lib/python3.6 /usr/lib64/python3.6 /usr/local/lib/python3.6 /usr/include/python3.6m /usr/share/man/man1/python.1.gz
ln -s /usr/bin/python3.6 /usr/bin/python # 做个软链接 

echo "Installing docker"
sudo yum remove -y docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux  docker-engine-selinux docker-engine 
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sleep 5
sudo systemctl start docker
sudo systemctl enable docker

echo "Installing zsh"
sudo yum install -y zsh
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# autojump
cd $ZSH_CUSTOM/plugins
git clone https://github.com/joelthelion/autojump.git
cd autojump
python3 install.py 

echo "source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
echo "source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
echo '[[ -s /root/.autojump/etc/profile.d/autojump.sh ]] && source /root/.autojump/etc/profile.d/autojump.sh' >> ~/.zshrc
echo 'autoload -U compinit && compinit -u' >> ~/.zshrc
sed -i 's/^ZSH_THEME=\(.*\)/ZSH_THEME="lukerandall"/' ~/.zshrc # theme

sudo dnf install util-linux-user -y
chsh -s $(which zsh)

# sed -i 's/^plugins=(\(.*\)/plugins=(autojump zsh-autosuggestions zsh-syntax-highlighting \1/' ~/.zshrc
# [[ -s /root/.autojump/etc/profile.d/autojump.sh ]] && source /root/.autojump/etc/profile.d/autojump.sh
# autoload -U compinit && compinit -u
# test: j --stat 

# install myconfig
echo "Installing myconfig alias"
git clone https://github.com/yanmxa/myconfig.git $/HOMEmyconfig
echo "source $HOME/myconfig/alias/public" >> ~/.zshrc

echo "installing vim"
sudo yum install vim -y
