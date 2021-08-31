FROM centos
RUN yum -y install initscripts
RUN yum check
RUN yum -y update
RUN yum -y install openssh-server
RUN sed -ri 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
RUN /etc/init.d/sshd start
RUN echo 'root:password' | chpasswd
EXPOSE 22
# CMD ["/usr/sbin/sshd", "-D"]
CMD /sbin/init
