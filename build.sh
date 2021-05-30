#!/bin/bash

if [[ $EUID -ne 0 ]]; then sudo='sudo -sH '; else sudo=''; fi

${sudo}apt-get update
${sudo}apt-get install -y libuv1-dev libhwloc-dev hwloc msr-tools cmake build-essential
if [[ -d "$(dirname "$0")/build" ]]; then
  ${sudo}rm -r "$(dirname "$0")/build"
fi
${sudo}mkdir -p "$(dirname "$0")/build"
cd "$(dirname "$0")"
${sudo}cmake -DWITH_ENV_VARS=ON -DWITH_EMBEDDED_CONFIG=ON -B build -S .
cd "$(dirname "$0")/build"
${sudo}make -j$(nproc)
${sudo}cp -p "$(dirname "$0")/build/xmrig" "/usr/local/bin/mo-xmrig"

