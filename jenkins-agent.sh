#!/bin/bash
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH

growpart /dev/nvme0n1 4
lvextend -l +70%FREE /dev/RootVG/rootVol
lvextend -l +70%FREE /dev/RootVG/varVol
lvextend -l +70%FREE /dev/mapper/RootVG-homeVol
xfs_growfs /
xfs_growfs /var
xfs_growfs /home

yum install fontconfig java-21-openjdk -y
