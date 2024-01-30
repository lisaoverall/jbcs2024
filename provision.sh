#!/usr/bin/bash

set -e

apt update && apt upgrade -y
apt install -y build-essential gcc-multilib lcov python2 cgroup-tools

cd /vagrant

if ! [ -d AFL ]; then 
	echo "Cloning and building AFL"
	git clone https://github.com/google/AFL.git
fi
make -C AFL && make -C AFL install

if ! [ -d afl-cov ]; then 
	echo "Cloning afl-cov"
	git clone https://github.com/mrash/afl-cov.git
fi
echo "export PATH=$PATH:/vagrant/afl-cov" >> /home/vagrant/.bashrc

if ! [ -f heartbleed/openssl-1.0.1f.tar.gz ]; then
	echo "Fetching OpenSSL source containing Heartbleed vulnerability"
	wget http://www.openssl.org/source/openssl-1.0.1f.tar.gz -P heartbleed
fi
