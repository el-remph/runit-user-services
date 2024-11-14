# Config variables
dbus_session_bus=$XDG_RUNTIME_DIR/bus
ssh_auth_sock=$XDG_RUNTIME_DIR/ssh-agent

# Should be sourced, ideally with set -eu
if test -S "$dbus_session_bus"; then
	export DBUS_SESSION_BUS_ADDRESS="unix:path=$dbus_session_bus"
fi
if test -S "$ssh_auth_sock"; then
	export SSH_AUTH_SOCK=$ssh_auth_sock
fi
