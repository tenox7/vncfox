FROM ubuntu
EXPOSE 5900:5900
RUN apt update -y
RUN apt install -y software-properties-common
RUN add-apt-repository ppa:mozillateam/ppa
RUN apt install -y firefox-esr tightvncserver ratpoison
RUN useradd -m vncfox
USER vncfox
RUN mkdir /home/vncfox/.vnc
RUN sh -c 'echo vncfox | vncpasswd -f > /home/vncfox/.vnc/passwd'
RUN chmod 600 /home/vncfox/.vnc/passwd
ADD xsession /home/vncfox/.xsession
ADD init /init
ENTRYPOINT ["/init"]
