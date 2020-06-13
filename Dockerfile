# Use the official ubuntu image as a parent image.
FROM ubuntu

# install package 
RUN apt-get update
RUN apt-get install -y libjson-c-dev
RUN apt-get install -y git
RUN apt-get install -y autoconf
RUN DEBIAN_FRONTEND="noninteractive" TZ="America/New_York" apt-get install -y gawk build-essential crossbuild-essential-armhf
RUN apt-get install -y gcc-multilib
RUN apt-get install -y libtool
RUN apt-get install -y python3.6
RUN apt-get install -y python3-pip
RUN apt-get -y install sudo gdb
RUN apt-get install -y openssh-client
RUN apt-get install -y gettext libssl-dev libpcre3 libpcre3-dev libbz2-dev

# install customized libunwind
ADD ./libunwind /libunwind
WORKDIR /libunwind
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install

# install customized strace
ADD ./strace /strace
WORKDIR /strace
RUN ./bootstrap
RUN ./configure LIBS="-ljson-c"
RUN make clean
RUN make

RUN ldconfig

# copy and make test file
COPY onefile.c /
RUN gcc -g /onefile.c -o /onefile

# test if strace works
RUN /strace/strace -n /test_hash.txt /onefile
RUN cat /test_hash.txt
RUN rm /test_hash.txt

# install controller
RUN apt-get install -y python3-venv
COPY ./rsyscall_fuzzer /rsyscall_fuzzer
# setup virtual environment
WORKDIR /rsyscall_fuzzer/controller
RUN python3 -m venv env/
SHELL ["/bin/bash", "-c"] 
RUN source env/bin/activate
RUN pip3 install -r /rsyscall_fuzzer/controller/requirement.txt
RUN pip3 install https://github.com/idanmo/python-memcached-udp/archive/master.zip
# copy raw file generated from llvm
COPY ./test_raw.txt /

WORKDIR /rsyscall_fuzzer/controller
# test generate syscall_g.json
RUN ./main.py -g /test_raw.txt something
# copy configuration files
RUN cat syscall_g.json && cat log.txt
RUN rm log.txt



# copy start script and change its permission
COPY start.sh /start.sh
COPY setup.sh /setup.sh
RUN chmod +x /start.sh
RUN chmod +x /setup.sh
# copy test config
COPY config/config.yaml /test_config.yaml

# setup openssh
RUN apt-get install -y libssl-dev
ADD ./openssh /openssh
WORKDIR /openssh
RUN autoreconf
RUN ./configure
RUN make clean
RUN make
RUN mkdir /var/empty
# setup sshd user
RUN groupadd -g 59 sshd
RUN useradd -u 59 -g 59 -c sshd -d / sshd

RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# setup git
COPY ./git-2.18.0 /git-2.18.0
WORKDIR /git-2.18.0
RUN make configure
RUN ./configure
RUN make clean; make all

# install real openssh
RUN apt install -y openssh-server
RUN mkdir /run/sshd

RUN ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N "" && \
        cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
COPY ./sshd_config /sshd_config
COPY ./gittest /git_example


RUN apt-get install -y libevent-dev
# install memcached
COPY ./memcached-1.5.20 /memcached-1.5.20
WORKDIR /memcached-1.5.20
RUN ./configure
RUN make

# USER docker
# RUN ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N "" && \
#         cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys


WORKDIR /rsyscall_fuzzer/controller


# USER docker

# RUN sudo /openssh/ssh-keygen -A
# RUN mkdir ~/.ssh
# RUN ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N "" && \
#         cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
# # copy config file
# COPY ./sshd_config /sshd_config
# RUN ssh-keyscan -H 127.0.0.1 >> ~/.ssh/known_hosts
# test if ssh can run properly
# RUN /openssh/sshd -f /sshd_config -D -d &>/ssh_test.txt &
# RUN sleep 2
# RUN cat /ssh_test.txt
# RUN ssh 127.0.0.1 -p 8080 "exit"
# RUN cat /ssh_test.txt
# ssh -o StrictHostKeyChecking=no 127.0.0.1 -p 8080





