#!/bin/bash
set -eux
shopt -s extglob
cd dist
rm -rf include
pushd lib/wine
rm -rf fakedlls *.a *.def
popd
pushd share
rm -rf man application
popd
pushd bin
rm -rf !(wine64|wineserver|wineboot)
popd

