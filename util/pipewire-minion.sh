#!/bin/sh
# This a generic script to be linked to by dependants of pipewire

exec 2>&1
set -efu
sv start pipewire # Hard depend on pipewire
. "$SVDIR"/../conf.sh # dbus session address

exec "${PWD##*/}"