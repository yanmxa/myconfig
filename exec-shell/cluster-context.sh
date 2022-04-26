#!/bin/bash 
if [ $1 = "login" ] 
then
  oc login --server $1 -u $2 -p $3
fi

oc cluster-info 


# kubeconfig="~/.kube/config"
# config_name="default"
# if [ $1 ] 
# then
# kubeconfig=$1
# config_name=$2
# fi
# echo "   ${config_name}"
# echo "   ${kubeconfig}"
# export KUBECONFIG=${kubeconfig}

# info=`oc projects |grep "Using project"`
# if [ "collective_acm-hub-of-hubs" != ${config_name} ] 
# then
#   info=$(oc cluster-info | grep -v 'kubectl cluster-info dump')
# fi
# echo $info