#! /bin/bash

THEME_DIR=$(cd $(dirname $0) && pwd)

THEME_NAME=Fluent

_COLOR_VARIANTS=('' '-Light' '-Dark')
_SIZE_VARIANTS=('' '-compact')

if [ ! -z "${COLOR_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _COLOR_VARIANTS <<< "${COLOR_VARIANTS:-}"
fi

if [ ! -z "${SIZE_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _SIZE_VARIANTS <<< "${SIZE_VARIANTS:-}"
fi

Tar_themes() {
  for color in "${_COLOR_VARIANTS[@]}"; do
    for size in "${_SIZE_VARIANTS[@]}"; do
      rm -rf ${THEME_NAME}${color}${size}.tar
      rm -rf ${THEME_NAME}${color}${size}.tar.xz
    done
  done

  for color in "${_COLOR_VARIANTS[@]}"; do
    for size in "${_SIZE_VARIANTS[@]}"; do
      tar -cf ${THEME_NAME}${color}${size}.tar ${THEME_NAME}${color}${size}
    done
  done
}

Xz_files() {
  for color in "${_COLOR_VARIANTS[@]}"; do
    for size in "${_SIZE_VARIANTS[@]}"; do
      xz -z ${THEME_NAME}${color}${size}.tar
    done
  done
}

Tar_themes && Xz_files

