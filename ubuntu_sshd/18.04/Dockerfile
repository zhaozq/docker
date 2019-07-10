FROM ubuntu:18.04

# emacs setting
COPY .tmux.conf /root/.tmux.conf
COPY .emacs /root/.emacs
COPY .emacs.d /root/.emacs.d

# install ssh
RUN apt-get update
RUN apt-get install -y openssh-server

# setting for ssh
RUN mkdir /var/run/sshd
RUN echo 'root:huawei' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
 
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
