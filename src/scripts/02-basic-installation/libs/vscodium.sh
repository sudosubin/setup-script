#!/bin/bash

install_vscodium() {
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

  # Configure vscodium
  msg_step "Configure vscodium"

  # install vscodium extensions
  msg_normal "install vscodium extensions (takes long time)"
  {
    # theme
    codium --install-extension zhuangtongfa.Material-theme
    codium --install-extension PKief.material-icon-theme
    codium --install-extension iocave.customize-ui

    # language (python)
    codium --install-extension ms-python.python
    codium --install-extension ms-pyright.pyright

    # language (javascript)
    codium --install-extension dbaeumer.vscode-eslint
    codium --install-extension esbenp.prettier-vscode
    codium --install-extension jpoissonnier.vscode-styled-components
    codium --install-extension flowtype.flow-for-vscode

    # language (java)
    codium --install-extension redhat.java
    codium --install-extension fwcd.kotlin

    # language (bash)
    codium --install-extension timonwong.shellcheck
    codium --install-extension exiasr.hadolint

    # language (etc)
    codium --install-extension usernamehw.errorlens
    codium --install-extension bungcip.better-toml

    # etc
    codium --install-extension eamodio.gitlens
    codium --install-extension shardulm94.trailing-spaces
    codium --install-extension yzhang.markdown-all-in-one
    codium --install-extension davidanson.vscode-markdownlint
  } | output_box cat

  # remove cached directory
  rm -rf ~/.config/VSCodium/CachedExtensionVSIXs
}
