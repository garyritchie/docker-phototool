FROM miljar/exiftool

RUN apk update
RUN apk add --no-cache bash gawk sed grep bc coreutils
RUN apk add imagemagick

## EPEG install
RUN apk add --update alpine-sdk
RUN apk add git cmake nasm automake autoconf libtool libjpeg-turbo-dev libexif-dev man
RUN cd / && git clone https://github.com/mattes/epeg.git
RUN cd /epeg && \
	./autogen.sh \
	&& make .. \
	&& make install

RUN mkdir /scripts
VOLUME /scripts

RUN mkdir /photos
VOLUME /photos
WORKDIR /photos

ENTRYPOINT []