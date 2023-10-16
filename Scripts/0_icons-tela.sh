#! /bin/bash

THEME_DIR=$(cd $(dirname $0) && pwd)

THEME_NAME=Tela

_THEME_VARIANTS=('' '-dracula' '-purple' '-blue' '-black' '-manjaro' '-ubuntu' '-nord' '-red' '-grey' '-green')

if [ ! -z "${THEME_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _THEME_VARIANTS <<< "${THEME_VARIANTS:-}"
fi

Tar_themes() {
  for theme in "${_THEME_VARIANTS[@]}"; do
    rm -rf ${THEME_NAME}${theme}.tar
    rm -rf ${THEME_NAME}${theme}.tar.xz
  done

  for theme in "${_THEME_VARIANTS[@]}"; do
    tar -cf ${THEME_NAME}${theme}.tar ${THEME_NAME}${theme} ${THEME_NAME}${theme}-dark ${THEME_NAME}${theme}-light
  done
}

Xz_files() {
  for theme in "${_THEME_VARIANTS[@]}"; do
    xz -z ${THEME_NAME}${theme}.tar
  done
}

Tar_themes && Xz_files

