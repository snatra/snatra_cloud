#!/bin/bash

# echo $new_key > /home/ubuntu/config

sudo touch /home/ubuntu/mme_cfg.sh  2>/dev/null

{
   echo "export PGW_IP=$pgw_private1",
} >>  /home/ubuntu/mme_cfg.sh 2>/dev/null

sudo chmod 777 /home/ubuntu/mme_cfg.sh  2>/dev/null

sudo chmod 777 /home/ubuntu/mme/*  2>/dev/null

sudo sed -i -e 's/PDN_GW_ADDR =.*/PDN_GW_ADDR = '$pgw_private1'/g' /home/ubuntu/mme/vb_hss_ue.db   2>/dev/null
sudo sed -i -e 's/VBSM_PGW_IPADDR.*/VBSM_PGW_IPADDR                  \"'$pgw_private1'\"/g' /home/ubuntu/mme/vbsm_cfg.txt   2>/dev/null