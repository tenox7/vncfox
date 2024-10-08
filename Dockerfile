FROM ubuntu
EXPOSE 5900:5900
RUN apt update -y
RUN apt install -y software-properties-common
RUN add-apt-repository ppa:mozillateam/ppa
RUN apt install -y firefox-esr tightvncserver ratpoison xterm
RUN useradd -m vncfox
ADD xsession /home/vncfox/.xsession
RUN mkdir /home/vncfox/.vnc
RUN mkdir /home/vncfox/.mozilla
RUN chown -R vncfox /home/vncfox
ADD init /init
USER vncfox
RUN sh -c 'echo vncfox | vncpasswd -f > /home/vncfox/.vnc/passwd'
RUN chmod 600 /home/vncfox/.vnc/passwd
ENV USER=vncfox
ENV WIDTH=1024
ENV HEIGHT=768
ENTRYPOINT ["/init"]
