# Firefox via VNC as a Docker Container


## Running

https://hub.docker.com/repository/docker/tenox7/vncfox/

```sh
docker run -d \
    --name vncfox \
    -p 5900:5900 \
    tenox7/vncfox:latest
```

VNC Password is: `vncfox`

If you want the profile to persist between sessions, mount `/home/vncfox/.mozilla` as a volume:

```sh
docker run -d \
    --name vncfox \
    -v ~/.vncfox:/home/vncfox/.mozilla
    -p 5900:5900 \
    tenox7/vncfox:latest
```


