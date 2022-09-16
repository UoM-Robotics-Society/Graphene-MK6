#!/bin/sh

set -e

[ "${COMMON_INCLUDE_GUARD:-z}" = "z" ] && COMMON_INCLUDE_GUARD=1

[ $DRYRUN ] && VERBOSE=1

ROOT="$(dirname $0)"

BIN="$ROOT/bin"
LIB="$ROOT/lib"
OBJ="$ROOT/obj"

BOARDS="$ROOT/boards"
INSTRUMENTS="$ROOT/instruments"
TESTS="$ROOT/tests"

DOCS="$ROOT/docs"
TOOLS="$ROOT/tools"

PACKAGE="$ROOT/graphene.tar"

## set up artefact directories if they don't exist
[ -d "$BIN" ] || mkdir "$BIN"
[ -d "$LIB" ] || mkdir "$LIB"
[ -d "$OBJ" ] || mkdir "$OBJ"

## Resets the current toolchain environment to the given toolchain's defaults
## Usage:
##   TOOLCHAIN <toolchain-id>
TOOLCHAIN() {
	. "$ROOT/toolchain-$1.sh"
}

## Echoes out the flags associated with the current REGIME and given flag root
## Requires:
##   REGIME
## Usage:
##   REGIME <flag-root>
REGIME() {
	eval "echo \$${REGIME:-DEBUG}_$1"
}

## Logs the given message to stderr if the VERBOSE variable is set
## Requires:
##   VERBOSE
## Overwrites:
##   __ERRNO
## Usage:
##   LOG <msg...>
LOG() {
	printf "%s\n" "$*" >&2
}

## Executes the given command
## Usage:
##   EXEC <cmd...>
EXEC() {
	[ $VERBOSE ] && LOG $@; [ $DRYRUN ] || $@
}

## Echoes out the LDFLAGS for the given library
## Usage:
##   LIB <library> [pkgconf opts...]
LIB() {
	pkgconf --libs $@
}

## Echoes out the CPPFLAGS for the given library
## Usage:
##   INC <library> [pkgconf opts...]
INC() {
	pkgconf --cflags $@
}

## Compiles all given sources into objects
## Requires:
##   CC OBJ
## Overwrites:
##   __OBJ_FLAGS __SRC
## Usage:
##   OBJECTS "<flag...>" <src...>
OBJECTS() {
	__OBJ_FLAGS="$1"
	shift 1
	for __SRC in $@; do
		EXEC mkdir -p "$(dirname $OBJ/$__SRC)"
		EXEC "$CC" -o "$OBJ/$__SRC.o" -c "$__SRC" $__OBJ_FLAGS
		echo "$OBJ/$__SRC.o"
	done
}


## Compiles and executes all tests
## Requires:
##   CC TESTS
## Overwrites:
##   __SRC __TEST_FLAGS
## Usage:
##   TESTS "<flag...>" <test_src...>
TESTS() {
	__TEST_FLAGS="$1 -I$TESTS/include"
	shift 1
	for __SRC in $@; do
		EXEC mkdir -p "$(dirname "$BIN/tests/$__SRC")"
		EXEC "$CC" -static -o "$BIN/tests/$__SRC.x" "$__SRC" $__TEST_FLAGS
		EXEC "$BIN/tests/$__SRC.x"
	done
}

## Conditionally compiles the given targets
## Requires:
##   NODEPS
## Overwrites:
##   __TGT
## Usage:
##   DEPS <target...>
DEPS() {
	for __TGT in $@; do
		[ $NODEPS ] || "$ROOT/build.sh" "$__TGT"
	done
}
