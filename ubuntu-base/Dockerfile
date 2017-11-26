FROM ubuntu:16.04

MAINTAINER Daemon<www.daemon.ren,https://github.com/Daemon007>

COPY sources.list /etc/apt/sources.list 

RUN apt-get update && \
	apt-get install -y git git-core

CMD [ "/bin/bash" ]
