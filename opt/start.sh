#!/bin/bash -x

# Edit config
sed -i "s/127.0.0.1/${HOST_IP}/g" /etc/riak/riak.conf

# start the cluster
if [ x${IS_FIRST_NODE}x == "xtruex" ]; then
  sed -i "s/riak_control = off/riak_control = on/g" /etc/riak/riak.conf
fi

# Startup riak
riak start

# Join the cluster if it is not the first node
if [ x${IS_FIRST_NODE}x == "xfalsex" ]; then

  sleep 30

  riak-admin cluster join riak@${FIRST_RIAK_IP}

  riak-admin cluster plan

  riak-admin cluster commit

  riak-admin cluster status

fi

tail -f /var/log/riak/*

