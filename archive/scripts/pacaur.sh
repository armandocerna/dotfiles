#!/bin/sh
#
# LICENSE AT END OF FILE
#
# This is a script to automatically install pacaur from the AUR. It is
# intended for fresh systems with no other means to install from AUR.
# Theoretically, this script can install other packages too. Just modify
# the $aurpkgs variable below.
#

# which packages to install from AUR, in this order!
aurpkgs="cower pacaur"

# exit on errors
set -e

info() { echo -e "\e[1m--> $@\e[0m"; }
mkcd() { mkdir -p "$1" && cd "$1"; }

# check if not running as root
test "$UID" -gt 0 || { info "don't run this as root!"; exit; }

# ask for user password once, set timestamp. see sudo(8)
info "setting / verifying sudo timestamp"
sudo -v

# make sure we can even build packages
info "we need packages from 'base-devel'"
sudo pacman -S --needed --noconfirm base-devel

# make and enter build environment
buildroot="$(mktemp -d /tmp/install-pacaur-XXXXXX)"
info "switching to temporary directory '$buildroot'"
mkcd "$buildroot"

# set link to plaintext PKGBUILDs
pkgbuild="https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h"
info "using '$pkgbuild=<package>' for plaintext PKGBUILDs"

# loop over required packages
info "looping over all packages in \$aurpkgs: '$aurpkgs'"
for pkg in $aurpkgs; do

    info "create subdirectory for $pkg"
    mkcd "$buildroot/$pkg"

    info "fetch PKGBUILD for $pkg"
    curl -o PKGBUILD "$pkgbuild=$pkg"

    info "fetch required pgp keys from PKGBUILD"
    gpg --recv-keys $(sed -n "s:^validpgpkeys=('\([0-9A-Fa-fx]\+\)').*$:\1:p" PKGBUILD)

    info "make and install ..."
    makepkg --syncdeps --install --needed --noconfirm

done

info "finished. cleaning up .."
cd "$buildroot/.."
rm -rf "$buildroot"

#
# Great. You've read through the script. If you now want to execute it quickly:
#  $ curl https://gist.githubusercontent.com/ansemjo/c1761088e9dda47ddd046f6e4ce6aaf4/raw/install-pacaur.sh | sh
#
# ========== LICENSE ===================================================
#
# The MIT License (MIT)
#
# Original work - Copyright (c) 2015-2016 Stefan Tatschner
# Modified work - Copyright (c) 2016 Anton Semjonov
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
