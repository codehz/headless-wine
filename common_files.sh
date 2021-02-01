#!/bin/bash
set -eux
cd dist
mkdir -p data
mkdir -p root
touch etc/localtime
cat >etc/hosts <<EOF
127.0.0.1 localhost
::1 localhost
EOF
