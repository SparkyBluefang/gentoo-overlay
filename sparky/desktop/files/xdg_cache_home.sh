#!/bin/sh

if [ $UID -ne 0 ]; then
	export XDG_CACHE_HOME="/run/user/$UID/.cache"
	export KPXC_CONFIG_LOCAL="$HOME/.local/share/keepassxc/keepassxc.ini"
fi
