# syscall_fuzzer_docker
docker build -t rscfuzzer:1.0 ./
sudo docker run --privileged -v $HOME/docker_shared:/shared rscfuzzer:1.0
