#!/bin/sh

TOOLS=$(pwd)/../mips-gcc472-glibc216-64bit/bin

if [ ! -f configure ]; then
   libtoolize --force &&
   aclocal &&
   autoheader &&
   automake --force-missing --add-missing &&
   autoconf
fi

OPENSSL_CFLAGS="-I$(pwd)/../openssl/include/" \
OPENSSL_LIBS="-static -L$(pwd)/../openssl/ -lssl -lcrypto" \
PATH="$TOOLS/:$PATH" ./configure \
   --target=mips-linux-gnu --host=mips-linux-gnu --enable-static --disable-shared \
   --disable-debug --disable-plugins --disable-lz4 --disable-lzo --disable-plugin-auth-pam \
   LDFLAGS="--static" &&

PATH="$TOOLS/:$PATH" make -j$(nproc) &&

$TOOLS/mips-linux-gnu-strip src/openvpn/openvpn &&
cp src/openvpn/openvpn ../bin/
