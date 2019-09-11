FROM centos:centos7.6.1810
MAINTAINER wuyang
ENV TZ=Asia/Shanghai LANG=en_US.UTF-8
# 安装openssh-server和sudo软件包，并且将sshd的UsePAM参数设置成no
RUN yum  install -y openssh-server sudo  openssh-clients  passwd && \
sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config && \
echo "root:root123" | chpasswd && \
echo "root   ALL=(ALL)       ALL" >> /etc/sudoers && \
ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key && \
ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key && \
ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key && \
ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key && \
mkdir /var/run/sshd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

# docker build -t wuzedweuze/centos-ssh:centos7.6 .

