# Meant to be sourced, to import sway environment

sv check sway

swaypid=$(cat "$SVDIR"/sway/supervise/pid)
export SWAYSOCK=$XDG_RUNTIME_DIR/sway-ipc.$(id -u).$swaypid.sock
swayenv=$XDG_RUNTIME_DIR/swayenv.$swaypid

if test ! -e "$swayenv"; then
	# `&&' is used here because swaymsg messes with `;'. $swayenv is recreated
	# to avoid having to quote it
	swaymsg exec -- umask a-w '&&' set \| sed -En "'/^((I3|SWAY)SOCK|(WAYLAND_)?DISPLAY|XCURSOR_(SIZE|THEME)|XDG_SESSION_TYPE)=/s/^/export /p'" ">\$XDG_RUNTIME_DIR/swayenv.$swaypid"
fi

. "$XDG_RUNTIME_DIR/swayenv.$swaypid"
