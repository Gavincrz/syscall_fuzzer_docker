#define _GNU_SOURCE
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>        
#include <sys/socket.h>
#include <sys/sendfile.h>
#include <sys/types.h>          
#include <sys/socket.h>
#include <errno.h>

int main()
{   
    int i = 3042;
    struct sockaddr addr;
    socklen_t addr_len = sizeof(addr);
    int fd = accept4(233, &addr, &addr_len, SOCK_CLOEXEC | SOCK_NONBLOCK);
    fprintf(stderr, "fd = %d, ernno = %d\n", fd, errno);

}