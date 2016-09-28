#!/bin/bash

sudo sed -i -e 's/127.0.0.1 localhost/127.0.0.1 localhost '$HOSTNAME'/g' /etc/hosts   2>/dev/null

sudo apt-get update    2>/dev/null && sudo apt-get install -y screen    2>/dev/null

sudo wget -r -nH --cut-dirs=1 --no-parent --reject="index.html*" http://172.27.22.33:90/epc_nfv_bin/mme/  2>/dev/null

sudo mv mme /home/ubuntu/  2>/dev/null

sudo chmod 777 /home/ubuntu/mme/*  2>/dev/null
