#!/bin/sh
# Vercel build: the solver is Rust compiled to WebAssembly, so install the
# toolchain on the build machine, then run the normal webpack release build.
set -eu
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
  | sh -s -- -y --profile minimal --target wasm32-unknown-unknown
export PATH="$HOME/.cargo/bin:$PATH"
curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh
npm run release-build
