#!/bin/sh

TOOLS=$(pwd)/../mips-gcc472-glibc216-64bit/bin

LDFLAGS=-static CROSS=$TOOLS/mips-linux-uclibc-gnu- ./configure \
   --target=mips32-linux-gcc --enable-webm-io --disable-multithread --disable-unit-tests &&

make -j$(nproc) &&

$TOOLS/mips-linux-gnu-strip vpxdec vpxenc &&
cp vpxdec vpxenc ../bin/
