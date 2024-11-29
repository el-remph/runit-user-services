#!/bin/sh
set -efux +m
cd ~/.config/runit/runsvdir
exec ln -Tfsv -- "$*" current
