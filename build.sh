#!/usr/bin/env bash
set -e

rm -rf pyret-lang
git clone --single-branch -b unmerged https://github.com/ironm00n/pyret-lang.git

pushd pyret-lang

# npm publish (and npm pack) run all lifecycle scripts in "dry-run" mode.
# If we don’t override that flag, nested npm command only *pretend* to
# install: they print “added ... packages” but write no node_modules tree, so
# later steps (like browserify) fail. We therefore force a real install
# by passing --dry-run=false.
npm ci --dry-run=false

make phaseA libA
touch .npmignore
popd

