#!/bin/sh

set -e

. "$(dirname $0)/common.sh"

USAGE() {
	echo "Usage: $0 <target...>"
	echo "\tAvailable targets: all libgraphene graphene libmusician boards boards/* instruments instruments/*"
}

TEST_PROJECT() {
	echo "Testing project: $1 ${TOOLCHAIN:+($TOOLCHAIN)}"
	PROJECT_ROOT="$ROOT/$1" . "$ROOT/$1/test.sh"
}

[ "$#" = "0" ] && ( echo "No target selected!"; USAGE; exit 1 )

for tgt in $@; do
	case "$tgt" in
		all)
			NODEPS=1 "$ROOT/test.sh" "libgraphene" "graphene" "libmusician" "boards" "instruments"
			;;

		boards)
			ALL_BOARDS="$(find "$BOARDS" -mindepth 1 -maxdepth 1 -type d | cut -d/ -f2-)"
			NODEPS=1 "$ROOT/test.sh" $ALL_BOARDS
			;;

		instruments)
			ALL_INSTRUMENTS="$(find "$INSTRUMENTS" -mindepth 1 -maxdepth 1 -type d | cut -d/ -f2-)"
			NODEPS=1 "$ROOT/test.sh" $ALL_INSTRUMENTS
			;;

		libgraphene)
			TOOLCHAIN="host"
			TEST_PROJECT "$tgt"
			;;

		graphene)
			TOOLCHAIN="host"
			TEST_PROJECT "$tgt"
			;;

		libmusician)
			TOOLCHAIN="host"
			TEST_PROJECT "$tgt"
			;;

		boards/*)
			TOOLCHAIN="host"
			TEST_PROJECT "$tgt"
			;;

		instruments/*)
			TOOLCHAIN="host"
			TEST_PROJECT "$tgt"
			;;

		*)
			echo "Unknown project: $tgt"
			USAGE
			exit 1
			;;
	esac
done
