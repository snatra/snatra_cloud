#!/bin/bash

sudo sed -i -e 's/127.0.0.1 localhost/127.0.0.1 localhost '$HOSTNAME'/g' /etc/hosts   2>/dev/null

sudo apt-get update  2>/dev/null && sudo apt-get install -y screen  2>/dev/null