#! /bin/bash

THEME_DIR=$(cd $(dirname $0) && pwd)

THEME_NAME=Graphite

_COLOR_VARIANTS=('' '-Light' '-Dark')
_SCHEME_VARIANTS=('' '-nord')

if [ ! -z "${COLOR_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _COLOR_VARIANTS <<< "${COLOR_VARIANTS:-}"
fi

if [ ! -z "${SCHEME_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _SCHEME_VARIANTS <<< "${SCHEME_VARIANTS:-}"
fi

Tar_themes() {
  for color in "${_COLOR_VARIANTS[@]}"; do
    for scheme in "${_SCHEME_VARIANTS[@]}"; do
      rm -rf ${THEME_NAME}${color}${scheme}.tar
      rm -rf ${THEME_NAME}${color}${scheme}.tar.xz
    done
  done

  for color in "${_COLOR_VARIANTS[@]}"; do
    for scheme in "${_SCHEME_VARIANTS[@]}"; do
      tar -cf ${THEME_NAME}${color}${scheme}.tar ${THEME_NAME}${color}${scheme}{'','-hdpi','-xhdpi'}
    done
  done
}

Xz_files() {
  for color in "${_COLOR_VARIANTS[@]}"; do
    for scheme in "${_SCHEME_VARIANTS[@]}"; do
      xz -z ${THEME_NAME}${color}${scheme}.tar
    done
  done
}

Tar_themes && Xz_files

