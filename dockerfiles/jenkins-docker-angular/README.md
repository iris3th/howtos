## docker-jenkins-docker

quick (and dirty) way to build docker images in jenkins with jenkins itself running in a docker container

### prerequisites

 - docker daemon must run on the host

``sudo useradd jenkins``

``sudo usermod -aG docker jenkins``

### usage

``docker network create jenkins``

``docker-compose build``

``docker-compose up``

### kudos

[Łukasz Pawłowski](https://itnext.io/docker-inside-docker-for-jenkins-d906b7b5f527 "Łukasz Pawłowski")
