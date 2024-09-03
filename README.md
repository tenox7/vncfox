# Firefox via VNC as a Docker Container

## Running

Docker hub: https://hub.docker.com/r/tenox7/vncfox

```sh
docker run -d \
    --name vncfox \
    -p 5900:5900 \
    tenox7/vncfox:latest
```

This container is dual architecture, AMD64 and ARM64, it can be run on Mac host with Apple Silicon, Raspberry PI, etc.

VNC Password is: `vncfox`

## Profiles

If you want the profile to persist between sessions, mount `/home/vncfox/.mozilla` as a volume. 
Either create a persistent Docker volume or bind mount to a folder on the host.

```sh
docker volume create vncfox
docker run -d \
    --name vncfox \
    -v vncfox:/home/vncfox/.mozilla
    -p 5900:5900 \
    tenox7/vncfox:latest
```

I also typically bind mount a folder exported via NFS to `/home/vncfox/Downloads`.

## Resolution

By default resolution of 1024x768 is used because I mostly work on workstations with 1280x1024 and I was a smaller window.
However you can set custom resolution by using `WIDTH` and `HEIGHT` env variables.

```sh
docker volume create vncfox
docker run -d \
    --name vncfox \
    -v vncfox:/home/vncfox/.mozilla
    -p 5900:5900 \
    -e WIDTH=1600 -e HEIGHT=1200 \
    tenox7/vncfox:latest
```


## VNC Client
It's recommended to use Tight or Tiger VNC client to reduce CPU usage and improve performance.

A collection of Tight VNC ports is available here:
http://osarchive.org/apps/vnc/tight/ports

## Useful keyboard shortcuts

- F8  - opens TightVNC menu, clipboard transfer etc
- F11 - FireFox full screen mode

## Firefox Customization

Better scrollbars:

```text
about:config
widget.non-native-theme.scrollbar.style = 1
```
