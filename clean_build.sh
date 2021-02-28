#!/bin/bash
set -eux
cd "$(dirname "$(readlink -f "$0")")"
pushd wine
git checkout $(git tag --points-at HEAD)
git rev-parse --verify temp && git branch -D temp
git checkout -b temp
git am ../patches/*.patch
popd
rm -rf build
mkdir -p build
cd build
if [[ -e Makefile ]]; then
    make clean
fi
../genconfig.sh
make -j 8
make install -j 8
