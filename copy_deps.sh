#!/bin/bash
deps=(/usr/lib/libgcc_s.so.1 /usr/lib/liblzma.so.5 /usr/lib/libunwind.so.8 /lib/ld-musl-x86_64.so.1)
for file in ${deps[*]}; do
    base=$(basename "$file");
    cp "$file" "./dist/lib/$base";
    echo "copy $file to /lib/$base";
done