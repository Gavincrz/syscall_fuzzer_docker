#!/bin/sh
setup_git()
{
    cd /
    git init --bare test_repo.git
    git config --global user.email "you@example.com"
    git config --global user.name "Your Name"
    # run the real sshd
    /usr/sbin/sshd
    git clone root@localhost:/test_repo.git
    cd /test_repo
    cp /git_example/pulltestfile.txt /test_repo/
    cp -r /git_example/test_lighttpd /test_repo/
    git add -A
    git commit -m "init"
    git push
    cd /
    rm -rf test_repo
}

setup_lighttpd()
{
    echo "see lighttpd_setup.txt"
}

if [ $# -eq 0 ] 
then
    echo "No arguments supplied, return.."
    exit 0    
fi

if [ $1="git" ]
then
    setup_git
    exit 0
fi

if [ $1="lighttpd" ]
then
    setup_lighttpd
    exit 0
fi

