# syscall_fuzzer_docker
docker build -t rscfuzzer:1.0 ./
docker run -v $HOME/docker_shared:/shared rscfuzzer:1.0
