## quick and dirty caprnie container with  a full window manager 

created this project only to see if its possible to run caprine for linux on mac in a container with x11 forward to xquartz. 
caprine is available for mac , this is just experimental to have a disposable caprine container 

1, install and start xquartz on mac
2, allow connections from network in xquartz

```
podman run -it --rm --env="DISPLAY=host.docker.internal:0" localhost/caprine caprine --no-sandbox
````
