FROM docker.io/alpine
EXPOSE 5900:5900
RUN apk update 
# Add in Firefox ESR, Ratpoison (for a minimal VM), and enough fonts to handle
# nearly all web-based applications. Traditional X11 fonts have been added
# to support xterm. 
RUN apk add bash font-terminus font-inconsolata font-dejavu font-noto-all \
            font-awesome font-liberation font-dejavu font-xfree86-type1 \
            font-freefont font-adobe-100dpi font-ibm-type1 font-mutt-misc \
            font-adobe-75dpi font-adobe-source-code-pro font-xfree86-type1  \
            font-adobe-utopia-100dpi font-adobe-utopia-75dpi \
            font-adobe-utopia-type1 font-cursor-misc font-dec-misc \
            font-micro-misc font-misc-misc font-mutt-misc \
            font-schumacher-misc font-sony-misc font-sun-misc font-unifont \
            font-bitstream-100dpi font-bitstream-75dpi font-bitstream-type1 \
            xterm firefox-esr ratpoison tigervnc shadow
RUN useradd -m vncfox
ADD xinitrc /home/vncfox/.xinitrc
RUN chmod +x /home/vncfox/.xinitrc
ADD vncserver-config-defaults /etc/tigervnc/vncserver-config-defaults
RUN chown vncfox /etc/tigervnc/vncserver-config-defaults
ADD vncserver.users /etc/tigervnc/vncserver.users
ADD xsession.desktop /usr/share/xsessions
RUN mkdir /home/vncfox/.mozilla
RUN mkdir -p /home/vncfox/.config/tigervnc
RUN sh -c 'echo vncfox | vncpasswd -f > /home/vncfox/.config/tigervnc/passwd'
RUN chmod 600 /home/vncfox/.config/tigervnc/passwd
RUN chown -R vncfox /home/vncfox
ADD init /init
USER vncfox
ENV USER=vncfox
ENV WIDTH=1024
ENV HEIGHT=768
ENTRYPOINT ["/init"]
