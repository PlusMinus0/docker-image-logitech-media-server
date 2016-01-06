FROM ubuntu:latest

MAINTAINER PlusMinus <piddlpiddl@gmail.com>

ENV SQUEEZE_VOL /srv/squeezebox
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive
ENV LMSDEB /tmp/lms.deb

RUN \
        apt-get update &&\
        apt-get dist-upgrade -y &&\
        apt-get install -y curl wget faad flac lame sox &&\
        wget -O $LMSDEB --user-agent="https://hub.docker.com/r/plusminus/" --progress=bar:force $(curl "http://www.mysqueezebox.com/update/?version=7.9.0&revision=1&geturl=1&os=deb") &&\
        dpkg -i $LMSDEB &&\
	rm $LMSDEB &&\
        apt-get clean

ADD entrypoint.sh /entrypoint.sh
ADD start-squeezebox.sh /start-squeezebox.sh
RUN chmod 755 /entrypoint.sh /start-squeezebox.sh
ENTRYPOINT ["/entrypoint.sh"]

