#!/bin/bash
while getopts 'dh' OPT; do
    case $OPT in
        d) FIX_DNS=1;;
        h)
            echo "$0 [-d] [-h] command target"
            echo "-d\tfix dns"
            echo "-h\tprint this message"
            exit 0;;
    esac
done
shift $(($OPTIND - 1))
source=$1
target=$2
fix_dns() {
    case ${ei_class/ /} in
        01) files+=(/usr/lib32/lib{resolv,nss_{dns,files}}.so.2);;
        02) files+=(/usr/lib/lib{resolv,nss_{dns,files}}.so.2);;
        *) echo Error; exit;;
    esac
    echo "hosts: files dns" >$target/etc/nsswitch.conf
    touch $target/etc/resolv.conf
    touch $target/etc/hosts
}
set -Eeuo pipefail
mkdir -p "$target/"{tmp,proc,dev,sys,var,run,etc}
full_path=$(which $source)
ei_class=$(od -An -t x1 -j 4 -N 1 $full_path)
files=()
files+=($(ldd $full_path | tail -n +2 | awk '{ print $3 }' | sed 's/\n//' | sed -E 's/\/usr\/lib(64|32)\/ld-linux/\/lib\1\/ld-linux/'))
[[ -v FIX_DNS ]] && fix_dns
for entry in ${files[@]}; do
    install -D "$entry" "$target$entry"
    echo install "$target$entry"
done
