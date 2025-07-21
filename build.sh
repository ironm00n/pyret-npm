#!/bin/bash
set -e

rm -rf pyret-lang
git clone --single-branch -b fix/poly-fun-alias https://github.com/ironm00n/pyret-lang.git

pushd pyret-lang
npm install
make phaseA libA
touch .npmignore
popd

