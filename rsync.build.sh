#!/bin/sh

TOOLS=$(pwd)/../mips-gcc472-glibc216-64bit/bin

PATH="$TOOLS/:$PATH" LDFLAGS="-static" ./configure \
   --host=mips-linux-gnu --disable-md2man --disable-openssl --disable-xxhash \
   --disable-zstd --disable-lz4 &&

PATH="$TOOLS/:$PATH" make -j$(nproc) &&

$TOOLS/mips-linux-gnu-strip rsync &&
cp rsync ../bin/
