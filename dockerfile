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
    chown tkm1988:tkm1988 /home/tkm1988/
COPY ./opt /opt
WORKDIR /opt
RUN curl -s https://setup.ius.io/ | bash -
RUN yum update -y
RUN yum install -y python36u \
                   python36u-libs \
                   python36u-devel \
                   python36u-pip \
                   httpd.x86_64
RUN ln -s /usr/bin/python3.6 /usr/bin/python3
RUN unlink /usr/bin/python
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3.6 /usr/bin/pip
RUN pip install --upgrade pip
RUN pip install -r packages_requirements.txt
CMD ["/bin/bash"]
