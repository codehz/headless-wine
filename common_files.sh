#!/bin/bash
cd dist || exit 1
cat >etc/hosts <<EOF
127.0.0.1 localhost
::1 localhost
EOF
