#!/bin/bash
set -e

DIR_ABS_SCRIPT="$(dirname "$(realpath "$0")")"

cd "$DIR_ABS_SCRIPT"

apt-get update 
xargs -a packages.apt apt-get install -y

git clone https://github.com/gbevin/ReceiveMIDI.git
cd ReceiveMIDI/

cd Builds/LinuxMakefile
make
mv build/receivemidi /usr/local/bin