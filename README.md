# Web Browser with a VNC Server in a Docker Container

Currently using Firefox-ESR but this may change.

## Running

https://hub.docker.com/repository/docker/tenox7/vnc4bro/

```sh
docker run -d --rm \
    --name vnc4bro \
    -p 5900:5900 \
    tenox7/vnc4bro:latest
```

VNC Password is: `vnc4bro`

If you want the Firefox profile to persist between sessions mount `/root/.mozilla` as a volume:

```sh
docker run -d --rm \
    --name vnc4bro \
    -v ~/.vnc4bro:/root/.mozilla
    -p 5900:5900 \
    tenox7/vnc4bro:latest
```


