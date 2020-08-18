#!/bin/bash
rm -rf dist
if [[ -e Makefile ]]; then
    make clean
fi
./genconfig.sh
make -j 8
make install -j 8
