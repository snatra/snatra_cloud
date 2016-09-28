#!/bin/bash

sudo sed -i -e 's/127.0.0.1 localhost/127.0.0.1 localhost '$HOSTNAME'/g' /etc/hosts 2>/dev/null

sudo apt-get update && sudo apt-get install -y iperf screen

sudo touch /home/ubuntu/sgw_cfg.sh

sudo chmod 777 /home/ubuntu/sgw_cfg.sh

sudo echo "export SGW_IP=$private1" >> /home/ubuntu/sgw_cfg.sh

sudo wget -r -nH --cut-dirs=1 --no-parent --reject="index.html*" http://172.27.22.33:90/epc_nfv_bin/sgw/  2>/dev/null

sudo mv sgw /home/ubuntu/  2>/dev/null

cd /home/ubuntu/sgw || exit  2>/dev/null

sudo chmod 777 /home/ubuntu/sgw/*

sudo sed -i -e 's/QOSM_SGW_IPADDR.*/QOSM_SGW_IPADDR                  \"'$private1'\"/g' /home/ubuntu/sgw/qosm_cfg.txt   2>/dev/null

sudo screen -d -m -S sgw ./qo_acc