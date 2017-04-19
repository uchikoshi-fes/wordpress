FROM ubuntu:16.04
MAINTAINER sksat
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y make
ADD Makefile /Makefile
RUN make  env
