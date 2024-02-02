CC=afl-gcc
CFLAGS += -m32 -g -O0 -fno-stack-protector -z execstack -U_FORTIFY_SOURCE

buffer_overflow: buffer_overflow.c
	AFL_USE_ASAN=1 $(CC) $(CFLAGS) $^ -o $@

.PHONY: clean
clean:
	rm buffer_overflow

.PHONY: fuzz
fuzz: buffer_overflow
	mkdir -p out
	afl-fuzz -i in -o out -m none ./$^ 
