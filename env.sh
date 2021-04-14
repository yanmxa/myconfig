#""
# modify ZSH="/root/.oh-my-zsh" in .zshrc
# $1 = yum, brew, apt
#""
manager=$1

echo " >> package manager : $manager"

mkdir origin

echo " >> ======================================================== update vim ..."
$manager install vim
vimrc=~/.vimrc
if [ -f "$vimrc" ]; then
        mv $vimrc ./origin
fi
cp .vimrc ~/
echo " >> vim completed!"


