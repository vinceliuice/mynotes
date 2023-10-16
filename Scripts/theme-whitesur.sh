#! /bin/bash

THEME_DIR=$(cd $(dirname $0) && pwd)

THEME_NAME=WhiteSur

_COLOR_VARIANTS=('-Light' '-Dark')
_SOLID_VARIANTS=('' '-solid')
_NORD_VARIANTS=('' '-nord')

if [ ! -z "${COLOR_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _COLOR_VARIANTS <<< "${COLOR_VARIANTS:-}"
fi

if [ ! -z "${SOLID_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _SOLID_VARIANTS <<< "${SOLID_VARIANTS:-}"
fi

if [ ! -z "${NORD_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _NORD_VARIANTS <<< "${NORD_VARIANTS:-}"
fi

Tar_themes() {
    for color in "${_COLOR_VARIANTS[@]}"; do
      for solid in "${_SOLID_VARIANTS[@]}"; do
        for nord in "${_NORD_VARIANTS[@]}"; do
          rm -rf ${THEME_NAME}${color}${solid}${nord}.tar
          rm -rf ${THEME_NAME}${color}${solid}${nord}.tar.xz
        done
      done
    done

    for color in "${_COLOR_VARIANTS[@]}"; do
      for solid in "${_SOLID_VARIANTS[@]}"; do
        for nord in "${_NORD_VARIANTS[@]}"; do
          tar -cf ${THEME_NAME}${color}${solid}${nord}.tar ${THEME_NAME}${color}${solid}${nord}
        done
      done
    done
}

Xz_files() {
    for color in "${_COLOR_VARIANTS[@]}"; do
      for solid in "${_SOLID_VARIANTS[@]}"; do
        for nord in "${_NORD_VARIANTS[@]}"; do
          xz -z ${THEME_NAME}${color}${solid}${nord}.tar
        done
      done
    done
}

Tar_themes && Xz_files

