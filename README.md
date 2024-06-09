# Web Browser with a VNC Server in a Docker Container

Currently using Firefox-ESR but this may change.

## Running

```sh
docker run -d --rm \
    --name vnc4bro \
    -p 5900:5900 \
    tenox7/vnc4bro:latest
```

VNC Password is: `vnc4bro`
