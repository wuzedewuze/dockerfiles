FROM centos:centos7.6.1810
MAINTAINER wuyang
ENV TZ=Asia/Shanghai
ENV LANG=en_US.UTF-8
RUN yum update -y && \
    yum install -y epel-release && \
    yum install -y \
    mysql-devel \
    vim \
    gcc

# 复制在相同centos版本下编译安装好的python3
COPY ./python3 /usr/local/python3
#COPY app/requirements.txt /home/docker/code/app/
#/usr/local/python3/bin/pip3 install -r /home/docker/code/app/requirements.txt -i  https://pypi.douban.com/simple

RUN /usr/local/python3/bin/pip3 install --upgrade pip && \
    /usr/local/python3/bin/pip3 install \
    django==2.2.1 \
    mysqlclient==1.4.2 \
    django-simple-captcha==0.5.11 \
    gunicorn==19.9.0 \
    -i  https://pypi.douban.com/simple

RUN useradd www && \
    mkdir -p /tmp/django && \
    mkdir -p /var/log/django