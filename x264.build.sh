#!/bin/sh

TOOLS=$(pwd)/../mips-gcc472-glibc216-64bit/bin

./configure \
   --cross-prefix=$TOOLS/mips-linux-uclibc-gnu- \
   --host=mips-linux --disable-asm --disable-opencl --disable-thread \
   --enable-static --enable-strip &&

make -j$(nproc) &&
cp x264 ../bin/
