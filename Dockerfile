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

ENTRYPOINT /strace/strace -k /test





