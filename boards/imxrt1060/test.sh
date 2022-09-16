#!/bin/sh

. "$PROJECT_ROOT/common.sh"

TARGET_TESTS="
	$PROJECT_ROOT/tests/test_main.c
"

TESTS "$TARGET_TEST_FLAGS" $TARGET_TESTS
