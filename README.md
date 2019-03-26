# Docker commands

## Build image

```
docker build -t dl_docker -f Dockerfile .
```

## Starting and Stopping containers

```
docker start <container id>     # Start a stopped container
docker start -a <container id>  # Reattach to running container
docker stop <container id>      # Stop container
```

## Other commands

```
$ docker images  # list all built docker images
$ docker stats   # give stats of running docker containerssaf
$ docker ps
    -a  # view all containers — active and inactive
    -l  # view the latest container you created
$ docker continer list  # list all avalible containers
```
