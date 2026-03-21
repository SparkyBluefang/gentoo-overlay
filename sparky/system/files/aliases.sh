# Setup common aliases

alias dmesg='/bin/dmesg -s 33554432 --time-format iso'
alias ll='ls -la --group-directories-first'

alias kcgrep='grep -rP $1 --include="Kconfig*"'

_kcdiff_prep() {
	cat "$1" | sort | grep -v \
		-e "^CONFIG_ARCH_" \
		-e "^CONFIG_AS_" \
		-e "^CONFIG_CC_" \
		-e "^CONFIG_GCC_" \
		-e "^CONFIG_HAVE_" \
		-e "^CONFIG_LD_" \
		-e "^CONFIG_RUSTC_";
}

kcdiff() {
	local F1=${@: -2:1}
	local F2=${@: -1:1}

	if [ $# -lt 2 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ] || [ ! -f "$F1" ] || [ ! -f "$F2" ]; then
		echo "kcdiff [-v] file1 file2"
		return
	fi

	if [ "$1" = "-v" ] || [ "$1" = "--verbose" ]; then
		diff -y --suppress-common-lines <(cat "$F1" | sort) <(cat "$F2" | sort)
	else
		diff -y --suppress-common-lines <(_kcdiff_prep "$F1") <(_kcdiff_prep "$F2")
	fi
}
