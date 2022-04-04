#!/bin/bash
echo "ADD serv/ download/ upload Environment"

CURRENT_DIR=$(pwd)
echo "\n" >>~/.alias
echo "alias serv='sh $CURRENT_DIR/server/login.sh'" >>~/.alias
echo "alias download='sh $CURRENT_DIR/server/download.sh'" >>~/.alias
echo "alias upload='sh $CURRENT_DIR/server/upload.sh'" >>~/.alias

source ~/.alias
