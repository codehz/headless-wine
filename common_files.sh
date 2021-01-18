#!/bin/bash
cd dist || exit 1
mkdir -p data etc proc root sys tmp dev
cat >etc/hosts <<EOF
127.0.0.1 localhost
::1 localhost
EOF
touch etc/{localtime,resolv.conf}