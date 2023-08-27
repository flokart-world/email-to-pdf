FROM debian:bookworm

MAINTAINER Gerco Dries <gerco@gdries.nl>

RUN apt-get update && apt-get -q -y install mhonarc wkhtmltopdf
RUN apt-get -q -y install fonts-ipafont

ADD mhonarc.rc /
ADD convert.sh /

RUN mkdir /work && chown nobody: /work
USER nobody
WORKDIR /work

ENTRYPOINT ["/convert.sh"]

