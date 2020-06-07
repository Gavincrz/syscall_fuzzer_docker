# syscall_fuzzer_docker

git clone
cd syscall_fuzzer_docker
git submodule init
git submodule update

checkout strace to new_design branch

mkdir $HOME/docker_shared

sudo sysctl -w kernel.core_pattern=/shared/core.%p

docker build -t rscfuzzer:1.0 ./
docker run --ulimit core=-1 -v -it $HOME/docker_shared:/shared rscfuzzer:1.0 

/setup.sh git
cd /rsyscall_fuzzer/controller/
/rsyscall_fuzzer/controller/main.py -c /test_config.yaml -d -e git_docker



