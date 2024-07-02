#!/bin/bash

# ip
# alias myip="echo $(ifconfig |grep broadcast |awk '{print $2}')"

# vpn
alias vpn='otp token --prefix "6yhn\&UJM" --no-info && otp viscosity -o "ovpn-pek2-Alternative"'
alias vpnb='otp token --prefix "6yhn\&UJM" --no-info && otp viscosity -o "Red Hat Global VPN (TCP Alternate)"'

alias rmi="sh ~/myconfig/select/docker-rmi.sh"
alias hint="source ~/myconfig/centos/.hint"
alias cats='pygmentize -g'
alias catn='pygmentize -g -O style=colorful,linenos=1'
alias serv='sh ~/myconfig/server/login.sh'
alias download='sh ~/myconfig/server/download.sh'
alias upload='sh ~/myconfig/server/upload.sh'
# podman
alias p='podman'