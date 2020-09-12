#! /bin/bash

THEME_DIR=$(cd $(dirname $0) && pwd)

THEME_NAME=McMojave-circle

_THEME_VARIANTS=('' '-red' '-pink' '-purple' '-blue' '-green' '-yellow' '-orange' '-brown' '-grey' '-black')

if [ ! -z "${THEME_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _THEME_VARIANTS <<< "${THEME_VARIANTS:-}"
fi

Tar_themes() {
  for theme in "${_THEME_VARIANTS[@]}"; do
    rm -rf ${THEME_NAME}${theme}.tar
    rm -rf ${THEME_NAME}${theme}.tar.xz
  done

  for theme in "${_THEME_VARIANTS[@]}"; do
    tar -cf ${THEME_NAME}${theme}.tar ${THEME_NAME}${theme} ${THEME_NAME}${theme}-dark
  done
}

Xz_files() {
  for theme in "${_THEME_VARIANTS[@]}"; do
    xz -z ${THEME_NAME}${theme}.tar
  done
}

Tar_themes && Xz_files

