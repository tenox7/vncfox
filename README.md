# Firefox via VNC - Docker Container

Currently using Firefox-ESR but this may change.

## Running

https://hub.docker.com/repository/docker/tenox7/vncfox/

```sh
docker run -d --rm \
    --name vncfox \
    -p 5900:5900 \
    tenox7/vncfox:latest
```

VNC Password is: `vncfox`

If you want the Firefox profile to persist between sessions mount `/root/.mozilla` as a volume:

```sh
docker run -d --rm \
    --name vncfox \
    -v ~/.vncfox:/root/.mozilla
    -p 5900:5900 \
    tenox7/vncfox:latest
```


