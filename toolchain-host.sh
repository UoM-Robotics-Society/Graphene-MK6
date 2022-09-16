#!/bin/sh

TOOLCHAIN_BOARD="host"
TOOLCHAIN_SUFFIX="-host"

CFLAGS=""
CPPFLAGS=""
LDFLAGS=""

DEBUG_CFLAGS=""
DEBUG_CPPFLAGS=""
DEBUG_LDFLAGS=""

RELEASE_CFLAGS="-O3 -flto"
RELEASE_CPPFLAGS=""
RELEASE_LDFLAGS="-flto"

CC="$(which cc)"

AR="$(which ar)"
RANLIB="$(which ranlib)"

OBJCOPY="$(which objcopy)"

STRIP="$(which strip)"
SIZE="$(which size)"
