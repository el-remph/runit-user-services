#!/bin/sh
set -efux +m
mkdir -p "$XDG_RUNTIME_DIR"/runit
export SVDIR=~/.config/runit/sv
exec runsvdir ~/.config/runit/runsvdir/current
