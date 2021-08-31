FROM ubuntu:18.04
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN ssh-keygen -t rsa -N "" -f /etc/ssh/ssh_host_rsa_key
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
