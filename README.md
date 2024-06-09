# Web Browser with a VNC Server in a Docker Container

## Running

```sh
docker run -d --rm \
    --name vnc4bro \
    -p 5900:5900 \
    tenox7/vnc4bro:latest
```

VNC Password `vnc4bro`.
