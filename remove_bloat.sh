#!/bin/bash
shopt -s extglob
cd dist
rm -rf share
mkdir share
cd bin || exit 1
rm !(wine64|wineserver|wineboot)
