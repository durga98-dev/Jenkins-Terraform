growpart /dev/nvme0n1 4
lvextend -l +70%FREE /dev/RootVG/rootVol
lvextend -l +70%FREE /dev/RootVG/varVol
xfs_growfs /
xfs_growfs /var

curl -o /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum install fontconfig java-21-openjdk -y
yum install jenkins -y
systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins