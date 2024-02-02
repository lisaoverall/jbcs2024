CC=afl-gcc
CXX=afl-g++

OPENSSL=/vagrant/heartbleed/openssl-1.0.1f

.PHONY: all
all: target

.PHONY: openssl
openssl:
	cd $(OPENSSL) && \
	CC=$(CC) CXX=$(CXX) ./config -d && \
	AFL_USE_ASAN=1 $(MAKE)

.PHONY: keys
keys:
	openssl req -x509 -newkey rsa:512 -keyout server.key \
		-out server.pem -days 9999 -nodes -subj /CN=a/

handshake: keys
	AFL_USE_ASAN=1 $(CXX) -g handshake.cc \
		     $(OPENSSL)/libssl.a $(OPENSSL)/libcrypto.a \
		     -o handshake -I $(OPENSSL)/include -ldl

.PHONY: clean
clean:
	rm handshake server.key server.pem

.PHONY: fuzz
fuzz: handshake
	mkdir -p out
	afl-fuzz -i in -o out -m none ./$^
