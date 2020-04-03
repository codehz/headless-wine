#!/bin/bash
rm -rf dist
[ -e Makefile ] && make clean || :
./genconfig.sh
make -j 8
make install -j 8
