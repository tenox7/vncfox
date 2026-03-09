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

## Persistent Profiles

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

## Download Redirect

I typically bind mount a folder exported via NFS to `/home/vncfox/Downloads`.

```sh
-v /net/nas/Downloads:/home/vncfox/Downloads
```

## Resolution

The default resolution is 1024x768. This is because I mostly work on workstations with 1280x1024 and I want a smaller window. However you can set custom resolution by using `WIDTH` and `HEIGHT` env variables. 


```sh
docker volume create vncfox
docker run -d \
    --name vncfox \
    -v vncfox:/home/vncfox/.mozilla
    -p 5900:5900 \
    -e WIDTH=1600 -e HEIGHT=1200 \
    tenox7/vncfox:latest
```

The server side runs TigerVNC which allows remote resizing. Requires TigerVNC Viewer.


## VNC Client

It's recommended to use Tight or Tiger VNC client to reduce CPU usage and improve performance.

A collection of Tight VNC ports is available here:
http://osarchive.org/apps/vnc/tight/ports

## Useful keyboard shortcuts

- F6  - enters URL input box
- F8  - opens VNC menu, clipboard transfer etc
- F10 - opens FireFox Menu
- F11 - FireFox full screen mode

*Note:* As of TigerVNC Client 1.16.0, the default menu shortcut is Ctrl-Alt-M.
This can be changed to use other modifier keys as part of the command line
options with the  -ShortcutModifiers option. It only accepts modifer keys like 
Ctrl,Shift,Alt,Win/Super. To set it up to use Control-Shift, use the following 
argument.

*-ShortcutModifiers=Ctrl,Shift*

## Firefox Customization

Better scrollbars:

```text
about:config
widget.non-native-theme.scrollbar.style = 1
layout.testing.overlay-scrollbars.always-visible = true
```

FBI recommends installation of an [ad blocker](https://www.ic3.gov/Media/Y2022/PSA221221).
