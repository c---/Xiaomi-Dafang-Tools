#!/bin/sh

TOOLS=$(pwd)/../mips-gcc472-glibc216-64bit/bin

# This disables the ffmpeg banner; don't ask the ffmpeg developers for help
# without a banner. A banner can still be generated with `ffmpeg -version`
if patch -sfp1 --dry-run < ../ffmpeg.patch > /dev/null; then
   patch -sfp1 < ../ffmpeg.patch
fi

./configure \
   --cross-prefix=$TOOLS/mips-linux-uclibc-gnu- \
   --enable-gpl --target-os=linux --arch=mips --enable-cross-compile \
   --extra-ldflags=-static \
   --disable-decoders --disable-encoders --disable-parsers --disable-demuxers \
   --disable-muxers --disable-protocols --disable-bsfs --disable-indevs \
   --disable-outdevs --disable-filters \
   --enable-libvpx --extra-cflags="-I../libvpx/" --extra-ldflags="-L../libvpx/" \
   --enable-libx264 --extra-cflags="-I../x264/" --extra-ldflags="-L../x264/" \
\
   --enable-decoder=aac \
   --enable-decoder=h264 \
   --enable-decoder=mjpeg \
   --enable-decoder=mp3 \
   --enable-decoder=mpeg4 \
   --enable-decoder=opus \
   --enable-decoder=pcm_mulaw \
   --enable-decoder=pcm_s16be \
   --enable-decoder=vp9 \
\
   --enable-encoder=aac \
   --enable-encoder=libvpx_vp9 \
   --enable-encoder=libx264 \
   --enable-encoder=mjpeg \
   --enable-encoder=mpeg4 \
   --enable-encoder=opus \
   --enable-encoder=pcm_mulaw \
   --enable-encoder=pcm_s16be \
\
   --enable-parser=aac \
   --enable-parser=h264 \
   --enable-parser=mjpeg \
   --enable-parser=mpeg4video \
   --enable-parser=opus \
\
   --enable-demuxer=aac \
   --enable-demuxer=avi \
   --enable-demuxer=h264 \
   --enable-demuxer=image2 \
   --enable-demuxer=image2pipe \
   --enable-demuxer=m4v \
   --enable-demuxer=matroska \
   --enable-demuxer=mp3 \
   --enable-demuxer=mjpeg \
   --enable-demuxer=pcm_mulaw \
   --enable-demuxer=pcm_s16be \
   --enable-demuxer=rtsp \
\
   --enable-muxer=avi \
   --enable-muxer=h264 \
   --enable-muxer=image2 \
   --enable-muxer=image2pipe \
   --enable-muxer=matroska \
   --enable-muxer=mjpeg \
   --enable-muxer=mp3 \
   --enable-muxer=mp4 \
   --enable-muxer=opus \
   --enable-muxer=pcm_mulaw \
   --enable-muxer=pcm_s16be \
   --enable-muxer=rtsp \
   --enable-muxer=webm \
\
   --enable-protocol=file \
   --enable-protocol=pipe \
\
   --enable-filter=acopy \
   --enable-filter=anull \
   --enable-filter=anullsink \
   --enable-filter=anullsrc \
   --enable-filter=aresample \
   --enable-filter=copy \
   --enable-filter=lutyuv \
   --enable-filter=null \
   --enable-filter=nullsink \
   --enable-filter=nullsrc \
   --enable-filter=scale \
   --enable-filter=transpose &&

make -j$(nproc) &&

cp ffmpeg ../bin/
