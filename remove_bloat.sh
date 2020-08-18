#!/bin/bash
shopt -s extglob
cd dist/bin || exit 1
rm !(wine64|wineserver)