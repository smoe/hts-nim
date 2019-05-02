#!/bin/bash

echo $(pwd)

export BRANCH=${BRANCH:-devel}
export base=$(pwd)

sudo apt-get -qy install bwa make build-essential cmake libncurses-dev ncurses-dev libbz2-dev lzma-dev liblzma-dev \
     curl  libssl-dev libtool autoconf automake libcurl4-openssl-dev nim

echo $PATH

cd
set -x
nimble refresh

echo $(which nimble)
echo $(pwd)


#git clone --depth 1 --recursive https://github.com/nim-lang/c2nim.git
#cd c2nim
#nimble install -y

cd

git clone --recursive https://github.com/samtools/htslib.git
cd htslib && git checkout 1.9 && autoheader && autoconf && ./configure --enable-libcurl

cd
make -j 4 -C htslib
export LD_LIBRARY_PATH=$HOME/htslib
ls -lh $HOME/htslib/*.so

cd $base
