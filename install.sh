#!/bin/bash
BaseIP=`ip a s eth0 |grep "inet " | awk '{print $2}' | awk -F'/' '{print $1}'`
sudo rm /usr/bin/zinst
sudo cp ./zinst /usr/bin/zinst
sudo zinst self-config ip=$BaseIP host=$BaseIP dir=/data
sudo rm -Rf ./RootDirectorY


cp ./base_package/* ./
zinst i server_default_setting-1.3.0.zinst 
zinst i zinst_simple_server-1.0.1.zinst -same

sudo cp -Rfv ./dist/rhel7/* /data/dist/rhel7/
sudo cp ./zinst /data/dist/
