FROM ubuntu
EXPOSE 5900:5900
VOLUME ["/root/.mozilla"]
RUN apt update -y
RUN apt install -y software-properties-common
RUN add-apt-repository ppa:mozillateam/ppa
RUN apt install -y firefox-esr tightvncserver xterm ratpoison
RUN mkdir /root/.vnc
RUN sh -c 'echo vncfox | vncpasswd -f > ~/.vnc/passwd'
RUN chmod 600 /root/.vnc/passwd
ADD xsession /root/.xsession
ADD init /init
ENTRYPOINT ["/init"]
