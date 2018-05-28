FROM alpine:3.7
MAINTAINER BELARBI Samy < belarbisamy@mail.ru >

ENV LYNIS_VERSION 2.6.4

RUN apk --update add  curl tar \
	&& curl -L -o /tmp/lynis.tgz \
		"https://cisofy.com/files/lynis-${LYNIS_VERSION}.tar.gz" \
	&& tar -x -z -f /tmp/lynis.tgz -C /usr/local/ \
	&& chmod a+x /usr/local/lynis/lynis \
	&& rm -rf /tmp/*

WORKDIR /app
VOLUME ["/app","/var/log","/tmp"]

ENTRYPOINT ["/usr/local/lynis/lynis"]
CMD ["--help"]
