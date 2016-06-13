FROM centos:7.2.1511

ADD ./etc/riak/riak.conf /etc/riak/riak.conf
ADD ./opt/start.sh /opt/start.sh
ADD ./riak-ts-1.3.0-1.el7.x86_64.rpm /opt/riak-ts-1.3.0-1.el7.x86_64.rpm

WORKDIR /opt/

RUN useradd riak && rpm -i riak-ts-1.3.0-1.el7.x86_64.rpm && chown -R riak.riak /etc/riak/ /var/lib/riak/ /var/log/riak

VOLUME /var/lib/riak
VOLUME /var/log/riak

EXPOSE 8098 8087

USER riak

CMD /opt/start.sh
