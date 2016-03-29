#!/bin/bash
server=$1
newindex=$2
echo $server

# curl -XPUT $server/$newindex -d '{"settings": {"number_of_shards":2,"number_of_replicas" : 0}}'
./node_modules/elasticdump/bin/elasticdump --input=$server/ss-index --output=$server/$newindex --type=analyzer
./node_modules/elasticdump/bin/elasticdump --input=$server/ss-index --output=$server/$newindex --type=mapping
./node_modules/elasticdump/bin/elasticdump --input=$server/ss-index/competition-type --output=$server/$newindex --maxSockets=2
./node_modules/elasticdump/bin/elasticdump --input=$server/ss-index/team-type --output=$server/$newindex --maxSockets=5
./node_modules/elasticdump/bin/elasticdump --input=$server/ss-index/player-type --output=$server/$newindex --maxSockets=10
