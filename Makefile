# Build Helper

all: build

tests: build build-tests
	./cairo-tests

build:
	stanza build

build-tests:
	stanza build cairo-tests

.phony: build build-tests