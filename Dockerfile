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
RUN chmod +x /start.sh
# copy test config
COPY config/config.yaml /test_config.yaml

# setup openssh
RUN apt-get install -y libssl-dev
ADD ./openssh /openssh
WORKDIR /openssh
RUN ./configure
RUN make clean
RUN make
# copy config file
COPY ./sshd_config /sshd_config
# setup sshd user
RUN groupadd -g 59 sshd
RUN useradd -u 59 -g 59 -c sshd -d / sshd
RUN /openssh/ssh-keygen -A
RUN mkdir /var/empty


# test if ssh can run properly
RUN groupadd -r custom_group && useradd -r -g custom_group -m user1
USER user1
RUN mkdir ~/.ssh
RUN ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N "" && \
        cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
RUN /openssh/sshd -f /sshd_config -D -d &>/ssh_test.txt &
RUN sleep 2
RUN cat /ssh_test.txt

# RUN ssh 127.0.0.1 -p 8080 "exit"
# RUN cat /ssh_test.txt





