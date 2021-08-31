FROM registry.access.redhat.com/ubi8/ubi:latest
RUN dnf -y install openssh.x86_64 openssh-server.x86_64 openssh-clients.x86_64
RUN echo 'root:password' | chpasswd
RUN ssh-keygen -t rsa -N "" -f /etc/ssh/ssh_host_rsa_key
EXPOSE 22
CMD ["usr/sbin/sshd", "-D"]
