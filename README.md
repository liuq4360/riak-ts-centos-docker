riak-ts
=============

Runs the Distributed Riak-ts cluster in Docker containers


## Running distributed on three machines
This will start a 3 node cluster

### Starting the first node/container(ip=172.16.17.100)

```bash
docker run -it --env IS_FIRST_NODE=true --env HOST_IP=172.16.17.100 --env FIRST_RIAK_IP=172.16.17.100 -v /riak/log:/var/log/riak:rw  -v /riak/data:/var/lib/riak:rw  --net host gongyouliu4360/riak-ts:3.0
```

### Starting the second node/container(ip=172.16.17.101)

```bash
docker run -it --env IS_FIRST_NODE=true --env HOST_IP=172.16.17.101 --env FIRST_RIAK_IP=172.16.17.100 -v /riak/log:/var/log/riak:rw  -v /riak/data:/var/lib/riak:rw  --net host gongyouliu4360/riak-ts:3.0
```

### Starting the third node/container(ip=172.16.17.102)

```bash
docker run -it --env IS_FIRST_NODE=true --env HOST_IP=172.16.17.102 --env FIRST_RIAK_IP=172.16.17.100 -v /riak/log:/var/log/riak:rw  -v /riak/data:/var/lib/riak:rw  --net host gongyouliu4360/riak-ts:3.0
```

