#/bin/sh

set -e

. "$(dirname $0)/common.sh"

EXEC rm -fr "$BIN" "$LIB" "$OBJ"
