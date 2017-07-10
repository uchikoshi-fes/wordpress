FROM lexaguskov/freebsd
MAINTAINER sksat
RUN echo nameserver 8.8.8.8 >> /etc/resolv.conf
RUN pkg update
RUN mkdir wptol
COPY ./ wptol/
RUN make -C wptol mysql && make -C wptol wordpress
