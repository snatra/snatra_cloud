#!/bin/bash

# shellcheck disable=SC1091
source /home/ubuntu/mme_cfg.sh  2>/dev/null

cd /home/ubuntu/mme/ || exit

sudo screen -d -m -S mme ./vb_acc   

#screen -wipe || true