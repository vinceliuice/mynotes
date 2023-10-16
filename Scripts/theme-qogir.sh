#! /bin/bash

THEME_DIR=$(cd $(dirname $0) && pwd)

THEME_NAME=Qogir

_COLOR_VARIANTS=('' '-Light' '-Dark')

if [ ! -z "${COLOR_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _COLOR_VARIANTS <<< "${COLOR_VARIANTS:-}"
fi

Tar_themes() {
    for color in "${_COLOR_VARIANTS[@]}"; do
      rm -rf ${THEME_NAME}${color}.tar
      rm -rf ${THEME_NAME}${color}.tar.xz
    done

    for color in "${_COLOR_VARIANTS[@]}"; do
      tar -cf ${THEME_NAME}${color}.tar ${THEME_NAME}${color}{'','-hdpi','-xhdpi'}
    done
}

Xz_files() {
    for color in "${_COLOR_VARIANTS[@]}"; do
      xz -z ${THEME_NAME}${color}.tar
    done
}

Tar_themes && Xz_files

