#!/bin/bash
set -eux
cd dist
mkdir -p ./{tmp,proc,dev,sys,var,run,etc}
mkdir -p /usr/lib
files+=(/usr/lib/lib{resolv,nss_{dns,files}}.so.2)
for entry in ${files[@]}; do
    install -D "$entry" ".$entry"
    echo install ".$entry"
done
mkdir -p data
mkdir -p root
touch etc/localtime
cat >etc/hosts <<EOF
127.0.0.1 localhost
::1 localhost
EOF
