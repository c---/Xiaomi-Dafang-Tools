#!/bin/sh

TOOLS=$(pwd)/../mips-gcc472-glibc216-64bit/bin

./Configure linux-generic32 no-threads no-tests no-shared -static -no-shared \
   --cross-compile-prefix=$TOOLS/mips-linux-gnu- &&

make -j$(nproc) &&

$TOOLS/mips-linux-gnu-strip apps/openssl &&
cp apps/openssl ../bin/
