# Build Helper

all: build

tests: build build-tests
	./cairo-tests

build:
	stanza build

build-tests:
	stanza build cairo-tests

.phony: build build-tests

PYPARSE_HEADERS=/mnt/c/Users/callendorph/Documents/AFT/Jitx/lbstanza-wrappers/venv/lib/python3.5/site-packages/pycparser_fake_libc
PPFLAGS=-std=c99 -I$(PYPARSE_HEADERS)

cairo-headers:
	gcc -E $(PPFLAGS)  /usr/include/cairo/cairo.h > ./cairofull.h

wrapper: cairo-headers
	python convert.py --input cairofull.h func-decl --pkg-prefix cairo --output src/Wrapper.stanza --func-form both
	python convert.py --input cairofull.h enums --pkg-prefix cairo/Enums --use-defenum --skip memory_order --out-dir src/Enums
