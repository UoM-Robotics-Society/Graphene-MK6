#!/bin/sh

TOOLCHAIN="imxrt1060" . "$PROJECT_ROOT/common.sh"

[ $NODEPS ] || TOOLCHAIN="$TOOLCHAIN" "$ROOT/build.sh" "boards/$TOOLCHAIN_BOARD"

TARGET_FLAGS="$TARGET_FLAGS -T$ROOT/$TOOLCHAIN_BOARD.ld"

TARGET_SOURCES="
	$PROJECT_ROOT/src/unity.c
"

TARGET_OBJECTS="$(OBJECTS "$TARGET_FLAGS" $TARGET_SOURCES)"

EXEC mkdir -p "$BIN/instruments"
EXEC "$CC" -static -o "$BIN/instruments/$TARGET.elf" $TARGET_OBJECTS $TARGET_FLAGS
EXEC "$OBJCOPY" "$BIN/instruments/$TARGET.elf" "$BIN/instruments/$TARGET.hex" -O ihex
EXEC "$OBJCOPY" "$BIN/instruments/$TARGET.elf" "$BIN/instruments/$TARGET.bin" -O binary

EXEC "$SIZE" "$BIN/instruments/$TARGET.elf"
