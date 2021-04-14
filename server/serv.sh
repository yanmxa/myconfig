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
serv1=''
pass1=''



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
