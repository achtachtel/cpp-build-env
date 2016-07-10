FROM debian:stretch

MAINTAINER Marcel Brand <marcel.brand@achtachtel.de>

# Run update and install dependencies
RUN apt-get update && apt-get install -y \
	cmake \
	gcc \
	g++ \
	libboost-all-dev \
	libiomp-dev \
	openssl \
	libssl-dev \
	libgtest-dev && apt-get clean

# compile google test framework and make it available in /usr/lib
RUN cd /usr/src/gtest && \
	mkdir build && \
	cmake -E chdir build cmake .. >> /dev/null && \
	cmake --build build >> /dev/null && \
	cp build/libgtest* /usr/lib && \
	rm -rf build
