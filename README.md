# syscall_fuzzer_docker
## setup the host
```
git clone
cd syscall_fuzzer_docker
git submodule init
git submodule update
```

checkout strace to new_design branch
```
cd strace
git checkout new_design
```

make a shared directory
```
mkdir $HOME/docker_shared
```


change core dump configurations
```shell
sudo sysctl -w kernel.core_pattern=/shared/cores/core.%p
sudo sysctl -w fs.suid_dumpable=2
# depend on the OS, maybe use
sudo sysctl -w kernel.suid_dumpable=2
```
setup configurable target file
```
cp target.py $HOME/docker_shared/
cp your/git/json /shared/git_syscall.json
```

run the docker in `syscall_fuzzer_docker` dir
```
docker build -t rscfuzzer:1.0 ./
docker run --ulimit core=-1 --ulimit nofile=1048576 -it --cap-add=SYS_PTRACE -v $HOME/docker_shared_lighttpd_invalid:/shared --name lighttpd_value_invalid rscfuzzer_lighttpd:1.2
```

In docker, copy target file and do some application specific setup, it depend on which application you are using, customize your setup and target.py or config.yaml file
```
cp /shared/target.py /rsyscall_fuzzer/controller/rscfuzzer/
```

run the fuzzer (memcached example)
```
cd /rsyscall_fuzzer/controller/
/rsyscall_fuzzer/controller/main.py -c /test_config.yaml -d -e memcahced_docker_test
```

Core dumped will be stored in the shared folder


