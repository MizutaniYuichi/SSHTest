FROM fedora:latest
RUN dnf -y install openssh-server
RUN chmod 775 /etc/ssh /home # keep writable for openshift user group (root)
RUN chmod 660 /etc/ssh/sshd_config
RUN chmod 664 /etc/passwd /etc/group # to help uid fix
RUN echo "GatewayPorts yes" >> /etc/ssh/sshd_config
RUN echo 'root:password' | chpasswd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
