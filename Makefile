.PHONY: all build clean test

all: build test

build: clean
	./build.sh all

clean:
	./clean.sh

test: clean
	./test.sh all

## project targets
graphene libgraphene libmusician boards instruments: clean
	./build.sh $@
	./test.sh $@

boards/%: clean
	./build.sh $@
	./test.sh $@

instruments/%: clean
	./build.sh $@
	./test.sh $@

