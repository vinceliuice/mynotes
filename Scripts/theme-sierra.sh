#! /bin/bash

THEME_DIR=$(cd $(dirname $0) && pwd)

THEME_NAME=Sierra

_COMPA_VARIANTS=('' '-compact')
_COLOR_VARIANTS=('-light' '-dark')
_SOLID_VARIANTS=('' '-solid')
_ALT_VARIANTS=('' '-alt')

if [ ! -z "${COMPA_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _COMPA_VARIANTS <<< "${COMPA_VARIANTS:-}"
fi

if [ ! -z "${COLOR_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _COLOR_VARIANTS <<< "${COLOR_VARIANTS:-}"
fi

if [ ! -z "${SOLID_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _SOLID_VARIANTS <<< "${SOLID_VARIANTS:-}"
fi

if [ ! -z "${ALT_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _ALT_VARIANTS <<< "${ALT_VARIANTS:-}"
fi

Tar_themes() {
  for compact in "${_COMPA_VARIANTS[@]}"; do
    for color in "${_COLOR_VARIANTS[@]}"; do
      for solid in "${_SOLID_VARIANTS[@]}"; do
        for alt in "${_ALT_VARIANTS[@]}"; do
          rm -rf ${THEME_NAME}${compact}${color}${solid}${alt}.tar
          rm -rf ${THEME_NAME}${compact}${color}${solid}${alt}.tar.xz
        done
      done
    done
  done

  for compact in "${_COMPA_VARIANTS[@]}"; do
    for color in "${_COLOR_VARIANTS[@]}"; do
      for solid in "${_SOLID_VARIANTS[@]}"; do
        for alt in "${_ALT_VARIANTS[@]}"; do
          tar -cf ${THEME_NAME}${compact}${color}${solid}${alt}.tar ${THEME_NAME}${compact}${color}${solid}${alt}
        done
      done
    done
  done
}

Xz_files() {
  for compact in "${_COMPA_VARIANTS[@]}"; do
    for color in "${_COLOR_VARIANTS[@]}"; do
      for solid in "${_SOLID_VARIANTS[@]}"; do
        for alt in "${_ALT_VARIANTS[@]}"; do
          xz -z ${THEME_NAME}${compact}${color}${solid}${alt}.tar
        done
      done
    done
  done
}

Tar_themes && Xz_files

