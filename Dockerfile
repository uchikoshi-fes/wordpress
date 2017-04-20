FROM ubuntu:16.04
MAINTAINER sksat
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y make php apache2 vim git curl pwgen apt-utils
ADD Makefile /Makefile
RUN make mysql
RUN make wordpress
