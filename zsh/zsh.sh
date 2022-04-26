# sudo chsh -s `which zsh`

echo ">> step1: switch to zsh"
chsh -s /bin/zsh
# mv ~/.bashrc ~/.bashrc.bak

echo ">> step2: install oh-my-zsh"
# git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
# sh ~/.oh-my-zsh/tools/install.sh 
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo ">> step3: download plugins"
CURRENT_DIR=`pwd`
ZSH_CUSTOM=~/.oh-my-zsh/custom  
echo ">>$CURRENT_DIR/zsh/plugins/* -> $ZSH_CUSTOM/plugins/"
cp -r $CURRENT_DIR/zsh/plugins/* $ZSH_CUSTOM/plugins/


echo ">> step4: replace ~/.zshrc"
zshrc=~/.zshrc
if [ -f "$zshrc" ]; then
    cp $zshrc ./origin
fi
cp $CURRENT_DIR/zsh/.zshrc ~/

echo ">> step5: source ~/.zshrc"
source ~/.zshrc
echo " >> zsh completed!"

# uninstall_oh_my_zsh zsh 删除本身和恢复你以前的bash或者zsh配置.

