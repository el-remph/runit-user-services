Runit User Services
===================

This is my setup for runit user services (on [Void]), as an alternative to
login daemons like [logind][systemd] or [turnstile], or init systems that
have first-class support for user services like [systemd] or the excellent
[dinit].

[Void]:	https://voidlinux.org
[systemd]:	https://nosystemd.org
[turnstile]:	https://github.com/chimera-linux/turnstile
[dinit]:	https://davmac.org/projects/dinit

The main purpose of this is just to manage a sway session, gathering together
in one dedicated location and properly supervising and logging services which
would otherwise have been handled:

- from shell `.profile` like [ssh-agent(1)]
- from chain-loading wrappers like [dbus-run-session(1)] (also
  [ssh-agent(1)] as an alternative)
- with ad-hoc tools, like [dbus-launch(1)] which only works with X11 and
  not with pure Wayland or outside a graphical context
- with XDG autostart, such as pipewire & friends
- from a window manager config/init/rc file, such as also pipewire
- from a .desktop launcher, like [foot]

[ssh-agent(1)]:	https://man.openbsd.org/ssh-agent.1
[dbus-run-session(1)]:	https://dbus.freedesktop.org/doc/dbus-run-session.1.html
[dbus-launch(1)]:	https://dbus.freedesktop.org/doc/dbus-launch.1.html
[foot]:	https://codeberg.org/dnkl/foot/src/branch/master/foot-server.desktop


Usage
-----

Ideally, install to `$HOME/.config/runit`; some of this scripts in util/
assume installation there, but mostly it works based on relative pathnames
so shouldn't be hard to adapt to other locations. `XDG_RUNTIME_DIR` is
expected to be set in the environment (I use [dumb_runtime_dir] for this).

Before starting it for the first time, it is recommended to run
[util/ln_supervise.sh], which will setup \<supervise\> symlinks to
`$XDG_RUNTIME_DIR`, which ensures that state will be properly cleaned
up between sessions and stale state won't be carried over between
boots. runsvdir(8) should then be started with [util/start.sh], which makes
sure the environment is alright.

[util/ln_supervise.sh]:	util/ln_supervise.sh
[util/start.sh]:	util/start.sh
[dumb_runtime_dir]:	https://github.com/ifreund/dumb_runtime_dir


See also
--------

- [madand/runit-services](https://github.com/madand/runit-services), which
  is more of a thorough framework than the quick scripts here, and which I
  plagiarised while making this.
- [The Gentoo wiki](https://wiki.gentoo.org/wiki/OpenRC/User_services#Using_runsvdir_.28part_of_Runit.29)
  on user services with runit
- [The official runit documentation](https://smarden.org/runit/useinit.html)
  on this
