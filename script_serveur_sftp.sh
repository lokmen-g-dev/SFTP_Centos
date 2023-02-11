#!/bin/bash

# Get the IP address
IP_ADDRESS=$(ip addr show eno16777736 | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)

# Print the IP address
echo " $IP_ADDRESS"

username=serveur_sftp
password=123456
useradd $username
echo "$password" | passwd --stdin $username
echo "successful  creat user"
 #install openssh-server
yum install openssh-server

  # configure  openssh 	server  to SFTP

echo "
Subsystem sftp internal-sftp

Match User serveur-sftp
    ChrootDirectory /home/sftpuser/sftp
    X11Forwarding no
    AllowTcpForwarding no
    ForceCommand internal-sftp
" >> /etc/ssh/sshd_config

username=user1
password=123456
useradd $username
echo "$password" | passwd --stdin $username
echo "successful to creat user1"
username=user2
password=123456
useradd $username
echo "$password" | passwd --stdin $username
echo "successful to creat user2"


