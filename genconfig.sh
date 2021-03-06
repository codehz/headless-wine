#!/bin/bash
set -eux
CUR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
args+=(--without-alsa)
args+=(--without-capi)
args+=(--without-cms)
args+=(--without-coreaudio)
args+=(--without-cups)
args+=(--without-dbus)
args+=(--without-faudio)
args+=(--without-float-abi)
args+=(--without-fontconfig)
args+=(--without-freetype)
args+=(--without-gettext)
args+=(--without-gettextpo)
args+=(--without-gphoto)
args+=(--without-gnutls)
args+=(--without-gsm)
args+=(--without-gssapi)
args+=(--without-gstreamer)
args+=(--without-hal)
args+=(--without-inotify)
args+=(--without-jpeg)
args+=(--without-jxrlib)
args+=(--without-krb5)
args+=(--without-ldap)
args+=(--without-mingw)
args+=(--without-mpg123)
args+=(--without-netapi)
args+=(--without-openal)
args+=(--without-opencl)
args+=(--without-opengl)
args+=(--without-osmesa)
args+=(--without-oss)
args+=(--without-pcap)
args+=(--without-png)
#args+=(--without-pthread)
args+=(--without-pulse)
args+=(--without-quicktime)
args+=(--without-sane)
args+=(--without-sdl)
args+=(--without-tiff)
args+=(--without-udev)
#args+=(--without-unwind)
args+=(--without-usb)
args+=(--without-v4l2)
args+=(--without-vkd3d)
args+=(--without-vulkan)
args+=(--without-xcomposite)
args+=(--without-xcursor)
args+=(--without-xfixes)
args+=(--without-xinerama)
args+=(--without-xinput)
args+=(--without-xinput2)
args+=(--without-xml)
args+=(--without-xrandr)
args+=(--without-xrender)
args+=(--without-xshape)
args+=(--without-xshm)
args+=(--without-xslt)
args+=(--without-xxf86vm)
#args+=(--without-wine-tools)
#args+=(--without-wine64)
args+=(--without-x)
args+=(--disable-tests)
args+=(--enable-win64)
source "$CUR"/enabled_dll.sh
echo "${args[@]}"
CFLAGS="-O3 -ffast-math" LDFLAGS="-O3" ../wine/configure "${args[@]}" --prefix="$CUR/dist" --libdir="$CUR/dist/lib64"
