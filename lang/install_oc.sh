wget https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz
tar xvzf oc.tar.gz
mv kubectl /usr/bin/kubectl
mv oc /usr/bin/oc
rm oc.tar.gz -f
rm README.md -f

 
