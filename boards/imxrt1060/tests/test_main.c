#include "test.h"

TEST(test_example, {
	int a = 42;

	TEST_ASSERT(a == 42, "a must be equal to 42");

	PASS();
})

int main(void) {
	TESTS_BEGIN();

	TEST_RUN(test_example);

	TESTS_END();
}
