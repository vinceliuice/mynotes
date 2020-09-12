#! /bin/bash

THEME_DIR=$(cd $(dirname $0) && pwd)

THEME_NAME=vimix

_COLOR_VARIANTS=('' '-light' '-dark')
_COMPA_VARIANTS=('' '-laptop')

if [ ! -z "${COMPA_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _COMPA_VARIANTS <<< "${COMPA_VARIANTS:-}"
fi

if [ ! -z "${COLOR_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _COLOR_VARIANTS <<< "${COLOR_VARIANTS:-}"
fi

Tar_themes() {
  for color in "${_COLOR_VARIANTS[@]}"; do
    for compact in "${_COMPA_VARIANTS[@]}"; do
      rm -rf ${THEME_NAME}${color}${compact}.tar
      rm -rf ${THEME_NAME}${color}${compact}.tar.xz
    done
  done

  for color in "${_COLOR_VARIANTS[@]}"; do
    for compact in "${_COMPA_VARIANTS[@]}"; do
      tar -cf ${THEME_NAME}${color}${compact}.tar ${THEME_NAME}${color}${compact} ${THEME_NAME}${color}${compact}-beryl ${THEME_NAME}${color}${compact}-doder ${THEME_NAME}${color}${compact}-ruby
    done
  done
}

Xz_files() {
  for color in "${_COLOR_VARIANTS[@]}"; do
    for compact in "${_COMPA_VARIANTS[@]}"; do
      xz -z ${THEME_NAME}${color}${compact}.tar
    done
  done
}

Tar_themes && Xz_files

