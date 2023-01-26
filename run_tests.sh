#!/bin/bash

#docker pull ghcr.io/callendorph/lbstanza-cairo:latest
MAKE=/usr/bin/make
IMG=lbstanza-cairo:latest

if ! docker image inspect $IMG --format="EXISTS" ; then
	docker build -t lbstanza-cairo:latest .
fi

# Attempt to work around issue with
# permissions in github actions
mkdir -p pkgs
chmod o+rwx pkgs
chmod o+rwx .

docker run -t --rm -v $(pwd):/project --entrypoint $MAKE $IMG tests
