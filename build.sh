#!/bin/bash

if [ ! $1 ] || [ ! $2 ]; then
    echo no version
    exit 1
fi

VERSION=$1
RELEASE=$2

alias cp=cp
PKG_NAME="pkgconfig"
TMP_PATH=$(mktemp -d)
BUILD_PATH=/build
RPMBUILD_PATH=/root/rpmbuild/


v=$(cat /etc/redhat-release|sed -r 's/.* ([0-9]+)\..*/\1/')

wget https://pkgconfig.freedesktop.org/releases/pkg-config-${VERSION}.tar.gz \
    -O /root/rpmbuild/SOURCES/pkg-config-${VERSION}.tar.gz

rpmbuild -bb \
    --define "_version $VERSION" \
    --define "_release $RELEASE" \
    $BUILD_PATH/$PKG_NAME.spec


cp /root/rpmbuild/RPMS/x86_64/*.rpm $BUILD_PATH/




