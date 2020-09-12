#! /bin/bash

THEME_DIR=$(cd $(dirname $0) && pwd)

THEME_NAME=Qogir

_win_VARIANTS=('' '-win')
_COLOR_VARIANTS=('' '-light' '-dark')

if [ ! -z "${win_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _win_VARIANTS <<< "${win_VARIANTS:-}"
fi

if [ ! -z "${COLOR_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _COLOR_VARIANTS <<< "${COLOR_VARIANTS:-}"
fi

Tar_themes() {
  for win in "${_win_VARIANTS[@]}"; do
    for color in "${_COLOR_VARIANTS[@]}"; do
      rm -rf ${THEME_NAME}${win}${color}.tar
      rm -rf ${THEME_NAME}${win}${color}.tar.xz
    done
  done

  for win in "${_win_VARIANTS[@]}"; do
    for color in "${_COLOR_VARIANTS[@]}"; do
      tar -cf ${THEME_NAME}${win}${color}.tar ${THEME_NAME}${win}${color}
    done
  done
}

Xz_files() {
  for win in "${_win_VARIANTS[@]}"; do
    for color in "${_COLOR_VARIANTS[@]}"; do
      xz -z ${THEME_NAME}${win}${color}.tar
    done
  done
}

Tar_themes && Xz_files

