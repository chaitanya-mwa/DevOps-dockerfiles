#!/bin/sh

set -e
set -u
set -x

FLUENTD_VERSION=@FLUENTD_VERSION@

yum -y install gcc make

/opt/ruby/bin/gem install fluentd -v "$FLUENTD_VERSION" -N

yum -y autoremove gcc make
yum clean all
