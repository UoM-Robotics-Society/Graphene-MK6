#!/bin/sh

set -e

. "$(dirname $0)/common.sh"

USAGE() {
	echo "Usage: $0 <target...>"
	echo "\tAvailable targets: all libgraphene graphene libmusician boards boards/* instruments instruments/*"
}

BUILD_PROJECT() {
	echo "Building project: $1 ${TOOLCHAIN:+($TOOLCHAIN)}"
	PROJECT_ROOT="$ROOT/$1"
	EXEC . "$ROOT/$1/build.sh"
}

[ "$#" = "0" ] && ( echo "No target selected!"; USAGE; exit 1 )

for tgt in $@; do
	case "$tgt" in
		all)
			TOOLCHAIN="$TOOLCHAIN" "$ROOT/build.sh" "graphene" "instruments"
			;;

		boards)
			ALL_BOARDS="$(find "$BOARDS" -mindepth 1 -maxdepth 1 -type d | cut -d/ -f2-)"
			TOOLCHAIN="$TOOLCHAIN" "$ROOT/build.sh" $ALL_BOARDS
			;;

		instruments)
			ALL_INSTRUMENTS="$(find "$INSTRUMENTS" -mindepth 1 -maxdepth 1 -type d | cut -d/ -f2-)"
			TOOLCHAIN="$TOOLCHAIN" "$ROOT/build.sh" $ALL_INSTRUMENTS
			;;

		libgraphene)
			BUILD_PROJECT "$tgt"
			;;

		graphene)
			TOOLCHAIN=""
			BUILD_PROJECT "$tgt"
			;;

		libmusician)
			BUILD_PROJECT "$tgt"
			;;

		boards/*)
			## the toolchain for each board is set by said boards's
			## build script
			TOOLCHAIN=""
			BUILD_PROJECT "$tgt"
			;;

		instruments/*)
			## the toolchain for each instrument is set by said
			## instrument's build script
			TOOLCHAIN=""
			BUILD_PROJECT "$tgt"
			;;

		*)
			echo "Unknown project: $tgt"
			USAGE
			exit 1
			;;
	esac
done
