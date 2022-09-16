#!/bin/sh

. "$ROOT/toolchain.sh"

TARGET="libsamd21"

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
