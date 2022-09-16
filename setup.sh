#!/bin/sh

set -e

. "$(dirname $0)/common.sh"

HAS_NINJA="$(which ninja)"

LLVM_URL="https://github.com/llvm/llvm-project.git"
LLVM_DIR="llvm-project"
LLVM_VER="llvmorg-15.0.0"

LLVM_OPTS="
	${HAS_NINJA:+-GNinja}

	-DCMAKE_BUILD_TYPE=Release
	-DCMAKE_INSTALL_PREFIX=$(readlink -f $TOOLS)

	-DLLVM_ENABLE_PROJECTS=clang;lld
	-DLLVM_DISTRIBUTION_COMPONENTS=clang-format;clang-resource-headers;clang;dsymutil;lld;llvm-ar;llvm-config;llvm-cov;llvm-cxxfilt;llvm-dwarfdump;llvm-nm;llvm-objdump;llvm-profdata;llvm-ranlib;llvm-readelf;llvm-readobj;llvm-size;llvm-strip;llvm-symbolizer;LTO
"

[ -d "$TOOLS" ] || mkdir "$TOOLS"
[ -d "$TOOLS/src" ] || mkdir "$TOOLS/src"
[ -d "$TOOLS/src/$LLVM_DIR" ] || git clone "$LLVM_URL" "$TOOLS/src/$LLVM_DIR"

__OLD_DIR="$(pwd)"
cd "$TOOLS/src/$LLVM_DIR"

git checkout "$LLVM_VER"

cmake -S "llvm" -B "build-llvm" $LLVM_OPTS
cmake --build "build-llvm"
cmake --install "build-llvm"

cd "$__OLD_DIR"
