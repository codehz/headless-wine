#!/bin/bash
set -Eeuo pipefail
declare -A maps
add_elf() {
    for i in $(ldd $1 | tail -n +2 | awk '{ print $3 }' | sed 's/\n//' | sed -E 's/\/usr\/lib(64|32)\/ld-linux/\/lib\1\/ld-linux/'); do
        maps["$i"]=1
    done
}
for elf in "$@"; do
    add_elf "$elf"
done
for entry in ${!maps[@]}; do
    install -D "$entry" ".$entry"
    echo install ".$entry"
done
