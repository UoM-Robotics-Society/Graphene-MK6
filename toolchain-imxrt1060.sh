#!/bin/sh

TOOLCHAIN_BOARD="imxrt1060"
TOOLCHAIN_SUFFIX="-armv7em"

CFLAGS="
	-target armv7em-none-eabi
	-ffreestanding
	-march=armv7em+fp
	-mtune=cortex-m7
	-mfpu=fpv5-d16
	-mfloat-abi=hard
"

CPPFLAGS=""
LDFLAGS="-nostdlib"

DEBUG_CFLAGS=""
DEBUG_CPPFLAGS=""
DEBUG_LDFLAGS=""

RELEASE_CFLAGS="-Oz -flto"
RELEASE_CPPFLAGS=""
RELEASE_LDFLAGS="-flto"
