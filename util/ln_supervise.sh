#!/bin/sh
set -ux
rundir=$XDG_RUNTIME_DIR/runit
test -d "$rundir" || mkdir "$rundir"

# These symlinks may start out broken; runsv(8) should take care of that
for svdir; do
	svname=`basename "$svdir"`
	svdir=${svdir%/}
	ln -Ts "$rundir/supervise.$svname" "$svdir/supervise"
	ln -Ts "$rundir/supervise.$svname-log" "$svdir/log/supervise"
done
