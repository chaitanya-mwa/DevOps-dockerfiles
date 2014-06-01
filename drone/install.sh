#!/bin/sh

set -e
set -u
set -x

export GOPATH=/gocode
export PATH=$GOPATH/bin:$PATH

DRONE_DIR=$GOPATH/src/github.com/drone/drone

yum -y install git mercurial bzr make gcc golang

git clone git://github.com/drone/drone.git $DRONE_DIR
make -C $DRONE_DIR deps
go get github.com/GeertJohan/go.incremental
go get github.com/jessevdk/go-flags
make -C $DRONE_DIR

install -d /var/lib/drone
install -m 755 $DRONE_DIR/bin/drone /usr/local/bin
install -m 755 $DRONE_DIR/bin/droned /usr/local/bin

yum -y autoremove git mercurial bzr make gcc golang
yum clean all
rm -rf $GOPATH
