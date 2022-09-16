#!/bin/sh

[ "${COMMON_INCLUDE_GUARD:-z}" = "z" ] && . "$(dirname $0)/common.sh"

## setup toolchain and default toolchain flags (CFLAGS, CPPFLAGS, LDFLAGS)
TOOLCHAIN "${TOOLCHAIN:-host}"

CC="${CC:-$TOOLS/bin/clang}"

AR="${AR:-$TOOLS/bin/llvm-ar}"
RANLIB="${RANLIB:-$TOOLS/bin/llvm-ranlib}"

OBJCOPY="${OBJCOPY:-$TOOLS/bin/llvm-objcopy}"

STRIP="${STRIP:-$TOOLS/bin/llvm-strip}"
SIZE="${SIZE:-$TOOLS/bin/llvm-size}"

## append project-wide toolchain flags
ERRORS="-Wno-unused-command-line-argument"

CFLAGS="$CFLAGS -std=c11 -Wall -Wextra -Wpedantic -Werror $ERRORS"
CPPFLAGS="$CPPFLAGS"
LDFLAGS="$LDFLAGS -L$LIB"

DEBUG_CFLAGS="$DEBUG_CFLAGS -Og -ggdb"
DEBUG_CPPFLAGS="$DEBUG_CPPFLAGS"
DEBUG_LDFLAGS="$DEBUG_LDFLAGS"

RELEASE_CFLAGS="$RELEASE_CFLAGS"
RELEASE_CPPFLAGS="$RELEASE_CPPFLAGS -DNDEBUG"
RELEASE_LDFLAGS="$RELEASE_LDFLAGS"

## append regime-specific toolchain flags
CFLAGS="$CFLAGS $(REGIME CFLAGS)"
CPPFLAGS="$CPPFLAGS $(REGIME CPPFLAGS)"
LDFLAGS="$LDFLAGS $(REGIME LDFLAGS)"
