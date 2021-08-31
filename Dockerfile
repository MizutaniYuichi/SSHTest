FROM centos
RUN yum -y install initscripts
RUN yum check
RUN yum -y update
RUN yum -y install openssh-server
RUN sed -ri 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
RUN chmod 775 /etc/ssh /home # keep writable for openshift user group (root)
RUN chmod 660 /etc/ssh/sshd_config
RUN chmod 664 /etc/passwd /etc/group # to help uid fix
# RUN /etc/init.d/sshd start
RUN echo 'root:password' | chpasswd
RUN ssh-keygen -A
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
# CMD /sbin/init
