FROM ubuntu:16.04

# Build runtime environment
RUN apt-get update
RUN apt-get install -yq sudo
RUN apt-get install -yq wget python python-pip git-core subversion
RUN apt-get install -yq build-essential libncurses5-dev libssl-dev zlib1g-dev gawk gcc-multilib flex quilt gettext unzip
RUN pip install qiniu
RUN wget http://static.crise.cn/script/upToQn.py && chmod 777 ./upToQn.py
RUN mv ./upToQn.py /usr/local/bin/

# Add user
RUN useradd -ms /bin/bash ubuntu
RUN adduser ubuntu sudo
RUN echo "ubuntu	ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER ubuntu

# Set workspace
RUN mkdir -p /home/ubuntu/openwrt
WORKDIR /home/ubuntu/openwrt
