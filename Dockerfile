FROM alpine
COPY import/entrypoint.sh /

RUN [ "apk", "update" ]
RUN [ "apk", "add", "fontconfig", "font-noto", "sudo" ]
RUN [ "apk", "add", "xorg-server", "xorg-server-common", "xinit", "xrdp", "xorgxrdp" ]
RUN [ "chmod", "+x", "/entrypoint.sh" ]
COPY import/xrdp.ini /etc/xrdp

CMD [ "/entrypoint.sh" ]
