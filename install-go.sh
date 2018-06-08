#!/bin/bash
# install go 1.9.2
set -e

wget https://redirector.gvt1.com/edgedl/go/go1.9.2.linux-amd64.tar.gz && \
tar -C /usr/local -xzf go1.9.2.linux-amd64.tar.gz && \
cat << EOF > /etc/profile.d/go.sh
export GOROOT=/usr/local/go
export GOPATH=/root/go
export GOBIN=\$GOPATH/bin
export PATH=\$PATH:\$GOROOT/bin:\$GOPATH/bin
EOF

source /etc/profile && echo $GOPATH && go version
