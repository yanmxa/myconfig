#!/usr/bin/env bash
##############################################################################################
### create by : Yanmeng
### create time : 20190724
### usage : used to login service 
### arguments : 0 (first login) or other host name
### dependency : serv.exp
##############################################################################################
# 堡垒机设置
essh_serv=''
essh_pwd=''
# 目标机器
# servers=(a011422 a010966 a011120)
servers=()
serv_pwd='OJh5ghqCDQ'
if [ $# -ne 0 ]; then
	servers=(${servers[@]} $1)
fi

# 自定义机器
serv1='root@150.109.127.160'
pass1=')Mj=Eqy4P5.bRT'

serv2='root@139.129.94.4'
pass2='stgates.0.'

serv3='dc_cbss@10.172.32.120'
pass3='iQlO1oL@m0M'

servers=(${servers[@]} $serv1 $serv2 $serv3)
select option in ${servers[@]}; do
	serv=${option}
    break;
done

echo ">> prepare to login $serv"
if [ $serv = $serv1 ]; then
	expect -c 'spawn ssh '"${serv}"'; expect "*assword*"; send '"${pass1}\r"'; interact'
elif [ $serv = $serv2 ]; then
	expect -c 'spawn ssh '"${serv}"'; expect "*assword*"; send '"${pass2}\r"'; interact'
elif [ $serv = $serv3 ]; then                                                                                                     
    expect -c 'spawn ssh '"${serv}"'; expect "*assword*"; send '"${pass3}\r"'; interact'
else
	expect ./serv.exp ${essh_serv} ${essh_pwd} ${serv} ${serv_pwd}
fi
