#!/bin/bash
set -eux
cd dist
../packager.sh bin/wine64 bin/wineserver lib64/wine/*.so
