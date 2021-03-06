#!/bin/bash

scripts_02() {
  # Directory
  local current_dir
  local app_dir

  current_dir="$(dirname "${BASH_SOURCE[0]}")"
  app_dir="$(dirname "$(dirname "$(dirname "$current_dir")")")"

  # Function
  # shellcheck source=../../../src/utils/msg.sh
  source "$app_dir/src/utils/msg.sh"
  # shellcheck source=../../../src/utils/stdout.sh
  source "$app_dir/src/utils/stdout.sh"
  # shellcheck source=libs/index.sh
  source "$current_dir/libs/index.sh"

  # 02. Basic Installation
  msg_title "02. Basic Installation"

  # Install softwares
  msg_heading "Install softwares"
  uninstall_bloats
  install_requirements
  install_kime
  install_zsh

  # Configure softwares
  msg_heading "Configure softwares"
  install_vscodium

  # fix mako
  silent sudo aa-disable /etc/apparmor.d/fr.emersion.Mako

  # Build softwares
  msg_heading "Build softwares"
  install_la_capitaine_icon_theme
}
