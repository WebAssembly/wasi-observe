default:
  @just --choose

_prepare:
  #!/bin/bash
  if ! &>/dev/null which cargo; then
    >&2 echo 'Install Rust: https://rustup.rs/'
    exit 1
  fi

  if ! &>/dev/null which wit-deps; then
    cargo install wit-deps-cli@0.3.4
  fi

  if ! &>/dev/null which wit-bindgen; then
    cargo install wit-bindgen-cli@0.16.0
  fi

build:
  wit-bindgen markdown wit --html-in-md
