#!/bin/bash

# Directory
current_dir="$(dirname "${BASH_SOURCE[0]}")"
script_dir="$(dirname "$current_dir")"
app_dir="$(dirname "$(dirname "$(dirname "$script_dir")")")"

# shellcheck source=chromium.sh
source "$script_dir/libs/chromium.sh"

# shellcheck source=vscodium.sh
source "$script_dir/libs/vscodium.sh"

# alacritty
add_ppa_alacritty() {
  # Add ppa: mmstick76/alacritty
  msg_step "Add ppa: mmstick76/alacritty"
  sudo add-apt-repository -ny ppa:mmstick76/alacritty
}

# applet-window-buttons
add_ppa_applet_window_buttons() {
  # Add ppa: krisives/applet-window-buttons
  msg_step "Add ppa: krisives/applet-window-buttons"
  sudo add-apt-repository -ny ppa:krisives/applet-window-buttons
}

# nimf
add_ppa_nimf() {
  # Add ppa: nemonein/nimf
  msg_step "Add ppa: nemonein/nimf"
  sudo add-apt-repository -ny ppa:nemonein/nimf
}

# yarn
add_ppa_yarn() {
  current_dir="$(dirname "${BASH_SOURCE[0]}")"
  script_dir="$(dirname "$current_dir")"
  app_dir="$(dirname "$(dirname "$(dirname "$script_dir")")")"

  # shellcheck source=../../../../src/utils/ppa.sh
  source "$app_dir/src/utils/ppa.sh"

  # Add ppa: yarn
  msg_step "Add ppa: yarn"

  local yarn_repo="https://dl.yarnpkg.com"
  
  add_ppa yarn \
    "$yarn_repo/debian/pubkey.gpg" \
    "deb $yarn_repo/debian/ stable main"
}