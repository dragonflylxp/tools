#!/bin/bash

echo '>>>[INSTALL DOCKER]Update yum'
yum update -y

echo '>>>[INSTALL DOCKER]Remove old verion docker'
yum remove docker  docker-common docker-selinux docker-engine docker.io


echo '>>>[INSTALL DOCKER]Install require tools'
yum install -y yum-utils device-mapper-persistent-data lvm2

echo '>>>[INSTALL DOCKER]Add docker yum repo'
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

echo '>>>[INSTALL DOCKER]Install docker-ce'
yum install -y docker-ce

echo '>>>[INSTALL DOCKER]Start and enable auto boot'
systemctl start docker
systemctl enable docker

echo '>>>[INSTALL DOCKER]Check if sucess'
docker version
