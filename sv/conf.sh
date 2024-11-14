# Should be sourced, ideally with set -eu
test -S "$XDG_RUNTIME_DIR/bus" && export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"
test -S "$XDG_RUNTIME_DIR/ssh-agent" && export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent
