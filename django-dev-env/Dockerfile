FROM centos:centos7.6.1810
MAINTAINER wuyang
ENV TZ=Asia/Shanghai LANG=en_US.UTF-8
RUN yum update -y && \
    yum install -y epel-release && \
    yum  install -y openssh-server sudo openssh-clients  \
                    passwd mysql-devel vim gcc


RUN yum  install -y openssh-server sudo  openssh-clients  passwd && \
sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config && \
echo "root:root123" | chpasswd && \
echo "root   ALL=(ALL)       ALL" >> /etc/sudoers && \
ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key && \
ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key && \
ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key && \
ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key && \
mkdir /var/run/sshd && \
useradd www && \
    mkdir -p /tmp/django && \
    mkdir -p /var/log/django


# 复制在相同centos版本下编译安装好的python3
COPY ./python3 /usr/local/python3


RUN /usr/local/python3/bin/pip3 install --upgrade pip && \
    /usr/local/python3/bin/pip3 install \
    django==2.2.1 \
    mysqlclient==1.4.2 \
    django-simple-captcha==0.5.11 \
    gunicorn==19.9.0 \
    -i  https://pypi.douban.com/simple


EXPOSE 22 8000
CMD ["/usr/sbin/sshd", "-D"]