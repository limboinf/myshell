#!/bin/bash

sysctl -p
su - es <<EOF
cd elasticsearch && ./bin/elasticsearch -d && exit
EOF
