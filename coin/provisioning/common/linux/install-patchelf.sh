#!/usr/bin/env bash
# Copyright (C) 2024 The Qt Company Ltd.
# SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only


source "${BASH_SOURCE%/*}/../unix/InstallFromCompressedFileFromURL.sh"
patchelf_version="0.18.0"

url_cached="http://ci-files01-hki.ci.qt.io/input/patchelf/$patchelf_version.tar.gz"
url_public="https://github.com/NixOS/patchelf/archive/refs/tags/$patchelf_version.tar.gz"
sha1="7eb974172de73b7b452ee376237ad78601603c45"

target_source_dir="$HOME/patchelf-$patchelf_version"

if [ ! -d "$target_source_dir" ]; then
   InstallFromCompressedFileFromURL "$url_cached" "$url_public" "$sha1" "$HOME" ""
fi

pushd "$target_source_dir"

./bootstrap.sh
./configure
make
sudo make install

popd
