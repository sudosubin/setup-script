#!/bin/bash

set_auto_login() {
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

  # Set auto login
  msg_step "Set auto login"

  # override getty tty1 service
  sudo mkdir -p /etc/systemd/system/getty@tty1.service.d

  echo "[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin $USER --noclear %I \$TERM
" | silent sudo tee "/etc/systemd/system/getty@tty1.service.d/override.conf";
}
