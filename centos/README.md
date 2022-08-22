
# install centos environment

## Step 1
```
sudo su -
sudo yum install git vim make -y 

ssh-keygen -t rsa

passwd root
# # vim /etc/ssh/sshd_config
# PermitRootLogin yes
# PasswordAuthentication yes
service sshd reload
cp ~ec2-user/.ssh/authorized_keys ~root/.ssh/authorized_keys
# vim /etc/cloud/cloud.cfg
disable_root false

```
## Step 2
```
git clone git@github.com:yanmxa/myconfig.git
cd myconfig
make basic
make bash
```