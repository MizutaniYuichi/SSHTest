FROM fedora:latest
RUN dnf -y install openssh-server
RUN echo 'root:password' | chpasswd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
