#!/bin/sh

# Start X
if [ "$(tty)" == "/dev/tty1" ] && [ "$UID" -ne 0 ] && [ -z "$DISPLAY" ]; then
	if [ -n "${BASH_VERSION}" ]; then
		echo -e "\e[1;32mStarting X ...\e[m"
	else
		echo "Starting X ..."
	fi

	startxargs="$X_CLIENT_ARGS"
	if [ -n "$X_SERVER_ARGS" ]; then
		startxargs="$startxargs -- $X_SERVER_ARGS"
	fi

	if [ -e "$HOME/.Xsession" ]; then
		mv "$HOME/.Xsession" "$HOME/.Xsession.old"
	fi

	stty -isig

	startx $startxargs 2>&1 | tee "$HOME/.Xsession"
	logout
fi
