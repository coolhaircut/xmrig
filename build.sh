#!/bin/bash

sudo apt-get update
sudo apt-get install -y libuv1-dev libhwloc-dev hwloc msr-tools cmake build-essential
if [[ -d "$(dirname "$0")/build" ]]; then
  sudo rm -r "$(dirname "$0")/build"
fi
sudo mkdir -p "$(dirname "$0")/build"
cd "$(dirname "$0")"
cmake -DWITH_ENV_VARS=ON -DWITH_EMBEDDED_CONFIG=ON -B build -S .
cd build
make -j$(nproc)
