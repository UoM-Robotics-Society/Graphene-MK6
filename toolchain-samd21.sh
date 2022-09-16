#!/bin/sh

TOOLCHAIN_BOARD="samd21"
TOOLCHAIN_SUFFIX="-armv6m"

CFLAGS="
	-target armv6m-none-eabi
	-ffreestanding
	-march=armv6m
	-mtune=cortex-m0+
	-mfpu=none
	-mfloat-abi=soft
"

CPPFLAGS=""
LDFLAGS="-nostdlib"

DEBUG_CFLAGS=""
DEBUG_CPPFLAGS=""
DEBUG_LDFLAGS=""

RELEASE_CFLAGS="-Oz -flto"
RELEASE_CPPFLAGS=""
RELEASE_LDFLAGS="-flto"
