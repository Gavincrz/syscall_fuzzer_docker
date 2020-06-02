# Use the official ubuntu image as a parent image.
FROM ubuntu

# install package needed for strace
RUN apt-get update
RUN apt-get install -y libjson-c-dev

# copy modified strace
ADD /home/gavin/strace /strace

# install strace
WORKDIR /strace
RUN ls
RUN LIBS="-ljson-c" ./configure
RUN make

# copy and make test file
COPY ~/onefile.c /
RUN gcc -g /onefile.c -o /test

# test if strace works
RUN ~/strace/strace -n /test_hash.txt /test
RUN cat /test_hash.txt
RUN rm /test_hash.txt

ENTRYPOINT /strace/strace -k /test





