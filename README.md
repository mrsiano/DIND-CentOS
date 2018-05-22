# rhel-dind

A RHEL Docker-In-Docker, this is a research project to run nested docker containers as openshift nodes.

In order to run this as node we need the container to run with privileges and network connectiviy.

this project fits to openshift \ k8s cluster
## Build & Run
from your master \ or any infra node run the following

build the image
```
docker build -t dind_rhel .
```
 
```
docker run -it -e "container=docker" -h nested_node --privileged=true -d --security-opt seccomp:unconfined --cap-add=SYS_ADMIN  -v /docker_storage/:/var/lib/docker --name nested_node dind_rhel  bash -c "/usr/sbin/init"
```

