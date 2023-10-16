#! /bin/bash

THEME_DIR=$(cd $(dirname $0) && pwd)

THEME_NAME=Colloid

_COLOR_VARIANTS=('' '-Light' '-Dark')
_SCHEME_VARIANTS=('' '-Nord' '-Dracula' '-Gruvbox')

if [ ! -z "${COLOR_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _COLOR_VARIANTS <<< "${COLOR_VARIANTS:-}"
fi

if [ ! -z "${SCHEME_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _SCHEME_VARIANTS <<< "${SCHEME_VARIANTS:-}"
fi

Tar_themes() {
    for scheme in "${_SCHEME_VARIANTS[@]}"; do
      rm -rf ${THEME_NAME}${scheme}.tar
      rm -rf ${THEME_NAME}${scheme}.tar.xz
    done

    for scheme in "${_SCHEME_VARIANTS[@]}"; do
      tar -cf ${THEME_NAME}${scheme}.tar ${THEME_NAME}{'','-Light','-Dark'}${scheme}{'','-hdpi','-xhdpi'}
    done
}

Xz_files() {
    for scheme in "${_SCHEME_VARIANTS[@]}"; do
      xz -z ${THEME_NAME}${scheme}.tar
    done
}

Tar_themes && Xz_files

