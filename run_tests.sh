#!/bin/bash

#docker pull ghcr.io/callendorph/lbstanza-cairo:latest
MAKE=/usr/bin/make
IMG=lbstanza-cairo:latest

if ! docker image inspect $IMG --format="EXISTS" ; then
	docker build -t lbstanza-cairo:latest .
fi

docker run -t --rm -v $(pwd):/project --entrypoint $MAKE $IMG tests
