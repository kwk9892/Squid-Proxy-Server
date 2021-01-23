FROM ubuntu:latest

RUN apt-get -y update
RUN apt-get -y install apache2-utils squid

RUN mkdir /usr/etc

EXPOSE 3128
VOLUME /var/log/squid

ENV SQUID_USERNAME=proxy
ENV SQUID_PASSWORD=proxy

ADD ./squid.conf /etc/squid/squid.conf
ADD init.sh /
#RUN chmod +x /init.sh
CMD ["bash", "/init.sh"]


