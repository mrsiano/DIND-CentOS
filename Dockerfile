FROM centos:latest

RUN yum install -y openssh-server NetworkManager net-tools ipaddress iproute multipathd device-mapper-multipath python-setuptools iptables iptables-services --nogpgcheck
ADD yum.repos.d /etc/yum.repos.d
ADD *.pem /var/lib/yum/
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
RUN sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

