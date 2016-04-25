
# sudo ppa-purge ppa:mc3man/trusty-media
# sudo add-apt-repository ppa:mc3man/trusty-media
# sudo apt-get update
# sudo apt-get dist-upgrade

# sudo apt-get install libass-dev libfdk-aac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libopus-dev libpulse-dev libsoxr-dev libspeex-dev libvidstab-dev libvo-aacenc-dev libvorbis-dev libvpx-dev libx264-dev libx265-dev libxvidcore-dev libssl-dev libfaac-dev yasm

set -xue
cd ffmpeg-3.0.1
./configure --extra-libs=-ldl --prefix=/home/zhukov/ffmpeg/local --enable-avresample --disable-debug --enable-nonfree --enable-gpl --enable-version3 --enable-libopencore-amrnb --enable-libopencore-amrwb --disable-decoder=amrnb --disable-decoder=amrwb --enable-libpulse --enable-libfreetype --enable-libx264 --enable-libx265 --enable-libfdk-aac --enable-libvorbis --enable-libmp3lame --enable-libopus --enable-libvpx --enable-libspeex --enable-libass --enable-avisynth --enable-libsoxr --enable-libxvid --enable-libvidstab --enable-openssl --enable-libfaac
#--enable-libdcadec 

make -j2
