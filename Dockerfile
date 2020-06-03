# Use the official ubuntu image as a parent image.
FROM ubuntu

# install package 
RUN apt-get update
RUN apt-get install -y libjson-c-dev
RUN apt-get install -y git
RUN apt-get install -y autoconf
RUN apt-get install -y build-essential

# copy modified strace
ADD ./strace /strace

# install strace
WORKDIR /strace
RUN uname -a
RUN ./bootstrap
RUN ./configure LIBS="-ljson-c" --disable-mpers
RUN make

# copy and make test file
COPY ~/onefile.c /
RUN gcc -g /onefile.c -o /test

# test if strace works
RUN ~/strace/strace -n /test_hash.txt /test
RUN cat /test_hash.txt
RUN rm /test_hash.txt

ENTRYPOINT /strace/strace -k /test





