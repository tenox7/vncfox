# Firefox via VNC as a Docker Container

## Running

Docker hub: https://hub.docker.com/r/tenox7/vncfox

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

I also typically bind mount a folder exported via NFS to `/home/vncfox/Downloads`.

This container is dual architecture, AMD64 and ARM64, it can be run on Mac host with Apple Silicon, Raspberry PI, etc.

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
