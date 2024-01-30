CC=afl-gcc
CFLAGS += -m32 -fno-stack-protector -z execstack -U_FORTIFY_SOURCE

buffer_overflow: buffer_overflow.c
	$(CC) $(CFLAGS) $^ -o $@

.PHONY: clean
clean:
	rm buffer_overflow
