#! /bin/bash

THEME_DIR=$(cd $(dirname $0) && pwd)

THEME_NAME=Layan

_COLOR_VARIANTS=('' '-light' '-dark')
_SOLID_VARIANTS=('' '-solid')

if [ ! -z "${COLOR_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _COLOR_VARIANTS <<< "${COLOR_VARIANTS:-}"
fi

if [ ! -z "${SOLID_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _SOLID_VARIANTS <<< "${SOLID_VARIANTS:-}"
fi

Tar_themes() {
  for color in "${_COLOR_VARIANTS[@]}"; do
    for solid in "${_SOLID_VARIANTS[@]}"; do
      rm -rf ${THEME_NAME}${color}${solid}.tar
      rm -rf ${THEME_NAME}${color}${solid}.tar.xz
    done
  done

  for color in "${_COLOR_VARIANTS[@]}"; do
    for solid in "${_SOLID_VARIANTS[@]}"; do
      tar -cf ${THEME_NAME}${color}${solid}.tar ${THEME_NAME}${color}${solid}
    done
  done
}

Xz_files() {
  for color in "${_COLOR_VARIANTS[@]}"; do
    for solid in "${_SOLID_VARIANTS[@]}"; do
      xz -z ${THEME_NAME}${color}${solid}.tar
    done
  done
}

Tar_themes && Xz_files

