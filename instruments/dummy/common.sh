#!/bin/sh

. "$ROOT/toolchain.sh"

TARGET="dummy"

TARGET_VER_MAJOR="0"
TARGET_VER_MINOR="1"
TARGET_VER_PATCH="0"
TARGET_VER="$TARGET_VER_MAJOR.$TARGET_VER_MINOR.$TARGET_VER_PATCH"

TARGET_FLAGS="
	$CFLAGS

	$CPPFLAGS
	-I$PROJECT_ROOT/include
	-I$ROOT/boards/$TOOLCHAIN_BOARD/include
	-I$ROOT/hal/include
	-I$ROOT/libgraphene/include
	-I$ROOT/libmusician/include

	$LDFLAGS
	-l$TOOLCHAIN_BOARD
	-lgraphene$TOOLCHAIN_SUFFIX
	-lmusician$TOOLCHAIN_SUFFIX
"

TARGET_TEST_FLAGS="
	$CFLAGS

	$CPPFLAGS
	-I$PROJECT_ROOT/include
	-I$ROOT/boards/$TOOLCHAIN_BOARD/include
	-I$ROOT/hal/include
	-I$ROOT/libgraphene/include
	-I$ROOT/libmusician/include

	$LDFLAGS
"
