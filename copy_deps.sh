#!/bin/bash
set -eux
cd dist
../packager.sh -d lib64/wine/ntdll.so .
