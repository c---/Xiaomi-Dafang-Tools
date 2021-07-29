## Xiaomi DaFang Tools

These projects are meant as a supplement to [Xiaomi DaFang Hacks](https://github.com/EliasKotlyar/Xiaomi-Dafang-Hacks).

When checking this project out of git make sure to use `--recurse-submodules`.

Each tool has a build script usually named `<tool>.build.sh`. Just change directory to the tool you want to build then run the config script for it. This sets up and builds using the original [DaFang Hacks](https://github.com/Dafang-Hacks/Main) MIPS Ingenic build tools.

libvpx and x264 need to be built prior to building ffmpeg.
openssl needs to be built prior to building openvpn.

I highly recommend building in a throwaway virtual machine or container (eg. Docker) because I'm not sure where the DaFang build tools came from. All we have is the binaries. With that said, lots of people seem to be using them without issues.

Example building ffmpeg:
```
git clone --recurse-submodules https://github.com/c---/Xiaomi-Dafang-Tools.git

cd Xiaomi-Dafang-Tools/libvpx
../libvpx.build.sh

cd ../x264
../x264.build.sh

cd ../ffmpeg
../ffmpeg.build.sh
```

Finally copy `bin/ffmpeg` to the camera/system/sdcard/bin.
