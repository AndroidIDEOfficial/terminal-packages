#!/bin/bash

set -eu

arch="$1"
packages=$(<packages.txt)

if [ "$arch" == "" ]; then
  echo "Please specify the arch to build for"
  exit 0
fi

for pck in $(<packages.txt); do
  if [ -f "/data/data/.built-packages/$pck" ]; then
    echo "Skipping $pck as it is already built"
    continue
  fi
  ./build-package.sh -a $arch -o output $pck
done
