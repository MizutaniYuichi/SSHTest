FROM registry.access.redhat.com/ubi8/ubi:latest
RUN yum install -y openssh-server
RUN echo 'root:password' | chpasswd
RUN ssh-keygen -t rsa -N "" -f /etc/ssh/ssh_host_rsa_key
EXPOSE 22
CMD ["usr/sbin/sshd", "-D"]
