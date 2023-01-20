# Setup common aliases

alias dmesg='/bin/dmesg -s 33554432 --time-format iso'
alias ll='ls -la --group-directories-first'

alias kcgrep='grep -rP $1 --include="Kconfig*"'
kcdiff() { diff -y --suppress-common-lines <(cat "$1" | sort) <(cat "$2" | sort); }
