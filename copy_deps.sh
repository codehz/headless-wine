#!/bin/bash
set -eux
cd dist
../packager.sh -d bin/wine64 .
