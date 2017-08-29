cramflags =
tests = tests

check:
	env -i BUILDDIR="$$PWD" PATH="$$PATH" TESTROOT="$$PWD/tests" \
		cram $(cramflags) $(tests)
