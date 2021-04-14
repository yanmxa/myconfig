
echo "add login server enviroment"

CURRENT_DIR=`pwd`
echo "alias serv=sh $CURRENT_DIR/server/login.sh" >> ~/.bash_profile
source ~/.bash_profile
