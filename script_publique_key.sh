#!/bin/bash

# Generate an RSA key pair
IP_ADDRESS=$(ip addr show eno16777736 | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)
ssh-keygen -t rsa -b 4096 -f id_rsa

ssh-copy-id -i ~/.ssh/id_rsa.pub  serveur_sftp@$IP_ADDRESS


