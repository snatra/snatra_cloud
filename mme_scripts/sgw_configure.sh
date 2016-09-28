#!/bin/bash

# echo $new_key > /home/ubuntu/config

sudo touch /home/ubuntu/mme_cfg.sh  2>/dev/null
sudo chmod 777 /home/ubuntu/mme_cfg.sh  2>/dev/null

{
   echo "export MME_IP=$private1"
   echo "export SGW_IP=$sgw_private1"
   echo "export ENB_IP=192.168.185.13"
} >>  /home/ubuntu/mme_cfg.sh 2>/dev/null

sudo chmod 777 /home/ubuntu/mme/*  2>/dev/null

sudo sed -i -e 's/VBSM_MME_IPADDR.*/VBSM_MME_IPADDR                  \"'$private1'\"/g' /home/ubuntu/mme/vbsm_cfg.txt

sudo sed -i -e 's/VBSM_SGW_IPADDR.*/VBSM_SGW_IPADDR                  \"'$sgw_private1'\"/g' /home/ubuntu/mme/vbsm_cfg.txt