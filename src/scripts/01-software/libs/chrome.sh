#!/bin/bash

add_ppa_chrome() {
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
  # shellcheck source=../../../../src/utils/ppa.sh
  source "$app_dir/src/utils/ppa.sh"

  # Add ppa: chrome
  msg_step "Add ppa: chrome"

  local chrome_repo="https://dl.google.com/linux"

  add_ppa google-chrome \
    "$chrome_repo/linux_signing_key.pub" \
    "deb [arch=amd64] $chrome_repo/chrome/deb/ stable main"
}
