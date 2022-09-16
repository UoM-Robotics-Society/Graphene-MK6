#ifndef TEST_H
#define TEST_H

#include <stdio.h>

#define TESTS_BEGIN() int __test_result = 0;

#define TESTS_END() return __test_result;

#define PASS() return 1;
#define FAIL() return 0;

#define TEST(test_name, test_body)						\
int test_name(void) {								\
	int __##test_name##_res = 1; test_body; return __##test_name##_res;	\
}

#define TEST_RUN(test)								\
{										\
	fprintf(stderr, "%s:%s:\n", __FILE__, #test);				\
	if (test()) {								\
		fprintf(stderr, "%s:%s: OK\n", __FILE__, #test);		\
	} else {								\
		fprintf(stderr, "%s:%s: FAILED\n", __FILE__, #test);		\
		__test_result = 1;						\
	}									\
}

#define _TEST_ASSERT_IMPL(condition, message)					\
fprintf(stderr, "[%s:%d] %s: %s\n", __func__, __LINE__, #condition, message)

#define TEST_ASSERT(condition, message)						\
if (!(condition)) { _TEST_ASSERT_IMPL(condition, message); FAIL(); }

#define TEST_EXPECT(condition, message)						\
if (!(condition)) { _TEST_ASSERT_IMPL(condition, message); }

#endif /* TEST_H */
