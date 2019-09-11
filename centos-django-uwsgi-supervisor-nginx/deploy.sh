#!/bin/bash
project_path=/home/docker_volume/django-devops         # 根据docker-compose中映射的目录修改
docker_compose_path=$project_path/django_login_manager/bin
mkdir -p $project_path
rm -rf $project_path/django_login_manager  # 删除原来的volume映射的工程目录
cd $project_path
git clone http://gitlab:66/DevOps/django_login_manager.git
setting_path=$project_path/django_login_manager/django_login_manager
rm -f  $setting_path/settings.py
mv $setting_path/settings-up.py $setting_path/settings.py   # 根据自己的生产配置修改
cd $docker_compose_path  # 切换到docker-compose的目录
docker-compose up -d

# docker build -t wytest -f centos-dockerfile  .
#
# 初始化: 代码第一次部署的时候需要执行一下初始化命令
# 数据库用户需要的权限
# CREATE DATABASE `django-admin` CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci';
# CREATE USER  'program'@'%'  IDENTIFIED BY '274595861';
# GRANT SELECT, INSERT, UPDATE, DELETE,CREATE ,ALTER, REFERENCES,INDEX  ON *.* TO 'program'@'%';
# FLUSH PRIVILEGES;
# django初始化命令
# /usr/local/python3/bin/python3 /home/docker/code/manage.py migrate # 默认初始化了后面这些app:   admin, auth, cicd, contenttypes, sessions
# django创建超级管理员命令
# /usr/local/python3/bin/python3 /home/docker/code/manage.py createsuperuser