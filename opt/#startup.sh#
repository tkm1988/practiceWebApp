#!/usr/bin/env bash

/usr/sbin/init
curl -s https://setup.ius.io/ | bash
yum update -y
yum install python36u python36u-libs python36u-devel python36u-pip httpd.x86_64 -y
pip3.6 install --upgrade pip
pip3.6 install -r packages_requirements.txt

