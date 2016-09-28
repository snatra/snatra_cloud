#!/bin/bash

sudo touch /home/ubuntu/pgw_cfg.sh 2>/dev/null;
sudo chmod 777 /home/ubuntu/pgw_cfg.sh  2>/dev/null

{
   echo "export SGW_IP=$sgw_private1"
   echo "export PGW_IP=$private1"
   echo "export EXT_GW_IP=172.27.5.178"
} >>  /home/ubuntu/pgw_cfg.sh 2>/dev/null;

cd /home/ubuntu/  || exit   2>/dev/null

sudo wget -r -nH --cut-dirs=1 --no-parent --reject="index.html*" http://172.27.22.33:90/epc_nfv_bin/pgw/  2>/dev/null

sudo chmod 777 /home/ubuntu/pgw/*  2>/dev/null

# shellcheck disable=SC1091
source /home/ubuntu/pgw_cfg.sh  2>/dev/null

cd /home/ubuntu/pgw/ || exit   2>/dev/null

sudo sed -i -e 's/AVSM_PGW_DFLT_ADDR.*/AVSM_PGW_DFLT_ADDR                  \"'$private1'\"/g' /home/ubuntu/pgw/avsm_cfg.txt   2>/dev/null

sudo sed -i -e 's/AVSM_SGW_IPADDR.*/AVSM_SGW_IPADDR                  \"'$sgw_private1'\"/g' /home/ubuntu/pgw/avsm_cfg.txt   2>/dev/null

sudo screen -d -m -S pgw ./av_acc