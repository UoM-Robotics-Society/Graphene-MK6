#!/bin/sh

. "$ROOT/toolchain.sh"

TARGET="libhost"

TARGET_FLAGS="
	$CFLAGS 

	$CPPFLAGS
	-I$PROJECT_ROOT/include
	-I$ROOT/hal/include

	$LDFLAGS
"

TARGET_TEST_FLAGS="
	$CFLAGS

	$CPPFLAGS
	-I$PROJECT_ROOT/include
	-I$ROOT/hal/include

	$LDFLAGS
"
