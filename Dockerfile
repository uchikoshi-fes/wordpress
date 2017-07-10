FROM ubuntu:16.04
MAINTAINER sksat
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y make php apache2 vim git curl pwgen apt-utils
RUN mkdir script
COPY ./ script/
RUN make -C script mysql && make -C script wordpress
