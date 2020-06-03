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
RUN gcc -g /onefile.c -o /test

# test if strace works
RUN /strace/strace -n /test_hash.txt /test
RUN cat /test_hash.txt
RUN rm /test_hash.txt

# install controller
COPY ./rsyscall_fuzzer /
# setup virtual environment
WORKDIR /rsyscall_fuzzer
RUN python3 -m venv env/
RUN source env/bin/activate
RUN pip3 install -r requirements.txt

# copy raw file generated from llvm
COPY ./test_raw /

WORKDIR /rsyscall_fuzzer/controller
# test generate syscall_g.json
RUN main.py -g /test_raw something
# copy configuration files
RUN cat syscall_g.txt && cat log.txt
RUN rm log.txt

ENTRYPOINT /strace/strace -k /test 





