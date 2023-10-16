#! /bin/bash

THEME_DIR=$(cd $(dirname $0) && pwd)

THEME_NAME=Lavanda

_COLOR_VARIANTS=('' '-Light' '-Dark')
_THEME_VARIANTS=('' '-Sea')

if [ ! -z "${COLOR_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _COLOR_VARIANTS <<< "${COLOR_VARIANTS:-}"
fi

if [ ! -z "${THEME_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _THEME_VARIANTS <<< "${THEME_VARIANTS:-}"
fi

Tar_themes() {
  for theme in "${_THEME_VARIANTS[@]}"; do
    for color in "${_COLOR_VARIANTS[@]}"; do
      rm -rf ${THEME_NAME}${theme}${color}.tar
      rm -rf ${THEME_NAME}${theme}${color}.tar.xz
    done
  done

  for theme in "${_THEME_VARIANTS[@]}"; do
    for color in "${_COLOR_VARIANTS[@]}"; do
      tar -cf ${THEME_NAME}${theme}${color}.tar ${THEME_NAME}${theme}${color}{'','-hdpi','-xhdpi'}
    done
  done
}

Xz_files() {
  for theme in "${_THEME_VARIANTS[@]}"; do
    for color in "${_COLOR_VARIANTS[@]}"; do
      xz -z ${THEME_NAME}${theme}${color}.tar
    done
  done
}

Tar_themes && Xz_files

