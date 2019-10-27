FROM centos:latest
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
RUN groupadd --gid 1000 tkm1988 && \
  useradd --password '$6$lo5nagV2CDezu/DD$D0XyH6WmyBoQ0gVPNCyFXD1c7MMDs7Bkl/a43OAxPG86E5UIU2h.SBy1fGtoaPSMav1CxPvk6Ae.LHvV0bX0Y.' --gid 1000 --uid 1000 tkm1988 && \
  mkdir -p /home/tkm1988/mysite && \
  chown tkm1988:tkm1988 /home/tkm1988/ &&\
  curl -s https://setup.ius.io/ | bash - &&\
  yum update -y &&\
  yum install -y python36u \
  python36u-libs \
  python36u-devel \
  python36u-pip \
  httpd.x86_64 &&\
  rm -rf /var/cache/yum &&\
  pip3.6 install --upgrade pip &&\
  pip3.6 install pipenv
ENV PIPENV_VENV_IN_PROJECT 1
ENV LC_ALL en_US.UTF-8
CMD ["/bin/bash"]
