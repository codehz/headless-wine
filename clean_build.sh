#!/bin/bash
set -eux
cd "$(dirname "$(readlink -f "$0")")"
patches=()
. staging_patches.sh
pushd wine
wine_version=$(git tag --points-at HEAD)
pushd ../wine-staging
git checkout ${wine_version/wine-/v}
popd
git checkout $wine_version
git rev-parse --verify temp && git branch -D temp
git checkout -b temp

../wine-staging/patches/patchinstall.sh DESTDIR=$PWD --no-autoconf --backend=git-am "${patches[@]}"

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
