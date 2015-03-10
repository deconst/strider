FROM debian:jessie
MAINTAINER Ash Wilson <ash.wilson@rackspace.com>

RUN apt-get update
RUN apt-get install -qy git python-pip nodejs npm
RUN update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10

RUN adduser --disabled-password --gecos "" --home /home/strider strider

VOLUME /home/strider/.strider
EXPOSE 3000
WORKDIR /home/strider

USER strider
ENV HOME /home/strider
RUN npm install strider

ENTRYPOINT ["/home/strider/node_modules/.bin/strider"]