#!/bin/bash

install_hancom() {
  # Directory
  local current_dir
  local script_dir
  local app_dir

  current_dir="$(dirname "${BASH_SOURCE[0]}")"
  script_dir="$(dirname "$current_dir")"
  app_dir="$(dirname "$(dirname "$(dirname "$script_dir")")")"

  # shellcheck source=../../../../src/utils/msg.sh
  source "$app_dir/src/utils/msg.sh"
  # shellcheck source=../../../../src/utils/stdout.sh
  source "$app_dir/src/utils/stdout.sh"

  # Install hancom
  msg_step "Install hancom"

  # settings
  msg_normal "download deb"
  local download="http://update.hancomgooroom.com/hancom/pool/main/h/hancom-toolkit/hancom-toolkit_0.2.2+han2u1_amd64.deb"
  curl -sL "$download" -o "hancom.deb"

  msg_normal "install deb"
  output_box sudo dpkg -i hancom.deb
  rm -r hancom.deb
}
