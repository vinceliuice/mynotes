#! /bin/bash

THEME_DIR=$(cd $(dirname $0) && pwd)

THEME_NAME=vimix

_COLOR_VARIANTS=('' '-light' '-dark')
_COMPA_VARIANTS=('' '-laptop')
_THEME_VARIANTS=('-grey' '-doder' '-beryl' '-ruby' '-jade' '-amethyst')

if [ ! -z "${COMPA_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _COMPA_VARIANTS <<< "${COMPA_VARIANTS:-}"
fi

if [ ! -z "${COLOR_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _COLOR_VARIANTS <<< "${COLOR_VARIANTS:-}"
fi

if [ ! -z "${THEME_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _THEME_VARIANTS <<< "${THEME_VARIANTS:-}"
fi

Tar_themes() {
  for theme in "${_THEME_VARIANTS[@]}"; do
      rm -rf ${THEME_NAME}${theme}.tar
      rm -rf ${THEME_NAME}${theme}.tar.xz
  done

  for theme in "${_THEME_VARIANTS[@]}"; do
      tar -cf ${THEME_NAME}${theme}.tar ${THEME_NAME}${theme} ${THEME_NAME}-light${theme} ${THEME_NAME}-dark${theme} ${THEME_NAME}-compact${theme} ${THEME_NAME}-light-compact${theme} ${THEME_NAME}-dark-compact${theme}
  done
}

Xz_files() {
  for theme in "${_THEME_VARIANTS[@]}"; do
      xz -z ${THEME_NAME}${theme}.tar
  done
}

Tar_themes && Xz_files

